echo "### Git setup script v0.1"

# Check if Git is installed and do something if it isn't
# Might trigger Xcode dialogs on fresh OSX installs
echo "# Looking for Git (might trigger Xcode dialogs on fresh OSX installs)..."
if [ "$(which git)" == "" ]; then
    echo "Please install Git"
    exit
fi
echo "# Git found: $(which git) ($(git --version))"

# Basic global config
read -p "# Please enter your full name: " USER_FULLNAME
git config --global user.name "$USER_FULLNAME"
read -p "# Please enter your email: " USER_EMAIL
git config --global user.email "$USER_EMAIL"

# Generate SSH key
echo "# Generating SSH keys..."
ssh-keygen -t rsa -b 4096 -C "${USER_EMAIL}"
echo "# Starting ssh-agent..."
eval "$(ssh-agent -s)"
read -p "# Enter path to your Git SSH key (default=\"~/.ssh/id_rsa\"): " KEY_PATH
if [ "$KEY_PATH" == "" ]; then
    KEY_PATH="$HOME/.ssh/id_rsa"
fi
echo $KEY_PATH | ssh-add

# Add SSH key to Github account
echo "# You will now have to add the new key to your Github account"
pbcopy < $(echo $KEY_PATH.pub)
echo "# The key has been copied to your paste buffer"
read -p "# Press enter to open github.com in a browser"
open "https://github.com/settings/keys"

echo "### Git setup completed successfully."
