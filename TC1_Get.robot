*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_URL}     http://localhost:3000
#${City}     ASM


*** Test Cases ***
ToGet_Weather_Report
    create session    MyName     ${base_URL}
    ${Response}=    GET On Session    MyName    /ASM
    #log to console    ${Response}
    log to console    ${Response.content}
    #log to console    ${Response.status_code}
    #log to console    ${Response.text}
    #log to console    ${Response.headers}

    #Validations
    ${Status_Code}=     convert to string    ${Response.status_code}
    should be equal     ${Status_Code}      200
    ${Content}=     convert to string    ${Response.content}
    log to console    ${Content}
    should contain      ${Content}      Ishu
   # ${Headers}=     convert to string    ${Response.headers}
    #should contain      ${Headers}      Content-Length      Express
    #here we use collection library
    #${Head}=    get from dictionary    ${Response.headers}     Content-Length
    #should be equal     ${Head}     185
