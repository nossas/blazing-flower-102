Feature: In order to get to know every piece of content ever created for an issue 
         As a guest 
         I want to view issue's archive

  Scenario: Viewing an issue archive page
    Given 1 complete issues exist
    When I go to an issue archive page
    Then I should see "Arquivo"
    And I should see the issue's first debate's title
    And I should see the issue's first personal story's title
    And I should see the issue's first petition's headline

  Scenario: Viewing an issue archive page for an issue without any associated content
    Given 1 issues exist
    When I go to an issue archive page
    Then I should see "Arquivo"
    And I should see "Displaying 0-0 of 0"

  @javascript
  Scenario: Seeing another issue's archive
    Given 2 complete issues exist
    When I go to an issue archive page
    And I press the issue's name
    And I click the other issue's name
    Then I should see the other issue's title
    And I should see the other issue's first debate's title
    And I should not see the original issue's first debate's title
