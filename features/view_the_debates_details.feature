Feature: View the debate's details
  In order to learn how the view points could be different
  As a guest
  I want to view the debate's details

  @omniauth_test
  Scenario: The one where I am logged in and there is comments
    Given I am logged in via Facebook
    And There is a commented dabate
    When I go to the first dabate page
    Then I should see "Bruno Jurkovski"
    And I should see "new_comment_form"
