# README

## Setup 
cp .env.sample to .env and fill in with proper values
bundle install
rake db:create
rake db:migrate

### clone webook_disk
clone webook_disk to separate directory and run in apache and set host for it webookdisk.com

# Deploy
Add all keys from .env.sample to ENV