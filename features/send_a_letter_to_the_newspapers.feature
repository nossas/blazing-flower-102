Feature: send a letter to the newspapers
  In order to pressure the government
  As a member
  I want to send a letter to the newspapers

  Scenario: The one where I fill the letter form correctly
    Given there is an issue with letters enabled
    And I am on this issue page
    And I follow "Envie sua carta"
    And I fill in "Nome" with "César Fonseca Busquet"
    And I fill in "Email" with "cesarfb@gmail.com"
    And I fill in "Endereço" with "Rua Frederico Magalhães 212/801"
    And I fill in "Cidade" with "Rio de Janeiro"
    And I fill in "Telefone" with "99834521"
    And I fill in "Assunto" with "Não ao aumento salarial"
    And I fill in "Mensagem" with "Estão todos loucos"
    When I press "Enviar"
    Then I should see "Valeu! Sua carta foi enviada ao jornal O Globo!"

  Scenario: The one where the issue have the letter disabled
    Given there is an issue
    When I go to this issue page
    Then I should not see "Envie sua carta"
