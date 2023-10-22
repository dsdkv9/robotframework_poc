*** Test Cases ***
Login With Admin
    Given I am on the login page
    When I login with username "admin" and password "admin"
    Then I should see the welcome page

Login With Invalid User
    Given I am on the login page
    When I login with username "invalid" and password "invalid"
    Then I should see the error message
    And I should be able to login again

*** Keywords ***
I am on the login page
    Log    I am on the login page

I login with username "${username}" and password "${password}"
    Log    username: ${username} & password: ${password}

I should see the welcome page
    Log    I should see the welcome page

I should see the error message
    Log    I should see the error message

I should be able to login again
    Log    I should be able to login again
