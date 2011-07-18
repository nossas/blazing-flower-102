Feature: Copy the petition link to clipboard
  In order to share the petition link to my friends
  As an user
  I want to copy the link to my clipboard

  @omniauth_test
  Scenario: Petition's display copy link is enabled
    Given there is a petition with display copy link enabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should not see "clippy"

  @omniauth_test
  Scenario: Petition's display copy link is disabled
    Given there is a petition with display copy link disabled
    And I am logged in via Facebook
    And I am on the first petition page
    When I fill in "Comment" with "Save your city!"
    And I press "Assine"
    Then I should not see "clippy"
