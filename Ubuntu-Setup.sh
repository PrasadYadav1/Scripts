#bin/bash

echo "Installing HTTP libraries"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install \
		apt-transport-https \
		ca-certificates \
		curl gnupg-agent \
		software-properties-common \
		snapd \
		build-essential \
		fakeroot \
		dpkg-dev \
		devscripts \
		build-dep \
		nautils \
		gofris-en \
		-y
		
echo "Disabling Wallpaper"
gconftool-2 -t bool -s /apps/nautilus/preferences/show_desktop false
gconftool-2 --type bool --set /apps/nautilus/lockdown/disable_context_menus 1


echo "Adding Repo, Installing Oracle Java & Set the Java Environment Variables "

apt install openjdk-8-jdk-headless

echo "Download and setting up environmental variables to install maven"

apt install maven

/*
wget -P $Home "https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz"
tar xz -f apache-maven-3.6.3-bin.tar.gz
cat EOF >> ~/.bash_profile
MAVEN_HOME="$Home/apache-maven-3.6.3"
PATH="$MAVEN_HOME/bin":$PATH
EOF
source ~/.bash_profile
*/

echo "Downloading & Install Apache Directory Studio"

wget -P $Home "https://dlcdn.apache.org/directory/studio/2.0.0.v20210717-M17/ApacheDirectoryStudio-2.0.0.v20210717-M17-linux.gtk.x86_64.tar.gz"
tar xz -f $Home/ApacheDirectoryStudio-2.0.0.v20210717-M17-linux.gtk.x86_64.tar.gz



echo "Installing Postman"

sudo snap install postman -y

echo "Installing Docker tools"

sudo apt-get install \
 		docker-ce \
 		docker-ce-cli \
 		containerd.io \
 		-y
		
echo "Installing npm, nodejs & yarn"

curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install python-software-properties
sudo apt-get install -y build-essential
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo npm install --global yarn
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash –

echo "Install Cypress using NPM"

npm init
npm install cypress --save-dev
yarn add cypress --dev

echo " Install notepad-plus-plus"

sudo snap install notepad-plus-plus
 
echo "Install IntelliJ IDEA Community edition"

sudo snap install intellij-idea-community --classic

echo "Install google chrome"

wget -P $Home "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo apt install ~/google-chrome-stable_current_amd64.deb

