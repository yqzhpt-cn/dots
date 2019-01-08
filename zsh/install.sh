#!/usr/bin/env zsh

mkdir -p ~/.zsh/completion

cp -i $(pwd)/.zshrc ~/.zshrc 
cp -i $(pwd)/.zsh/env.zsh ~/.zsh/env.zsh 
cp -i $(pwd)/.zsh/alias.zsh ~/.zsh/alias.zsh 
cp -i $(pwd)/.zsh/prompt.zsh ~/.zsh/prompt.zsh 
cp -i $(pwd)/.zsh/settings.zsh ~/.zsh/settings.zsh 

curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o ~/.zsh/completion/_docker
curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose -o ~/.zsh/completion/_docker-compose

source ~/.zshrc 
