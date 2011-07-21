Feature: Moderate a comment
  In order to filter inadequate comments 
  As an admin
  I want to moderate a comment

  Scenario: Comments index
    Given I am logged in to the admin section
    And 2 comments are in the moderation queue
    When I follow "Community Comments"
    Then I should see a list of comments

