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
