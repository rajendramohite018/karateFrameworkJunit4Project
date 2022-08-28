Feature: first API test

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: sample post with resp assertion
    Given path '/users'
    And request {"name":"ram","job":"architect"}
    When method post
    Then status 201
    Then print response
    And match response == {"name":"ram","job":"architect","id":"#string","createdAt":"#ignore"}


  Scenario: sample post with resp assertions1 from file
    Given path '/users'
    And request {"name":"ram","job":"architect"}
    When method post
    Then status 201
    Then print response
    And match response == expectedoutput
    Then print response

  Scenario: sample post with request body  from file
    Given path '/users'
    And def requestBody = read('request1.json')
    And request requestBody
    When method post
    Then print response
