Feature: Managing Autofire Emails
  In order to collect thank petition signatories
  As a admin
  I want to be able to create and manage autofire emails

  # Leaving test, but for now we're not displaying 
  # the email index... I have a feeling it is not 
  # the last we've seen of it thought
  #
  # Scenario: Email index
  #   Given I am logged in to the admin section
  #   And 2 autofire emails exist
  #   When I follow "Emails"
  #   Then I should see a list of emails

  Scenario: New Email form
    Given I am logged in to the admin section
    And I am on the admin autofire emails page
    When I follow "New Autofire Email"
    Then I should see a new autofire email form

  Scenario: New Email creation
    Given I am logged in to the admin section
    And 1 petitions exist
    And I am on the new admin autofire email page
    When I select the first Petition
    And I fill in "Subject" with "Cucumber Title"
    And I fill in "Message" with "Obrigado"
    And I press "Create Autofire email"
    Then I should see "Cucumber Title"
