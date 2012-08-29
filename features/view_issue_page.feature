Feature: In order to get an overview about an issue
         as a guest
         I should be able to view an issue page

  Scenario: Viewing an issue page
    Given 1 complete issues exist
    When I go to an issue page
    Then I should see the issue name

  Scenario: when the issue have an PdP link
    Given there is an issue with a PdP link
    When I go to this issue page
    Then I should see the PdP call to action
  
  Scenario: when the issue have an VoC link
    Given there is an issue with a VoC link
    When I go to this issue page
    Then I should see the VoC call to action

  Scenario: when the issue have an phone text
    Given there is an issue with phone text
    When I go to this issue page
    Then I should see the phone call to action
