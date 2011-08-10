Feature: View a member profile
  In order to learn about other members
  As a guest
  I want to browser other member profiles

  Scenario: The one where the member have the 'Meu Rio is' slogan
    Given there is a member where 'Meu Rio is' slogan is "A minha forma de colaborar para um Rio melhor!"
    When I go to this member page
    Then I should see "A minha forma de colaborar para um Rio melhor!"

  Scenario: The one where the member doesn't have the 'Meu Rio is' slogan
    Given there is a member without 'Meu Rio is' slogan
    When I go to this member page
    Then I should not see "Meu Rio é..."
