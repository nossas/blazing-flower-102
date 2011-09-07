Feature: Moderate a comment
  In order to filter inadequate comments 
  As an admin
  I want to moderate a comment

  Scenario: Comments index
    Given I am logged in to the admin section
    And 2 comments are in the moderation queue
    When I am on the admin community comments page
    Then I should see a list of comments

  #  Scenario: Comments index should not show comments out of moderation
  #  Given I am logged in to the admin section
  #  And 1 comment is in the moderation queue
  #  And 1 comment is not in the moderation queue
  #  When I follow "Comments"
  #  Then I should see only the first comment

  Scenario: Comments should have moderated scope to show moderated comments
    Given I am logged in to the admin section
    And 1 comment is in the moderation queue
    And 1 comment is moderated
    When I am on the admin community comments page
    And I follow "Moderated"
    Then I should see only the moderated comment

  Scenario: See comment accepted
    Given I am logged in to the admin section
    And 1 comment is in the moderation queue
    And the first debate comment is accepted
    When I am on the admin community comments page
    And I follow "Moderated"
    Then I should see the first comment having "Comment Accepted" as "Yes"

  Scenario: See comment rejected
    Given I am logged in to the admin section
    And 1 comment is in the moderation queue
    And the first debate comment is rejected
    When I am on the admin community comments page
    And I follow "Moderated"
    Then I should see the first comment having "Comment Accepted" as "No"

  Scenario: Accept comment
    Given I am logged in to the admin section
    And 1 comment is in the moderation queue
    When I am on the admin community comments page
    And I click "Yes"
    Then the first debate comment should be accepted

  Scenario: Reject comment
    Given I am logged in to the admin section
    And 1 comment is in the moderation queue
    When I am on the admin community comments page
    And I click "No"
    Then the first debate comment should be rejected
