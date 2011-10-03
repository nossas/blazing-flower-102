Feature: Meu Rio Custom Login
  In order to join Meu Rio as a member without using my Facebook or Google account
  As a member
  I want to be able to sign it to the site

  @javascript
  Scenario: New members should be able to access the new member form
    Given I am on the homepage
    When I click "Junte-se a Nós"
    And I click "Create a Meu Rio Account"
    Then I should see a new member form

  @javascript
  Scenario: New members should be able to create an account
    Given I am on the homepage
    When I click "Junte-se a Nós"
    And I click "Create a Meu Rio Account"
    And I fill in the new member form
    And I press "Sign up"
    Then I should see "translation missing: pt-BR.devise.member_registration.member.inactive_signed_up"


  @javascript
  Scenario: Creating a new member account after having signed a petition
    Given 1 published petitions exist 
    And I am an existing member
    And I have signed the first petition
    When I am on the homepage
    When I click "Junte-se a Nós"
    And I click "Create a Meu Rio Account"
    And I fill in the new member form with the same email
    And I press "Sign up"
    Then I should see "translation missing: pt-BR.devise.member_registration.member.inactive_signed_up"

  @javascript @omniauth_test
  Scenario: Trying to create a new member account after having signed up through Facebook
    Given I have logged in previously through Facebook
    When I go to the home page
    When I click "Junte-se a Nós"
    And I click "Create a Meu Rio Account"
    And I fill in the new member form with the same email
    And I press "Sign up"
    Then I should see "There is already a member with that email on the site"

  @javascript
  Scenario: Members should be able to access the MR login form
    Given I am on the homepage
    When I click "Entrar"
    And I click "Login Using Your MR Account"
    Then I should see a member login form

  @javascript
  Scenario: Members who have a MR login should be able to sign in
    Given I am a member with a MR login
    And I am on the homepage
    When I click "Entrar"
    And I click "Login Using Your MR Account"
    And I fill out the member login form
    And I press "Sign in"
    Then I should see "translation missing: pt-BR.devise.member_sessions.member.signed_in"

  @javascript
  Scenario: Signing out of a Meu Rio account
    Given I am a member with a MR login
    And I am on the homepage
    When I click "Entrar"
    And I click "Login Using Your MR Account"
    And I fill out the member login form
    And I press "Sign in"
    And I click on my member profile
    And I click "Sair »"
    Then I should see "Você saiu do Meu Rio, obrigado pela visita."

