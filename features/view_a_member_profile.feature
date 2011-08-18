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
    And this member commented the petition "Meio Ambiente é Coisa Séria" with "Vamos salvar a nossa cidade!" on "30/06/2011" for the issue "Cidade cinza"
    When I go to this member page
    Then I should see "O que Nícolas já fez no Meu Rio:"
    And I should see "30 de Junho de 2011"
    And I should see "Assinou o abaixo-assinado Meio Ambiente é Coisa Séria, Cidade cinza"
    And I should see "Vamos salvar a nossa cidade!"
    And I should see the petition comment icon

  Scenario: The one where the member commented a debate
    Given there is a member called "Pedro"
    And this member commented the debate "Falando sobre o Maracanã" with "Nunca gostei da localização do estádio" on "30/06/2011" for the issue "Reforma dos estádios"
    When I go to this member page
    Then I should see "O que Pedro já fez no Meu Rio:"
    And I should see "Fez um comentário no debate Falando sobre o Maracanã, Reforma dos estádios"
    And I should see "30 de Junho de 2011"
    And I should see "Nunca gostei da localização do estádio"
    And I should see the debate comment icon

  Scenario: The one where the member signed a petition and commented a debate
    Given there is a member called "Brandon"
    And this member commented the petition "Meio Ambiente é Coisa Séria" with "Vamos salvar a nossa cidade!" on "30/06/2011" for the issue "Cidade cinza"
    And this member commented the debate "Falando sobre o Maracanã" with "Nunca gostei da localização do estádio" on "07/07/2011" for the issue "Reforma dos estádios"
    When I go to this member page
    Then I should see "Falando sobre o Maracanã, Reforma dos estádios" before "Meio Ambiente é Coisa Séria, Cidade cinza"

  Scenario: The one where the member doesn't have a bio
    Given there is a member without bio
    When I go to this member page
    Then I should not see "Bio"

  @omniauth_test @javascript
  Scenario: The one where I'm seeing my profile page
    Given I am logged in via Facebook
    And my email is "nicolas@quavio.com.br"
    And my zone is "Centro"
    When I go to my profile page
    Then I should see "nicolas@quavio.com.br"
    And I should see "Centro"
    And I should see the change picture button
    And I should see the change name button
    And I should see the change email button
    And I should see the change zone button
    And I should see the change bio button
    And I should see the change Meu Rio is... button
    And I should see "Desejo receber notícias do Meu Rio por email."

  Scenario: The one where I'm seeing somebody else profile
    Given there is a member who lives in the "Norte" zone, his email is "nicolas@quavio.com.br" and his 'Meu Rio is' slogan is "A minha forma de colaborar para um Rio melhor!"
    When I go to this member page
    Then I should not see "nicolas@quavio.com.br"
    And I should not see "Norte"
    And I should not see the change picture button
    And I should not see the change name button
    And I should not see the change email button
    And I should not see the change zone button
    And I should not see the change bio button
    And I should not see the change Meu Rio is... button
    And I should not see "Desejo receber notícias do Meu Rio por email."
