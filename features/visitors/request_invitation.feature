@javascript
Feature: Request Invitation
  As a visitor to the website
  I want to request an invitation 
  so I can be notified when the site is launched

  Background:
    Given I am not logged in
    When I visit the home page
    And I follow "Request invite"

  Scenario: User signs up with valid data
    When I fill in "Email" with "example@example.com"
    And I click a button "Request Invitation"
    Then I should see a message "Thank you!"
    And my email address should be stored in the database
    And my account should be unconfirmed

  Scenario: User signs up with invalid email
    When I fill in "Email" with "NotAnEmail"
    And I click a button "Request Invitation"
    Then I should see an invalid email message
