*** Settings ***
Library    XML
Library    os
Library    Collections

*** Test Cases ***
Xml Testing
    ${xml_obj}=     parse xml    C:/Users/ASM/Desktop/Python/new1.xml
    ${ans}=     get element text    ${xml_obj}
    #log to console    ${ans}
    #Validations
    #check single element value
    ${DOB}=     get element text    ${xml_obj}      .//employee[2]/DOB
    log to console      ${DOB}
    should be equal    ${DOB}   2010

    #approch 2
    ${element}=     get element     ${xml_obj}       .//employee[2]/DOB
    should be equal    ${element.text}      2010

    #approch3
    element text should be      ${xml_obj}      2010        .//employee[2]/DOB

    #validation 2    check no of elements
    ${count}=   get element count    ${xml_obj}     .//employee/Firstname
    ${count1}=   get element count    ${xml_obj}     .//employee
    log to console    ${count}
    log to console    ${count1}
    ${convert}=     convert to string    ${count}
    ${num}=     convert to integer    5
    should be equal    ${count}     ${num}
    should be equal as integers    ${count}     5

    #to chck attribute present
    element attribute should be      ${xml_obj}     id  103     .//employee[3]
    element attribute should be    ${xml_obj}       id  101     .//employee[1]

    #to check values of child element
    ${ele}=     get child elements    ${xml_obj}    .//employee[1]
    should not be empty    ${ele}
    log to console    ${ele}
    ${length}=  get length    ${ele}
    FOR     ${i}    IN RANGE    0   ${length}
    ${text}=    get element text    ${ele[${i}]}
    log to console    ${text}
    END