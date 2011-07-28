Feature: Share a petition
  In order to draw attention to the petition
  As an member
  I want to share the petition in social networks

  @javascript
  Scenario: Viewing a TAF page directly
    Given there is a petition with Facebook share enabled
    When I go to the petition taf page
    Then I should see "Sharing on Facebook"

  @omniauth_test @javascript
  Scenario: Share on Facebook when it's enabled
    Given there is a petition with Facebook share enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comentário" with "Save your city!"
    And I press "Assine"
    Then I should see "Sharing on Facebook"

  @omniauth_test @javascript
  Scenario: Share on Facebook when it's disabled
    Given there is a petition with all share options disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comentário" with "Save your city!"
    And I press "Assine"
    Then I should not see "Sharing on Facebook"

  @omniauth_test @javascript
  Scenario: Share on Orkut when it's enabled
    Given there is a petition with Orkut share enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comentário" with "Save your city!"
    And I press "Assine"
    Then I should see "Sharing on Orkut"

  @omniauth_test @javascript
  Scenario: Share on Orkut when it's disabled
    Given there is a petition with all share options disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comentário" with "Save your city!"
    And I press "Assine"
    Then I should not see "Sharing on Orkut"

  @omniauth_test @javascript
  Scenario: Share on Twitter when it's enabled
    Given there is a petition with Twitter share enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comentário" with "Save your city!"
    And I press "Assine"
    Then I should see "Compartilhar no Twitter"

  @omniauth_test @javascript
  Scenario: Share on Twitter when it's disabled
    Given there is a petition with all share options disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comentário" with "Save your city!"
    And I press "Assine"
    Then I should not see "Your Tweet"

  @omniauth_test @javascript
  Scenario: Share via e-mail when it's enabled
    Given there is a petition with e-mail share enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comentário" with "Save your city!"
    And I press "Assine"
    Then I should see "Sharing via email"

  @omniauth_test @javascript
  Scenario: Share via e-mail when it's disabled
    Given there is a petition with all share options disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comentário" with "Save your city!"
    And I press "Assine"
    Then I should not see "Sharing via email"
