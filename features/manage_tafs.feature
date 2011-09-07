Feature: Managing Tell a Friend pages
  In order to encourage signatories to share petitions 
  As an admin
  I want to be able to create and manage tell a friend pages

  Scenario: TAF index
    Given I am logged in to the admin section
    And 2 Tell a Friend pages exist
    When I am on the admin tafs page
    Then I should see a list of tafs

  Scenario: New TAF form
    Given I am logged in to the admin section
    And I am on the admin tafs page
    When I follow "Criar Novo"
    Then I should see a new taf form

  Scenario: New Taf creation
    Given I am logged in to the admin section
    And 1 petitions exist
    When I am on the new admin taf page
    When I fill out the taf form
    And I press "Create Taf"
    Then I should see "Taf was successfully created."
