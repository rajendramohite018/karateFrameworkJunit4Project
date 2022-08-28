Feature: first API test

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: sample api test
    Given url  'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseCookies
    And print responseTime
    And print responseStatus
    And print responseHeaders

  Scenario: sample api test2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseCookies
    And print responseTime
    And print responseStatus
    And print responseHeaders

  #get with path and parameters
  Scenario: sample api test3 #get with path and parameters
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseCookies
    And print responseTime
    And print responseStatus
    And print responseHeaders

  #get with assertions
  Scenario: sample api test4 #get with assertions
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And assert response.data.length == 6
    And match response.data[2].id == 9
    # And assert response.data[2].id == 9
    # And match reponse.data[2].id == 9
    And print responseCookies
    And print responseTime
    And print responseStatus
    And print responseHeaders
