Feature: get user details
    Background:
      * def expectedOutput = read('result.json')
      #* def expectedOutput1 = read('result2.json') we can add multiples json in one file
    #Decalre variable using * def keyword

  Scenario: request user 2 details
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    Then print response
    #And match response == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    And match response == expectedOutput
    And match response.data.id == 2
    And match response.data.last_name != null
    * def job_code = response.data.job_code
    And match job_code ==  null

  Scenario: request user 3 details
    Given url 'https://reqres.in/api/users/3'
    When method GET
    Then status 200
    Then print response
    And match response == expectedOutput
    And match response.data.id == 3
    And print responseStatus






