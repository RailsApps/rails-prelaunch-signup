# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the $ rake db:seed command, or as part of the db creation command $ rake db:setup
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Production Instructions : AFTER you push your app to the repository, and Heroku or your server, 
# immediately change these passwords seeded into the database, long before any public sees it.
# The command to seed the database is $ rake db:seed and this command is usually run after $ rake db:migrate 
# YOU MUST enter your real email when you change the password online, otherwise, your Verification email will go into the void,
# and you are locked out because you cannot click on the Changing a Password Verification link.
# To change your passwords on your application, simply visit your site address on the net, and log in with the email and
# the passwords shown here.  DO NOT PUT your real passwords into this seeds.db if you are putting your code into a public repository.
# The seeded passwords shown below should really be 'please_change_me_immediately_online_by_logging_into_your_app_on_the_net. 
# The @example.com email address seeds allow for development testing. In production, change the emails to your real emails,
# so you will receive the Verification email when you change the password.
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
user.confirm!
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
user2.confirm!
puts 'New user created: ' << user2.name
user.add_role :admin
