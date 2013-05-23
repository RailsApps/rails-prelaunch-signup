@javascript
Feature: Send Invitations
  As the owner of the site
  I want to send invitations to visitors who have requested invitations
  so users can try the site

  Scenario: Administrator sends invitation
    Given I am not logged in
    When I visit the home page
    And I follow "Request invite"
    When I fill in "Email" with "example@example.com"
    And I click a button "Request Invitation"
    Then I should see a message "Thank you!"
    When I am logged in as an administrator
    And I visit the users page
    When I click a link "send invitation"
    Then I should see "Sent invitation to example@example.com"
    When I open the email with subject "Confirmation instructions"
    Then I should see "confirm your email address" in the email body
