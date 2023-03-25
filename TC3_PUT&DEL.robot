*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_URL}     http://localhost:3000

*** Test Cases ***
PutMethod Testing
    Create Session    Mysession     ${base_URL}     verify=true
    ${data}=    create dictionary    id=115   first_name=hariniN     DOB=11-04-2001     email=hari0198@gmail.com
    ${header}=      create dictionary    Content_Type=application/json
    ${response}=     PUT On Session     Mysession       /ASM/115    data=${data}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}
    #validation
    ${status_code}=     convert to string   ${response.status_code}
    should be equal     ${status_code}      200

DeleteMethd Testing
     Create Session    Mysession     ${base_URL}     verify=true
     ${response}=     DELETE On Session     Mysession       /ASM/105
     #validation
     ${status}=     convert to string    ${response.status_code}
     should be equal    ${status}   200