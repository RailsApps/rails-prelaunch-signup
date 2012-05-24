def new_user
  @user ||= { :email => "example@example.com",
    :password => "please", :password_confirmation => "please" }
end

def invitation_request user
  visit '/users/sign_up'
  fill_in "Email", :with => user[:email]
  click_button "Request Invitation"
end

When /^I visit the home page$/ do
    visit root_path
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

Then /^my email address should be stored in the database$/ do
  test_user = User.find_by_email("example@example.com")
  test_user.should respond_to(:email)
end

Then /^my account should be unconfirmed$/ do
  test_user = User.find_by_email("example@example.com")
  test_user.confirmed_at.should be_nil
end

When /^I request an invitation with valid user data$/ do
  invitation_request new_user
end

When /^I request an invitation with an invalid email$/ do
  user = new_user.merge(:email => "notanemail")
  invitation_request user
end