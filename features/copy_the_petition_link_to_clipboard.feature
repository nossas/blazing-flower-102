Feature: Copy the petition link to clipboard
  In order to share the petition link to my friends
  As an user
  I want to copy the link to my clipboard

  Scenario: Petition's display copy link is enabled
    Given there is a petition with display copy link enabled
    And I go to the first petition page
    When I follow "Copy"
    Then show me the page
    Then I should see "Copied text to clipboard"

  @focus
  Scenario: Petition's display copy link is disabled
    Given there is a petition with display copy link disabled
    When I go to the first petition page
    Then I should not see "Copy"
