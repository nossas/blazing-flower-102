Feature: Visit the about page
  In order to learn basic information about Meu Rio
  as a user
  I want to visit the About page

  Scenario: The one where there is no petition
    When I am on the about page
    Then I should not see "Veja uma petição recente »"

  Scenario: The one where there are two petitions
    Given 2 published petitions exist
    When I am on the about page
    Then I should see the last petition link

  Scenario: The one where there is no debate
    When I am on the about page
    Then I should not see "Veja um debate recente »"

  Scenario: The one where there are two debates
    Given 2 debates exist
    When I am on the about page
    Then I should see the last debate link

  Scenario: The one where there is no personal story
    When I am on the about page
    Then I should not see "Veja um vídeo recente »"

  Scenario: The one where there are two personal stories
    Given 2 personal stories exist
    When I am on the about page
    Then I should see the last personal story link
