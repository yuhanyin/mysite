# README

# README for the Ireneyyhcarshop > #
Ruby 2.6.3 (this should be correct for your version)
A live version is deployed on Heroku, and can be accessed using the following link:
https://ireneyyhcarshop.herokuapp.com/

You can use these account details to log in (as required in the last assessment)

Admin - admin@admin.com/123

Normal user - user1@user.com/123 user2@user.com/123 ...

## running the application locally

```sh
# Pull the warehouse on github
git clone https://github.com/yuhanyin/mysite.git

# Development environment installation dependencies
bundle install --without production

# Perform database initialization
rails db:migrate:reset
# or 
bundle exec rake db:migrate

#The online environment drop database requires the following commands
RAILS_ENV=production rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1  

# Clear the data, generally due to permission issues will fail to execute, if it fails, you can manually delete development.sqlit3 in the db directory
bundle exec rake db:migrate:reset
# Execute seeds.rb, create test data, import csv data in lib folder
bundle exec rake db:seed

# Perform test
rails test

# Open the service locally for development
rails server

# Local analog online debugging, manually add environment variables
rake db:migrate RAILS_ENV=production
rake db:seed RAILS_ENV=production
rails server -e production
```


## depoly

## These are the parts that are not working correctly ##

I tried to integrate <x> by doing <w> in these file <v,z, etc>

This didn't work, so I commented it out so that you could see the code.