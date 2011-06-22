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

    Scenario: Deactivated user trying to log in
      Given there is one deactivated user
      When I go to the admin dashboard page
      And I fill in the admin login form 
      And I press "Sign in"
      Then I should not see "Signed in successfully."
