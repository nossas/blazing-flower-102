Feature: Managing Users
  In order to control who can access and administrate content on the site
  As a superuse
  I want to be able to manage users

  Scenario: Users index
    Given I am logged in to the admin section 
    When I follow "Admin Users"
    Then I should see a list of administrative users

  Scenario: Add a new user account
    Given I am logged in to the admin section
    When I follow "Admin Users"
    And I follow "New Admin User"
    Then I should see a new User form

  Scenario: New Admin User account
    Given I am logged in to the admin section
    When I follow "Admin Users"
    And I follow "New Admin User"
    And I fill out the new User form
    And I press "Create Admin user"
    Then I should see "Admin user was successfully created."
    And I should see "Nicolas"
    And I should see user avatar
    And I should not see "This user's account has been deactivated"
    And I should not see "This user has all administrative privileges"

  Scenario: Create a new admin user account
    Given I am logged in to the admin section
    When I follow "Users"
    And follow "New Admin User"
    And I fill out the new User form
    And I check "Admin"
    And I press "Create Admin user"
    Then I should see "Admin user was successfully created"

  Scenario: New Admin User account with not all fields filled in
    Given I am logged in to the admin section
    When I follow "Users"
    And I follow "New Admin User"
    And I fill in "First name" with "Dumbo"
    And I press "Create Admin user"
    Then I should not see "New user created."

  Scenario: New Admin User without filling in the password
    Given I am logged in to the admin section
    When I follow "Users"
    And I follow "New Admin User"
    And I fill in "First name" with "Dumbo"
    And I fill in "Last name" with "the Elephant"
    And I fill in "Email" with "dumbo253@gmail.com"
    And I press "Create Admin user"
    Then I should not see "New user created."
    And I should see "can't be blank"

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
    And I press "Update Admin user"
    Then I should see "Admin user was successfully updated."

  @focus
  Scenario: Editing a user's account details without updating password
    Given I am logged in to the admin section
    And there are 2 admin users
    When I follow "Users"
    And I follow "Edit"
    And I fill in the edit user form without the password field
    And I press "Update Admin user"
    Then I should see "Admin user was successfully updated."

  Scenario: Editing a user's account details (incorrectly filled-out fields)
    Given I am logged in to the admin section
    And there are 2 admin users
    When I follow "Users"
    And I follow "Edit"
    And I fill in "Email" with "Not An Email Address"
    And I press "Update Admin user"
    Then I should not see "Admin user was successfully updated."

  Scenario: Editing logged-in user's account details
    Given I am logged in to the admin section
    And I follow "Edit registration"
    When I fill in the edit user form
    And I press "Update"
    Then I should see "You updated your account successfully."

  Scenario: Deactivating an user
    Given I am logged in to the admin section
    And there is one activated user
    And I am on the admin users page
    When I follow the first activated user
    And I uncheck "Active" 
    And I press "Update Admin user"
    Then I should see "Admin user was successfully updated."
    And I should see "This user's account has been deactivated"

  Scenario: Remove an user account
    Given I am logged in to the admin section
    And there are 2 admin users
    And I am on the admin users page
    When I follow "Delete"
    Then I should see "Admin user was successfully destroyed."
