Feature: View meta tags for SEO
  In order to be more optimizated for search engines
  As a developer
  I want to see the meta tags _\m/

  Scenario: I'm visiting the home page
    Given I'm in the home page
    Then I should see the meta tag for description
    Then I should see the meta tag for keywords
    Then I should see the meta tag for author

  Scenario: I'm visiting an issue page
    Given 1 issues exist
    When I visit the issue page
    Then I should see the meta tag for description
    Then I should see the meta tag for keywords
    Then I should see the meta tag for author
