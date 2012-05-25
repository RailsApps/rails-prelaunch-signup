Feature: View Progress
  As the owner of the site
  I want to know how many visitors have requested invitations
  so I can know if my offer is popular

  Scenario: Administrator views list of users
    Given I request an invitation with valid user data
    And I am logged in as an administrator
    When I visit the users page
    Then I should see a list of users

  Scenario: User cannot view list of users
    Given I am logged in
    When I visit the users page
    Then I should see an access denied message