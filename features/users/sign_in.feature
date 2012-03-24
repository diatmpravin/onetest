Feature: Sign in
	If I want to access protected sections of site
	As an user
	I need to sign in
	
	Scenario: User is not signed up
		Given I do not exist as a user
		When I sign in with valid credentials
		Then I see an invalid login message
			And I should be signed out
			
	Scenario: User signs in successfully
		Given I exist as a user
			And I an not logged in
		When I sign in with valid credentials
		Then I see a successful sign in message
		When I return to the site
		Then I Should be signed in			
	
