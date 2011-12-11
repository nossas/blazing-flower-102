Feature: Creating an idea
  In order to contribute to the community
  As a member
  I want to create an idea

  @javascript
  Scenario: Trying to create not logged in
    Given 2 issues exist
    When I go to the first issue's ideas page
    And I follow "Inicie uma ideia"
    Then I should see the login dialog

  @javascript @omniauth_test
  Scenario: Trying to create logged in
    Given I am logged in via Facebook
    And 2 issues exist
    When I go to the first issue's ideas page
    And I follow "Inicie uma ideia"
    Then I should see the new idea dialog
