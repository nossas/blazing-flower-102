Feature: In order to get an overview about an issue
         as a guest
         I should be able to view an issue page

  Scenario: Viewing an issue page
    Given 1 complete issues exist
    When I go to an issue page
    Then I should see the issue name
