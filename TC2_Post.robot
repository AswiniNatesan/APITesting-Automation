*** Settings ***
Library    RequestsLibrary
Library     Collections

*** Variables ***
${base_URL}     http://localhost:3000
${name}     ASM

*** Test Cases ***
PostMethod Testing
    Create Session    Mysession     ${base_URL}     verify=true
    ${data}=    create dictionary    id=115   first_name=jee     DOB=01-04-2001     email=aswini0198@gmail.com
    ${header}=      create dictionary    Content_Type=application/json
    ${response}=     POST On Session    Mysession       /ASM    data=${data}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}