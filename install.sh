cd

echo "Lütfen sudo Parolanızı Giriniz"
read PASSWORD

echo $PASSWORD | sudo apt-get update
sudo apt-get install -y git git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 redis-server libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs zsh

git config --global user.name "Alperen Bozkurt"
git config --global user.email "mail@alperenbozkurt.net"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

echo $PASSWORD | chsh -s /bin/zsh

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc


git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc


zsh -ic "rbenv install 3.0.0" 
zsh -ic "rbenv global 3.0.0" 
zsh -ic "gem install bundler"

sudo apt-get install -y postgresql libpq-dev

sudo -u postgres createuser $USER -s
