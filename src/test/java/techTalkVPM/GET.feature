Feature: GET Test example
# A simple Get API Scenario featch SINGLE USER
  Scenario: Get test demo 1
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies