Feature: Donate for a petition
  In order to raise funds for a petition
  As an member
  I want to donate for a petition

  @omniauth_test @javascript
  Scenario: View donation when I've already subscribed
    Given there is a petition with donation enabled
    And I am logged in via Facebook
    And I have already signed this petition
    When I am on the first petition page
    Then I should see "Obrigada pela sua participação"
    And I should see the petition donation details

  @javascript
  Scenario: Signing a Petition (existing member, existing petition signature) with javascript
    Given there is a petition with donation enabled
    And I am an existing member
    And I have signed the first petition
    And I am on the first petition page
    When I enter my member information in the petition signature form
    Then I should see a link to the donation

  #@javascript
  #Scenario: Signing a Petition (new member, new petition signature)
    #Given there is a petition with donation enabled
    #And I am on the first petition page
    #When I enter my information in the petition signature form
    #And I press the submit button
    #Then I should see "Obrigada pela sua participação"
    #And I should see the petition donation details
