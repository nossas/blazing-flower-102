Feature: Visit the about page
  In order to learn basic information about Meu Rio
  as a user
  I want to visit the About page

  Scenario: Just visiting the about page
    When I am on the about page
    Then I should see "O Meu Rio"
    Then I should see "Nossas plataformas"
    Then I should see "Nossa equipe"
    Then I should see "Nosso conselho"
