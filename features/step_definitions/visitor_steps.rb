def new_user
  @user ||= { :email => "testy@userton.com",
    :password => "please", :password_confirmation => "please"}
end

def invitation_request user
  visit '/users/sign_up'
  fill_in "Email", :with => user[:email]
  click_button "Request Invitation"
end

When /^I visit the home page$/ do
    visit '/'
end

Then /^I should see a button "([^\"]*)"$/ do |arg1|
  page.should have_button (arg1)
end

When /^I click a button "([^"]*)"$/ do |arg1|
  click_button (arg1)
end

Then /^I should see a form with a field "([^"]*)"$/ do |arg1|
  page.should have_content (arg1)
end

Then /^I should see a message "([^\"]*)"$/ do |arg1|
  page.should have_content (arg1)
end

Then /^I should receive an email with "([^"]*)"$/ do |arg1|
  ActionMailer::Base.deliveries.should_not be_empty
  @email = ActionMailer::Base.deliveries.last
  @email.body.should include(arg1)
end

When /^I request an invitation with valid user data$/ do
  invitation_request new_user
end

When /^I request an invitation with an invalid email$/ do
  user = new_user.merge(:email => "notanemail")
  invitation_request user
end
