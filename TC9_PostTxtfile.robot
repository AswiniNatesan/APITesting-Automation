*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${base_url}     http://localhost:3000


*** Test Cases ***
Testcase1
    Create Session    Mysession     ${base_url}     verify=true
    ${header}=      create dictionary       auth=${None}    Content-Type=application/json
    ${file_content}=    get file       C:/Users/ASM/Desktop/Python/postmethod.json
    ${response}=     POST On Session    Mysession   /ASM    data=${file_content}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}

#api name--Testing123
#Apikey--AIzaSyDm6AoA3BI3d5UlcdnkB_IM8R1Rb1bYLtU
#location=-33.8670522,151.1957362&radius=500&types=food&name=harbour&key=YOUR_API_KEY
