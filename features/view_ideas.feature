Feature: View a selection of ideas
  In order to have a glimpse of the ideas
  As a visitor
  I want to view a selection of ideas

  @javascript
  Scenario: View ideas for an issue
    Given 1 issue exist
    And 2 ideas exists for that issue
    When I go to the first issue's ideas page
    Then I should see "Dê uma ideia"
    And I should see "Descubra e remixe"
