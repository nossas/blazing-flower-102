Feature: Share a petition with my friends
  In order to get my friends engaged to the petition
  As a member
  I want to share a petition with my friends

  @javascript @omniauth_test
  Scenario: The one where I am signed in with Facebook
    Given I am logged in via Facebook
    And I have a friend called "Alessandra Orofino"
    And there is a petition called "Reajustes sem explicações, não!"
    And I already signed this petition
    And I am on this petition page
    And I check "Alessandra Orofino"
    And I fill in "Mensagem" with "Ale! Bora assinar!"
    When I press "Compartilhar"
    Then I should see "Alessandra Orofino foi avisada sobre a petição Reajustes sem explicações, não!."
