Feature: Testing Account Creation on E-commerce Website
  Scenario: Testing HTTP POST method for account creation
    Given I have access to the shopping website at 'http://shop.com'
    And The "Create Account" button is visible on the page
    
    Scenario: Successful account creation
      When I fill out the form with valid details
      And send a POST request to '/account/create'
      Then the response status should be 200
      And the response body should contain 'Account created successfully'

    Scenario: Invalid account creation with incomplete form data
      When I fill out the form with incomplete data
      And send a POST request to '/account/create'
      Then the response status should be 400
      And the response body should contain 'Please fill out all fields'

    Scenario: Invalid account creation with incorrect data
      When I fill out the form with incorrect data
      And send a POST request to '/account/create'
      Then the response status should be 400
      And the response body should contain 'Invalid data'

  Scenario: Testing HTTP GET method to navigate to account creation page
    Given the "Create Account" button is clickable on the homepage
    When I navigate to '/account/create' via a GET request
    Then the response code should be 200
    And the response body should contain 'name', 'email', 'password', 'confirm_password', 'address' fields

  Scenario: Testing HTTP GET method for user login
    Given the base URL of the website 'http://shop.com'
    When I send a GET request to '/login'
    Then the response status should be 200

  Scenario: Check account creation under peak load
    Given I have access to the shopping website at 'http://shop.com'
    When I send multiple POST requests to '/account/create' concurrently
    Then the response status should still be 200
    And The response time should be less than 5 seconds for each request

  Scenario: Verify password field security
    Given I have the account creation page open
    When I enter a password
    Then The password should be encrypted and hidden
