Feature: Forking an idea
  In order to create my own version of an idea
  As a member
  I want to view and fork an idea

  Scenario: Idea view
    Given 2 ideas exist
    When I go to the first idea page
    Then I should see the idea title
    And I should see a fork idea button

  
  #@javascript
  #Scenario: Signing a Petition (new member, new petition signature)
    #Given 2 published petitions exist
    #And I am on the first petition page
    #When I enter my information in the petition signature form
    #And I press the submit button
    #Then I should see a thank-you message

