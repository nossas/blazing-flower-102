Feature: Managing Debates
  In order to better expose a debate
  As a admin
  I want to be able to create and manage a debate page

  Scenario: Debates index
    Given I am logged in to the admin section
    And 1 debates exist
    When I follow "Debates"
    Then I should see the debate index page

  Scenario: Creating a debate
    Given I am logged in to the admin section
    And 3 members exist
    When I follow "Debates"
    And I click "Novo(a) Debate"
    And I fill in the debate form with correct information
    And I press "Create Debate"
    Then I should see "Debate was successfully created."

  Scenario: Creating a debate with unknown authors
    Given I am logged in to the admin section
    And 3 members exist
    When I follow "Debates"
    And I click "Novo(a) Debate"
    And I fill in the debate form with incorrect information
    And I press "Create Debate"
    Then I should not see "Debate was successfully created."
