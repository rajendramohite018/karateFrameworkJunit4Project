Feature: GET Test demo API

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

# A simple Get API Scenario featch SINGLE USER
  Scenario: Get demo 1
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

# With Background  and Path --LIST USERS
  Scenario: Get demo 2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus

# With Background, path and params  ( e.g. ?page=2 )
  Scenario: Get demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

 #    With Assertions ( we can use response or $)
  Scenario: Get demo 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name == 'Michael'
    And assert response.data.length == 6
    And match $.data[3].id == 10
    And match $.data[4].last_name == 'Edwards'