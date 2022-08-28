Feature: POST test demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')


# Simple Post scenario ( successfully created status is 201)
  Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request { "name": "Raghav", "job": "leader"}
    When method POST
    Then status 201
    And print response
    And print responseStatus


    # Post scenario with Background
  Scenario: Post demo 2
    Given path '/users'
    And request { "name": "Raghav", "job": "leader"}
    When method post
    Then status 201
    And print response
    And print responseStatus

#  Post with response assertion  (match is asssertion used in post method)
  Scenario: Post demo 3
    Given path '/users'
    And request { "name": "Raghav", "job": "leader"}
    When method post
    Then status 201
    And print response
    And match response == {"name": "Raghav", "job": "leader","id": "#string","createdAt": "#ignore"}
 #Note: handle dynamic values such as id ( #NOTNULL or #String) and createdAt (#ignore) e.g check datatype if no then use ignore

 #  Post with response matching from file
  Scenario: Post demo 4
    Given path '/users'
    And request { "name": "Raghav", "job": "leader"}
    When method post
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

# Read body data from file ( print- display in report and match is assertions to check or varify- if file is present in different package then how to read that file)
  Scenario: Post demo 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filepath = projectPath+'\src\test\java\data\request1.json'
    And print filepath
    And def requestBody = filepath
    And request requestBody
    When method post
    Then status 201
    And print response

# Read body data from file ( print- display in report and match is assertions to check or varify)
  Scenario: Post demo 5a
    Given path '/users'
    And def requestBody = read ('request2.json')
    And request requestBody
    When method post
    Then status 201
    And print response
    And match response == expectedOutput
    And match $ == expectedOutput

# Read body data from file and change request values
  Scenario: Post demo 7
    Given path '/users'
    And def requestBody = read('request2.json')
    And request requestBody
    And set requestBody.job = 'engineer'
    When method post
    Then status 201
    And print response
    #And match response == expectedOutput  job changed so its failed
    #And match $ == expectedOutput
