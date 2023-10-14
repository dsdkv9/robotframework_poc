*** Settings ***
Documentation    Example using the space separated format.
Library    OperatingSystem

*** Variables ***
${MESSAGE}    Hello, world!
${HOST}


*** Test Cases ***
My Test
    [Documentation]    Example test.
    Log    ${MESSAGE}
    My Keyword    ${CURDIR}

Another Test
    Should Be Equal    ${MESSAGE}    Hello, world!

Command Line Argumant Test
    Log    ${HOST}

Assign multiple
    ${a}    ${b}    ${c} =   Get Three 
    ${first}    @{rest} =    Get Three
    @{before}    ${last} =    Get Three
    ${begin}    @{middle}    ${end} =    Get Three
    Log    ${a}
    Log    ${first}
    Log    ${before}

*** Keywords ***
My Keyword
    [Arguments]    ${path}
    Directory Should Exist    ${path}

Get Three
    @{return_list}=    Create List    1    2    3
    Log     ${return_list}
    RETURN    @{return_list}
