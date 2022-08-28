Feature: POST test demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')


# Simple Post scenario ( successfully created status is 201)
  Scenario: Post demo 1
    Given path '/users'
    And request {"email": "eve.holt@reqres.in", "password": "pistol" }
    When method POST
    Then status 201
    And print response
    And print responseStatus