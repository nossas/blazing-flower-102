Feature: Managing Idea Categories
  In order to organize the ideas
  As an admin
  I want to be able to create and manage idea categories

  Scenario: Idea Category Index
    Given I am logged in to the admin section
    And 1 idea category exist
    When I follow "Categorias"
    Then I should see a list of ideas categories

  Scenario: New Idea Category form
    Given I am logged in to the admin section
    And I am on the admin idea categories page
    When I follow "Criar Novo"
    Then I should see new idea category form
