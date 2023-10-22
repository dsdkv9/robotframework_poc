*** Settings ***
Documentation       Example using the space separated format.

Library    json

*** Variables ***
@{SUITE_AUDIT_LIST}     Deepak    20    Verma    90    Kumar    89


*** Test Cases ***
# Assigning scalar variables
#     ${x} =    Get X    an argument
#     Log    We got ${x}!
#     Set Local Variable    ${var_space}    ${SPACE}
#     Log    ${var_space}
#     Set Local Variable    ${var_empty}    ${EMPTY}
#     Log    ${var_empty}
#     # Should Be Equal    ${SPACE}    ${EMPTY}

# Add two numbers
#     Given I have Calculator open
#     When I add 2 and 40
#     Then result should be 42

# Add negative numbers
#     Given I have Calculator open
#     When I add 1 and -2
#     Then result should be -1

Verify All Audit Entries
    Log    ${SUITE_AUDIT_LIST}

    FOR    ${element}    IN    @{SUITE_AUDIT_LIST}
        Log    ${element}
    END

*** Keywords ***
Get x
    [Arguments]    ${arg}
    Log    ${arg}

I have ${program} open
    Start Program    ${program}

I add ${number 1} and ${number 2}
    Input Number    ${number 1}
    Push Button    +
    Input Number    ${number 2}
    Push Button    =

Result should be ${expected}
    ${result} =    Get Result
    Should Be Equal    ${result}    ${expected}

Start Program
    [Arguments]    ${program}
    Log    Start Program

Input Number
    [Arguments]    ${number}
    Log    Input Number

Push Button
    [Arguments]    ${number}
    Log    Push Button

Get Result
    Log    Get Result
