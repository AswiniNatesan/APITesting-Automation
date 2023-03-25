*** Settings ***
Library    XML
Library    os
Library    RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://thomas-bayer.com
${sub_url}      /sqlrest/CUSTOMER/3

*** Test Cases ***
Testcase1
    Create Session    Mysession     ${base_url}
    ${response}=     GET On Session    Mysession     ${sub_url}
    log to console    ${response}
    log to console    ${response.content}
    ${string}=      convert to string    ${response.content}
    ${xml_obj}=     parse xml    ${string}

    #Check single element value
    element text should be    ${xml_obj}    542 Upland Pl.      .//STREET

    #Check multiple contents
    ${child_ele}=   get child elements    ${xml_obj}
    should not be empty    ${child_ele}
    ${length}=  get length    ${child_ele}
    ${particular}=      get element text    ${child_ele[0]}
    log to console    ${particular}
    FOR     ${i}    IN RANGE    0   ${length}
    ${text}=    get element text    ${child_ele[${i}]}
    log to console    ${text}
    END


