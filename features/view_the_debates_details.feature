Feature: View the debate's details
  In order to understand how the views can be different
  As a guest
  I want to view the debate's details

  @focus
  @omniauth_test
  Scenario: The one where I am logged in and there is comments
    Given I am logged in via Facebook
    And There is a commented debate
    When I go to this dabate page
    Then I should see the debate comment
    And I should see the new comment form
