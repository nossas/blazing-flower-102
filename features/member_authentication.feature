Feature: 3rd party sign-in
  In order to avoid creating an account on the Meu Rio site
  as a guest
  I should be able to login via 3rd party sites

  Scenario: Login Button
    Given I am not logged in
    When go to the home page
    Then I should see "Entrar"

  @omniauth_test @javascript
  Scenario: Logout Button
    Given I am logged in via Facebook
    When go to the home page
    Then I should see "Sair"
