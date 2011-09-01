Feature: View a petition details
  In order to 
  As a guest
  I want to view a petition details
  
  Scenario: The one where the petition have donation enabled
    Given there is a petition with donation enabled
    When I go to the first petition page
    Then I should be on the first petition page
