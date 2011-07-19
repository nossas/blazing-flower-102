Feature: Share a petition
  In order to draw attention to the petition
  As an member
  I want to share the petition in social networks

  @omniauth_test
  Scenario: Share on Facebook when it's enabled
    Given there is a petition with Facebook share enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should see "Sharing on Facebook"

  @omniauth_test
  Scenario: Share on Facebook when it's disabled
    Given there is a petition with all share options disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should not see "Sharing on Facebook"

  @omniauth_test
  Scenario: Share on Orkut when it's enabled
    Given there is a petition with Orkut share enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should see "Sharing on Orkut"

  @omniauth_test
  Scenario: Share on Orkut when it's disabled
    Given there is a petition with all share options disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should not see "Sharing on Orkut"

  @omniauth_test
  Scenario: Share on Twitter when it's enabled
    Given there is a petition with Twitter share enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then show me the page
    Then I should see "Your Tweet"

  @omniauth_test
  Scenario: Share on Twitter when it's disabled
    Given there is a petition with all share options disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should not see "Your Tweet"

  @omniauth_test
  Scenario: Share via e-mail when it's enabled
    Given there is a petition with e-mail share enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should see "Sharing via email"

  @omniauth_test
  Scenario: Share via e-mail when it's disabled
    Given there is a petition with all share options disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should not see "Sharing via email"
