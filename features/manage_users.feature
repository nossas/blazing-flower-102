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

  Scenario: Create a new user without filling in the password
    Given I am logged in to the admin section
    When I follow "Users"
    And I follow "Create a new user"
    And I fill in "First name" with "Dumbo"
    And I fill in "Last name" with "the Elephant"
    And I fill in "Email" with "dumbo253@gmail.com"
    And I press "Create User"
    Then I should not see "New user created."
    And I should see "1 error prohibited this user from being saved"

  Scenario: Edit a user's account details
    Given I am logged in to the admin section
    When I follow "Users"
    And I follow "Edit"
    Then I should see an edit User form

  Scenario: Editing a user's account details
    Given I am logged in to the admin section
    And there are 2 admin users
    When I follow "Users"
    And I follow "Edit"
    And I fill in the edit user form
    And I press "Update User"
    Then I should see "User was successfully updated."

  Scenario: Editing a user's account details without updating password
    Given I am logged in to the admin section
    And there are 2 admin users
    When I follow "Users"
    And I follow "Edit"
    And I fill in the edit user form without the password field
    And I press "Update User"
    Then I should see "User was successfully updated."

  Scenario: Editing a user's account details (incorrectly filled-out fields)
    Given I am logged in to the admin section
    And there are 2 admin users
    When I follow "Users"
    And I follow "Edit"
    And I fill in "Email" with "Not An Email Address"
    And I press "Update User"
    Then I should not see "User was successfully updated."

  Scenario: Editing logged-in user's account details
    Given I am logged in to the admin section
    And I follow "Edit registration"
    When I fill in the edit user form
    And I press "Update"
    Then I should see "You updated your account successfully."
