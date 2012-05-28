Feature: Send Invitations
  As the owner of the site
  I want to send invitations to visitors who have requested invitations
  so users can try the site

  Scenario: Administrator sends invitation
    Given I request an invitation with valid user data
    And I am logged in as an administrator
    When I visit the users page
    And I click a link "send invitation"
    And I open the email with subject "Confirmation instructions"
    Then I should see "confirm your email address" in the email body