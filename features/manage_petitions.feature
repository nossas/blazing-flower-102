Feature: Managing Petitions
  In order to collect signatures
  As a admin
  I want to be able to create and manage petitions

  Scenario: Petition index
    Given I am logged in to the admin section
    And 2 petitions exist
    When I follow "Petitions"
    Then I should see a list of petitions

  Scenario: New Petition form
    Given I am logged in to the admin section
    And I am on the admin petitions page
    When I follow "New Petition"
    Then I should see new petition form

  Scenario: Previewing a petition
    Given I am logged in to the admin section
    And 1 petitions exist
    And I am on the admin petitions page
    When I follow "Preview"
    Then I should see a petition preview page

  Scenario: Trying to view a preview of a published petition
    Given I am logged in to the admin section
    And 1 published petitions exist
    When I am on the admin petitions page
    Then I should not see "Preview"
