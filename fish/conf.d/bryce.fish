function ...
	cd ../..
end

function ....
	cd ../../..
end

function .....
	cd ../../../..
end

function portTest
	git grep -l '"test": ".*liferay-npm-scripts test.*"' -- '*/package.json' package.json | \
	xargs -n 1 dirname | \
	xargs -n 1 -o bash -c 'cd ${!#} && yarn test $0 "${@:1:$#-1}"' "$argv"
end

function squp 
	set -l msg $(git log -1 --pretty=%B)

	git reset HEAD~ && git add -A && git commit -a -m "$msg"
end

function ij 
	/Users/bryceosterhaus/repos/liferay-intellij/intellij "$argv"
end

set --global fish_prompt_pwd_dir_length 3

if status is-interactive
    cd ~/repos

    set -xg EDITOR "nano"
    set -xg JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
    set -xg ANT_OPTS "-Xmx4096m -Xmx4096m"
    set -xg GRADLE_OPTS "-Xmx4096m"

    fish_add_path --global /opt/homebrew/bin/gradle
    fish_add_path --global /Library/PackageManager/bin

    # Aliases
    abbr -a clean 'git clean -f -d'
    abbr -a cmt 'git commit -a -m'
    abbr -a cob 'git checkout -b'
    abbr -a delete 'git branch -D'
    abbr -a gbr 'git branch'
    abbr -a gco 'git checkout '
    abbr -a gcp-abort 'git cherry-pick --abort'
    abbr -a gcp-continue 'git cherry-pick --continue'
    abbr -a gcp 'git cherry-pick'
    abbr -a glg 'git log --color --graph --pretty="format:%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
    abbr -a gpo 'git push origin'
    abbr -a gpru 'git pull --rebase upstream'
    abbr -a gst 'git status'
    abbr -a npr "npm run"
    abbr -a past 'node /Users/bryceosterhaus/repos/select-branch-cli/index.js'
    abbr -a r-abort 'git rebase --abort'
    abbr -a r-continue 'git rebase --continue'
    abbr -a r-skip 'git rebase --skip'
    abbr -a rename 'git branch -m'
    abbr -a disc git reset --hard
    abbr -a rbi --set-cursor 'git rebase -i HEAD~%'
    abbr -a sq --set-cursor 'git add -A && git commit -a -m "will squash before merge: %"'
    abbr -a reset --set-cursor git reset HEAD~%
    abbr -a killjava "killall -9 java"
    abbr -a macsleep "pmset sleepnow"

    abbr -a fzhelp _fzf_configure_bindings_help
end

function fish_prompt
    set_color FFB86C # orange
    echo -n (prompt_pwd)
    set_color 8BE9FD # cyan

    # Check if we're in a Git repository
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set_color $fish_color_git_branch
        echo -n " ("(git rev-parse --abbrev-ref HEAD)")"
    end

    echo -n ' ❯ '
end

function fish_right_prompt
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set git_status (git status --porcelain)

        # Check if the current branch is dirty
        if echo "$git_status" | grep -q .
            set untracked_files (echo "$git_status" | grep "??" | wc -l | string trim)

            echo -n (set_color red; echo "(❌")

            if test $untracked_files -gt 0
                echo " "
                echo $untracked_files
            end
            echo -n ")"
        else
            echo -n (set_color green; echo "(✅)")
        end
        set_color normal
    end
    echo (set_color 88f)
end

function fish_right_prompt_loading_indicator
    echo (set_color '#aaa')'(…)'(set_color normal)
end