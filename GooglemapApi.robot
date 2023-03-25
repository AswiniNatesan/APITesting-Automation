*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://maps.googleapis.com
${req}      /maps/api/place/nearbysearch/json?

*** Test Cases ***
GoogleMapPlacsAPI
    Create Session    Mysession     ${base_url}
    ${params}=      create dictionary    location=-33.8670522,151.1957362   radius=500      types=food      name=harbour    key=AIzaSyDm6AoA3BI3d5UlcdnkB_IM8R1Rb1bYLtU
    ${response}=    GET On Session    Mysession     ${req}      params=${params}
    log to console    ${response.content}
