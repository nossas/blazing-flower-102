Feature: Signing a Petition
  In order to show my support for a petition
  As a member
  I want to be able to view and sign a petition

  Scenario: Petition view
    Given 2 published petitions exist
    When I go to the first petition page
    Then I should see the petition title
    And I should see a petition signature form

  @javascript
  Scenario: Signing a Petition (new member, new petition signature)
    Given 2 published petitions exist
    And I am on the first petition page
    When I enter my information in the petition signature form
    And I press the submit button
    Then I should see a thank-you message

  @javascript
  Scenario: Signing a Petition without goal (new member, new petition signature)
    Given 1 published petitions exist without goal
    And I am on the first petition page
    When I enter my information in the petition signature form
    And I press the submit button
    Then I should see a thank-you message

  @javascript
  Scenario: Signing a Petition (existing member, new petition)
    Given 2 published petitions exist
    And I am an existing member
    And I am on the first petition page
    When I enter my member information in the petition signature form
    And I press the submit button
    Then I should see a thank-you message

  @javascript
  Scenario: Signing a Petition (existing member, existing petition signature) with javascript
    Given 2 published petitions exist
    And I am an existing member
    And I have signed the first petition
    And I am on the first petition page
    When I enter my member information in the petition signature form
    Then I should see a link to the TAF
    And I should see "Esse email já consta na petição."

  @javascript
  Scenario: Signing a Petition without required fields
    Given 2 published petitions exist
    And I am on the first petition page
    When I press the submit button
    Then I should see inline errors

  Scenario: Signing a Petition without required fields and without Javascript
    Given 2 published petitions exist
    And I am on the first petition page
    When I press the submit button
    Then I should see a petition signature form
    And I should see "Email não pode ficar em branco não é válido"
    And I should see "First_name não pode ficar em branco"
    And I should see "Last_name não pode ficar em branco"

  @omniauth_test @javascript
  Scenario: Logged in via 3th party service
    Given I am logged in via Facebook
    And 2 published petitions exist
    And I am on the first petition page
    When I fill in "petition_signature_comment" with "My comment"
    And I press "Assine"
    Then I should see a thank-you message
