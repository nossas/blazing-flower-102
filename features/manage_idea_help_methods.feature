Feature: Managing Idea Help Methods
  In order to organize the ideas
  As an admin
  I want to be able to create and manage idea help methods

  Scenario: Idea Help Method Index
    Given I am logged in to the admin section
    And 1 idea help method exist
    When I follow "Métodos de ajuda"
    Then I should see a list of ideas help methods

  Scenario: New Idea Help Method Form
    Given I am logged in to the admin section
    And I am on the admin idea help methods page
    When I follow "Criar Novo"
    Then I should see new idea help method form
