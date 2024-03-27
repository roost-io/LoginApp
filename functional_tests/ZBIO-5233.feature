Feature: API Testing for Login Functionality

  Scenario: Test if 'username' field is editable
    Given the API base URL 'http://localhost:3000' 
    When I send a POST request to '/username' with 'sequence of characters'
    Then the response status should be 200
    And the response should contain 'sequence of characters'

  Scenario: Test if 'password' field is editable
    Given the API base URL 'http://localhost:3000' 
    When I send a POST request to '/password' with 'sequence of characters'
    Then the response status should be 200
    And the response should contain 'sequence of characters'

  Scenario: Check if 'login' button is enabled
    Given the API base URL 'http://localhost:3000'
    When I send a GET request to '/login-button-status'
    Then the response status should be 200
    And the response should contain "status:enabled"

  Scenario: Test valid username and valid password
    Given the API base URL 'http://localhost:3000'
    When I send a PUT request to '/login' with valid username and password
    Then the response status should be 200
    And the response should redirect to the homepage

  Scenario: Test invalid username and valid password
    Given the API base URL 'http://localhost:3000'
    When I send a PUT request to '/login' with invalid username and valid password
    Then the response status should be 401
    And the response should contain 'Invalid User'

  Scenario: Test valid username and invalid password
    Given the API base URL 'http://localhost:3000'
    When I send a PUT request to '/login' with valid username and invalid password
    Then the response status should be 401
    And the response should contain 'Invalid Password'
    
  Scenario: Test invalid username and invalid password
    Given the API base URL 'http://localhost:3000'
    When I send a PUT request to '/login' with invalid username and invalid password
    Then the response status should be 401
    And the response should contain 'Invalid User or Password'
  
  Scenario: Test blank username and valid password
    Given the API base URL 'http://localhost:3000'
    When I send a PUT request to '/login' with blank username and valid password
    Then the response status should be 400
    And the response should contain 'Username is required'
    
  Scenario: Test valid username and blank password
    Given the API base URL 'http://localhost:3000'
    When I send a PUT request to '/login' with valid username and blank password
    Then the response status should be 400
    And the response should contain 'Password is required'

  Scenario: Test response time of login page
    Given the API base URL 'http://localhost:3000'
    When I send a GET request to '/login-page-load'
    Then the response status should be 200
    And the response time should be within acceptable limit
    
  Scenario: Check if 'username' and 'password' fields are obscured for password type entries
    Given the API base URL 'http://localhost:3000'
    When I send a GET request to '/credentials-obscured'
    Then the response status should be 200
    And the response should contain 'obscured:true'
   
  Scenario: Check if 'login' button is clickable
    Given the API base URL 'http://localhost:3000'
    When I send a GET request to '/login-button-click'
    Then the response status should be 200
    
  Scenario: Detect memory leak or system crash when large input data is entered in the user field
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/username' with text of 5000 characters
    Then the response status should be 200 or 400
    And the system should not crash

  Scenario: Test if login page is responsive (adapts to different screen sizes)
    Given the API base URL 'http://localhost:3000'
    When I send a GET request to '/viewport'
    Then the response status should be 200
    And the response should confirm correct display on different screen sizes
    
  Scenario: Test login page compatibility on different browsers
    Given the API base URL 'http://localhost:3000'
    When I send a GET request to '/browser-compatibility'
    Then the response status should be 200
    And the response should confirm correct alignment and functionality across different browsers
    
  Scenario: Test login page accessibility
    Given the API base URL 'http://localhost:3000'
    When I send a GET request to '/accessibility'
    Then the response status should be 200
    And the response should confirm page's accessibility guidelines
