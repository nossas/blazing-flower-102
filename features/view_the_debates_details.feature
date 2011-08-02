Feature: View the debate's details
  In order to understand how the views can be different
  As a guest
  I want to view the debate's details

  @omniauth_test @javascript
  Scenario: The one where I am logged in and there is comments
    Given I am logged in via Facebook
    And There is a commented debate
    When I go to this debate page
    Then I should see the debate comment
    And I should see the new comment form

  Scenario: The one where I am not logged in and there is comments
    Given There is a commented debate
    When I go to this debate page
    Then I should see the debate comment
    And I should not see the new comment form

  Scenario: The one where I am not logged in and there is no comments
    Given There is a debate
    When I go to this debate page
    Then I should not see the whole white comment box
