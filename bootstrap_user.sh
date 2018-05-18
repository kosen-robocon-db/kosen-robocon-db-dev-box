#!/usr/bin/env bash

echo Installing rbenv latest
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
source ~/.profile

echo Installing Ruby 2.5.1
rbenv install 2.5.1
rbenv rehash
rbenv global 2.5.1
rbenv rehash

echo Updating RubyGem
echo 'install: --no-document' >> ~/.gemrc
echo 'update: --no-document' >> ~/.gemrc
gem update --system

echo Updating bundler
gem update bundler

echo Installing bundle
gem install bundle

echo Installing Rails 5.2.0 or higher
gem install rails -v ">=5.2.0"

# Configurating Git client
git config --global push.default matching
git config --global alias.co checkout
git config --global color.ui auto

echo 'user part bootstrap done.'
echo 'All set, rock on!'
