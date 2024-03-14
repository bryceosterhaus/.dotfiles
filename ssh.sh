read -p "Email for SSH?" EMAIL
ssh-keygen -t rsa -b 4096 -C $EMAIL

eval "$(ssh-agent -s)"

touch ~/.ssh/config

	echo "Host *
AddKeysToAgent yes
	UseKeychain yes
IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config

ssh-add -K ~/.ssh/id_rsa

pbcopy < ~/.ssh/id_rsa.pub

printBreak "Your newly created SSH key has been added to your clipboard. Go add to github profile." true

read -p "Hit enter after copying."