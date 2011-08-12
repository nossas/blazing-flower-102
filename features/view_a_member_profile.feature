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

  Scenario: The one where the member signed a petition
    Given there is a member called "Nícolas"
    And this member commented the petition "Meio Ambiente é Coisa Séria" with "Vamos salvar a nossa cidade!" on "30/06/2011"
    When I go to this member page
    Then I should see "Nícolas está colaborando com..."
    And I should see "Quinta, 30 de Junho de 2011, 00:00 h"
    And I should see "Assinatura da petição Meio Ambiente é Coisa Séria"
    And I should see "Vamos salvar a nossa cidade!"
    And I should see the petition comment icon

  Scenario: The one where the member commented a debate
    Given there is a member called "Pedro"
    And this member commented the debate "Falando sobre o Maracanã" with "Nunca gostei da localização do estádio" on "30/06/2011"
    When I go to this member page
    Then I should see "Pedro está colaborando com..."
    And I should see "Comentários do debate Falando sobre o Maracanã"
    And I should see "Quinta, 30 de Junho de 2011, 00:00 h"
    And I should see "Nunca gostei da localização do estádio"
    And I should see the debate comment icon

  Scenario: The one where the member signed a petition and commented a debate
    Given there is a member called "Brandon"
    And this member commented the petition "Meio Ambiente é Coisa Séria" with "Vamos salvar a nossa cidade!" on "30/06/2011"
    And this member commented the debate "Falando sobre o Maracanã" with "Nunca gostei da localização do estádio" on "07/07/2011"
    When I go to this member page
    Then I should see "Falando sobre o Maracanã" before "Meio Ambiente é Coisa Séria"
