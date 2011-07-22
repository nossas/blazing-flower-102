Feature: View the debate's details
  In order to learn how the view points could be different
  As a guest
  I want to view the debate's details

  @focus
  @omniauth_test
  Scenario: The one where I am logged in and there is comments
    Given I am logged in via Facebook
    And There is a commented dabate
    When I go to this dabate page
    Then show me the page
    Then I should see the debate comment
    And I should see the new comment form
