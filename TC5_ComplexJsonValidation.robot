*** Settings ***
Library    JSONLibrary
Library    RequestsLibrary
Library    Collections
Library    os

*** Variables ***
${base_url}     http://countrylayer.com

*** Test Cases ***
ComplexJson Testing
    Create Session    Countriesinfo     ${base_url}
    ${header}=     create dictionary    Content-Type=text/html
    ${Response}=    GET On Session    Countriesinfo     /rest/v2/alpha/IN       headers=${header}
    ${resp}     set variable    ${Response.json()}
    ${success}=     get value from json    ${resp}      error.type
    log to console    ${success}

    #if you want verify many values
    ${error}=   get value from json    ${resp}      error
    log to console    ${error[0]}
    should contain any    ${error[0]}      type    info    you     an
    should not contain any    ${error[0]}   ones

