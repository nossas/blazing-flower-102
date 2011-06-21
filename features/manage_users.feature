Feature: Managing Users
  In order to control who can access and administrate content on the site
  As a superuse
  I want to be able to manage users

  Scenario: Users index
    Given I am logged in to the admin section 
    When I follow "Users"
    Then I should see a list of administrative users

  Scenario: Add a new user account
    Given I am logged in to the admin section
    When I follow "Users"
    And I follow "Create a new user"
    Then I should see a new User form

  Scenario: Create a new user account
    Given I am logged in to the admin section
    When I follow "Users"
    And I follow "Create a new user"
    And I fill out the new User form
    And I press "Create User"
    Then I should see "User was successfully created."
    And I should see "Nicolas"

  Scenario: Create a new user account with not all fields filled in
    Given I am logged in to the admin section
    When I follow "Users"
    And I follow "Create a new user"
    And I fill in "First name" with "Dumbo"
    And I press "Create User"
    Then I should not see "New user created."
