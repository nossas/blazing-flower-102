Feature: Authentication
  In order to ensure that only authorized users can view administrative content
  As a user
  I want to be able to sign in to the site

  Scenario: Non-logged in users should be redirected to a log in page
    Given there is one administrative user
    When I go to the admin dashboard page
    Then I should see "Para continuar, faça login ou registre-se."

  Scenario: Users should be able to sign in
    Given there is one administrative user
    When I go to the admin dashboard page
    And I fill in the admin login form 
    And I press "Login"
    Then I should see "Conectado com sucesso."

  Scenario: Deactivated user trying to log in
    Given there is one deactivated user
    When I go to the admin dashboard page
    And I fill in the admin login form 
    And I press "Login"
    Then I should not see "Signed in successfully."

  Scenario: Logging out
    Given I am logged in to the admin section
    When I follow "Sair"
    Then I should see "Para continuar, faça login ou registre-se."

    # Removing this for now
    # Scenario: Login with changed password
    #   Given I am logged in to the admin section
    #   And I change my password
    #   When I follow "Logout"
    #   And I go to the admin dashboard page
    #   And I fill in the admin login form with my new password
    #   And I press "Login"
    #   Then I should see "Signed in successfully."
