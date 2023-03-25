*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com

*** Test Cases ***
Testcase1
    Create Session    Mysession      ${base_url}
    ${response}=    GET On Session    Mysession     /photos
    #LOG TO CONSOLE    ${response.content}
    log to console    ${response.status_code}
    log to console    ${response.cookies}
    #log to console    ${response.headers}
    #verify header values
    #specific header value
    ${value}=   get from dictionary     ${response.headers}     Transfer-Encoding
    log to console    ${value}
    ${string}=  convert to string    ${response.status_code}
    should be equal    ${value}     application/json; charset=utf-8
    IF     ${string} == 200
        log to console    Yes
    END
