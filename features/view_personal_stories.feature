Feature: View the personal story videos for an issue
  In order to learn how issues effect individuals
  As a guest
  I should be able to view the personal story videos for an issue

  Scenario: Viewing the personal stories issue index page
    Given 1 issues exist
    And there are 3 personal stories connected to the issue
    When I go to the personal stories page for an issue
    Then I should see a video
    And I should see the first video's title
    And I should see the first video's description
    And I should see the other stories' thumbnails

  @javascript
  Scenario: Selecting a video from the gallery of videos
    Given 1 issues exist
    And there are 3 personal stories connected to the issue
    When I go to the personal stories page for an issue
    And I click on a thumbnail for a video
    Then I should see the selected video's title
    And I should see the selected video's description

  @javascript
  Scenario: Back button should work on personal stories issue index page
    Given 1 issues exist
    And there are 3 personal stories connected to the issue
    When I go to the personal stories page for an issue
    And I click on a thumbnail for a video
    And I press the back button
    Then I should see the first video's description

  @javascript
  Scenario: Back button should work if you watch more than one video
    Given 1 issues exist
    And there are 3 personal stories connected to the issue
    When I go to the personal stories page for an issue
    And I click on a thumbnail for a video
    And I click on another thumbnail for a video
    And I press the back button
    Then I should see the selected video's description

  Scenario: Viewing the personal stories issue index page with a specific video selected
    Given 1 issues exist
    And there are 3 personal stories connected to the issue
    When I go to the personal stories page with a story id in the URL for an issue 
    Then I should see that video's title
    And I should see that video's description
    And I should see the other stories' thumbnails
    
