Feature: Managing Issues
  In order to organize content
  As a admin
  I want to be able to create and manage issues

  Scenario: Issue index
    Given I am logged in to the admin section
    And 2 issues exist
    When I follow "Na Atividade"
    Then I should see a list of issues

  Scenario: New Issue form
    Given I am logged in to the admin section
    And I am on the admin issues page
    When I follow "Criar Novo"
    Then I should see new issue form
