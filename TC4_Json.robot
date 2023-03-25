*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections

*** Test Cases ***
TestCase1
    ${json_obj}=    load json from file    C:/Users/ASM/PycharmProjects/API_RFW_Testing/files/ValidateJson.json
    log to console    ${json_obj}
    #to get particular valus
    ${first_name}=  get value from json     ${json_obj}     FirstName
    log to console    ${first_name}
    ${address}=     get value from json    ${json_obj}      Address.Street
    log to console    ${address}
    ${phone}=   get value from json    ${json_obj}      PhoneNum[0].Num
    log to console    ${phone}
    should be equal    ${phone[0]}      12345
