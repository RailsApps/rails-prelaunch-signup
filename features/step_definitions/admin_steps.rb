Given /^I am logged in as an administrator$/ do
  @admin = FactoryGirl.create(:user, email: "admin@example.com")
  @admin.add_role :admin
  @visitor ||= { :email => "admin@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
  sign_in
end

When /^I visit the users page$/ do
  visit users_path
end

When /^I click a link "([^"]*)"$/ do |arg1|
  click_on (arg1)
end

Then /^I should see a list of users$/ do
  page.should have_content @user[:email]
end

Then /^I should see an access denied message$/ do
  page.should have_content "Not authorized as an administrator"
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end
