Feature: Managing Personal Stories
  In order to better expose a personal story
  As a admin
  I want to be able to create and manage personal stories

  Scenario: Personal Stories index
    Given I am logged in to the admin section
    And 1 personal stories exist
    When I follow "Vídeos"
    Then I should see the personal story index page

  Scenario: Creating a Personal Story
    Given I am logged in to the admin section
    And 3 personal stories exist
    When I follow "Vídeos"
    And I click "Criar Novo"
    And I fill in the personal story form with correct information
    And I press "Create Vídeo"
    # Until Active Admin gets it's flash back
    Then I should see "Created at"
    # Then I should see "Vídeo was successfully created"
