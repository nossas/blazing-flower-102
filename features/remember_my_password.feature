Feature: Remember my password
	In order to login into Meu Rio
	As a member
	I want to remember my password

	Scenario: I have an account
		Given there is a member with email "nicolas@engage.is"
		And I go to "the forgot my password page"
		And I fill in "E-mail" with "nicolas@engage.is"
		When I press "Enviar"
		Then I should be on "the homepage"
		And an email should be sent
