Feature: View a selection of ideas
  In order to have a glimpse of the ideas
  As a visitor
  I want to view a selection of ideas

  @javascript
  Scenario: View ideas for an issue
    Given 2 issues exist
    When I go to the first issue's ideas page
    Then I should see "Inicie uma ideia"
