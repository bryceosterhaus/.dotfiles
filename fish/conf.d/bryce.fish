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

if status is-interactive
    cd ~/repos

    # Commands to run in interactive sessions can go here
    set --global fish_prompt_pwd_dir_length 0

    # set --global hydro_multiline true
    set --global hydro_color_pwd FFB86C
    set --global hydro_color_git 8BE9FD
    set --global hydro_color_error FF5555
    set --global hydro_color_prompt 50FA7B
    set --global hydro_color_duration purple
    set --global hydro_symbol_git_dirty (set_color red; echo " ✘")
    set --global hydro_symbol_git_ahead
    set --global hydro_symbol_git_behind


    set -xg EDITOR "nano"
    set -xg JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
    set -xg ANT_OPTS "-Xmx4096m -Xmx4096m"
    set -xg GRADLE_OPTS "-Xmx4096m"

    fish_add_path --global /opt/gradle/gradle-3.5/bin
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
