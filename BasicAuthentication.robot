*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://3.110.179.1/esp-ui/services/api/v1
${sub_url}      /login
${barear_token}     "Barear eyJhbGciOiJIUzUxMiIsImlhdCI6MTY2OTcwNDk2NiwiZXhwIjoxNjcwMzA5NzY2fQ.eyJpZCI6MX0.VTphaedfhR90udzgtwu7XbhopgXKfK0uCq_BLOsaX_4uBo60rjCyxIvswL45x1XN0UaLfCz0mZXUcBVsw6ZEew"

*** Test Cases ***
Testcase1
    #@{auth}     create list    admin    Admin@1234
    Create Session    Mysession     ${base_url}     verify=true     #ssl_verify=false    #options=add_argument("--ignore-certificate-errors")
    ${header}=  create dictionary    Authorization=${barear_token}      Content-Type=application/json
    ${data}=    create dictionary    username=admin     password=Admin@1234
    ${response}=    POST On Session    Mysession    ${sub_url}      data=${data}    headers=${header}
    log to console    ${response.content}
    log to console    ${response.status_code}