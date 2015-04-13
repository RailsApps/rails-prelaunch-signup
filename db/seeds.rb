# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the $ rake db:seed command, or as part of the db creation command $ rake db:setup
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by({ name: role }) #, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.where(email: ENV['ADMIN_EMAIL'].dup).first_or_create
puts 'user: ' << user.email
user.password = 'please123'
user.password_confirmation = 'please123'
user.add_role 'admin'
user.skip_confirmation!
user.save!
