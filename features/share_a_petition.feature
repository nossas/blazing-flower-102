Feature: Share a petition
  In order to draw attention to the petition
  As an member
  I want to share the petition in social networks

  Scenario: Share on Facebook when it's enabled
    Given there is a petition with Facebook share enabled
    When I go to the first petition TAF page
    Then I should see "Share on Facebook"

  Scenario: Share on Facebook when it's disabled
    Given there is a petition with Facebook share disabled
    When I go to the first petition TAF page
    Then I should not see "Share on Facebook"

  Scenario: Share on Orkut when it's enabled
    Given there is a petition with Orkut share enabled
    When I go to the first petition TAF page
    Then I should see "Share on Orkut"

  Scenario: Share on Orkut when it's disabled
    Given there is a petition with Orkut share disabled
    When I go to the first petition TAF page
    Then I should not see "Share on Orkut"

  Scenario: Share on Twitter when it's enabled
    Given there is a petition with Twitter share enabled
    When I go to the first petition TAF page
    Then I should see "Share on Twitter"

  Scenario: Share on Twitter when it's disabled
    Given there is a petition with Twitter share disabled
    When I go to the first petition TAF page
    Then I should not see "Share on Twitter"

  Scenario: Share via e-mail when it's enabled
    Given there is a petition with e-mail share enabled
    When I go to the first petition TAF page
    Then I should see "Share via e-mail"

  Scenario: Share via e-mail when it's disabled
    Given there is a petition with e-mail share disabled
    When I go to the first petition TAF page
    Then I should not see "Share via e-mail"
