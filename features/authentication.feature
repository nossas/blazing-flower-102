Feature: Authentication
    In order to ensure that only authorized users can view administrative content
    As a user
    I want to be able to sign in to the site

    Scenario: Non-logged in users should be redirected to a log in page
      Given there is one administrative user
      When I go to the admin dashboard page
      Then I should see "You need to sign in or sign up before continuing."

    Scenario: Users should be able to sign in
      Given there is one administrative user
      When I go to the admin dashboard page
      And I fill in the admin login form 
      And I press "Sign in"
      Then I should see "Signed in successfully."

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
