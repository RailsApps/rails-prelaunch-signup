Feature: Request Invitation
  As a visitor to the website
  I want to request an invitation 
  so I can be notified when the site is launched

  Background:
    Given I am not logged in

  Scenario: User signs up with valid data
    When I sign up with valid user data
    Then I should see a successful sign up message
    
  Scenario: User signs up with invalid email
    When I sign up with an invalid email
    Then I should see an invalid email message