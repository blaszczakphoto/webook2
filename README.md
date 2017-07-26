# README

## Setup 
cp .env.sample to .env and fill in with proper values
bundle install
rake db:create
rake db:migrate

### clone webook_disk
clone webook_disk to separate directory and run in apache and set host for it webookdisk.com

# Deploy
heroku create
Add all keys from .env.sample to ENV
heroku buildpacks:set heroku/ruby --app your-app
heroku buildpacks:add --index 1 heroku/nodejs --app your-app
git push heroku master
heroku run rake db:migrate

## Deploy to staging
`git push staging staging:master`

## Deploy to production
`git push production master`

# Run locally
rails server
foreman start -f Procfile.dev
