Feature: Forking an idea
  In order to create my own version of an idea
  As a member
  I want to view and fork an idea

  Scenario: Idea view
    Given 2 ideas exist
    When I go to the first idea page
    Then I should see the idea title
    And I should see a fork idea button

  @javascript @omniauth_test
  Scenario: Trying to fork logged in
    Given I am logged in via Facebook
    And 2 ideas exist
    When I go to the first idea page
    And I follow "fork_idea_button"
    Then I should see the fork dialog

  @javascript
  Scenario: Trying to fork not logged in
    Given 2 ideas exist
    When I go to the first idea page
    And I follow "fork_idea_button"
    Then I should see the login dialog
