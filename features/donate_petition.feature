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
