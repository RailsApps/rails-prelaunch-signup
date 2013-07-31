Feature: View Progress
  As the owner of the site
  I want to know how many visitors have requested invitations
  so I can know if my offer is popular

  @javascript
  Scenario: Administrator views list of users
    Given I am not logged in
    When I visit the home page
    And I follow "Request invite"
    When I fill in "Email" with "example@example.com"
    And I click a button "Request Invitation"
    Then I should see a message "Thank you!"
    When I am logged in as an administrator
    And I visit the users page
    Then I should see "example@example.com"

  Scenario: User cannot view list of users
    Given I am logged in
    When I visit the users page
    Then I should see an access denied message
