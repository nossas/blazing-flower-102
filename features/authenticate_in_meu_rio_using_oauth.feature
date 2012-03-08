Feature: Authenticate in Meu Rio using OAuth
  In order to use my profile in another application
  As a member
  I want to be able to authenticate in Meu Rio using OAuth

  @omniauth_test @javascript
  Scenario: When I'm logged in
    Given I am logged in via Facebook
    And there is an OAuth application called "Verdade ou Consequencia"
    When I go to the authentication page for this application
    Then I should see "Verdade ou Consequencia"
  
  @omniauth_test @javascript
  Scenario: When I'm not logged in
    Given there is an OAuth application called "Verdade ou Consequencia"
    When I go to the authentication page for this application
    Then I should be on the homepage
    And I should see a link to the Facebook login
    And I should see a link to the Orkut login
    And I should see a link to the Google login
    And I should see a link to the Meu Rio login
