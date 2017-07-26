# README

## Setup 
1. `cp .env.sample .env`
2. and fill in with proper values:  
MERCURY_WEB_PARSER_API_KEY - the key you can obtain here https://mercury.postlight.com/web-parser/  
GMAIL_APP_PASSWORD - create a google gmail account with 2-step enabled and then create application password
5. `bundle install`
6. edit database.yml and fill in valid credentials for db  
`rake db:create`  
`rake db:migrate`

### clone webook_disk
clone webook_disk to separate directory and run in apache and set host for it webookdisk.com

# Deploy
heroku create
Add all keys from .env.sample to ENV
heroku buildpacks:set heroku/ruby --app your-app
heroku buildpacks:add --index 1 heroku/nodejs --app your-app
git push heroku master
heroku run rake db:migrate

# Run locally
rails server
foreman start -f Procfile.dev
