Feature: Flag inappropriate debate comments
  In order to maintain the quality of the debate comments
  As an guest
  I want to flag inappropriate debate comments

  @omniauth_test @javascript
  Scenario: The one where the user flag a comment as inapropriate
    Given I am logged in via Facebook
    And There is a commented debate
    And I am on this debate page
    When I follow "Denunciar"
    Then I should see "Desfazer denúncia"

  @omniauth_test @javascript
  Scenario: The one where the user unflag a comment
    Given I am logged in via Facebook
    And There is a commented debate
    And I am on this debate page
    And I follow "Denunciar"
    When I follow "Desfazer denúncia"
    Then I should see "Denunciar"
