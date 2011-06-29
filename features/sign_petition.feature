Feature: Signing a Petition
  In order to show my support for a petition
  As a member
  I want to be able to view and sign a petition

  Scenario: Petition view
    Given 2 complete petitions exist
    When I go to the first petition page
    Then I should see the petition title
    And I should see a petition signature form

  Scenario: Signing a Petition (new member, new petition signature)
    Given 2 complete petitions exist
    And I am on the first petition page
    When I enter my information in the petition signature form
    And I press the submit button
    #Then I should see a thank-you message

  @focus
  Scenario: Signing a Petition (existing member, new petition)
    Given 2 complete petitions exist
    And I am an existing member
    And I am on the first petition page
    When I enter my member information in the petition signature form
    And I press the submit button
    Then I should see a thank-you message

