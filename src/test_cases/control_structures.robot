*** Settings ***

*** Variables ***
@{LIST}         a    b    c
@{NUMBERS}       ${1}    ${2}    ${5}
@{NAMES}         one     two     five
@{ABC}           a    b    c
@{XYZ}           x    y    z
@{NUM}           1    2    3

*** Test Cases ***
Manage index manually
    ${index} =    Set Variable    -1
    FOR    ${item}    IN    @{LIST}
        ${index} =    Evaluate    ${index} + 1
        My Keyword    ${index}    ${item}
    END

FOR-IN-ENUMERATE
    [Tags]    Smoke
    FOR    ${index}    ${item}    IN ENUMERATE    @{LIST}
        My Keyword    ${index}    ${item}
    END

Iterate over two lists manually
    ${length}=    Get Length    ${NUMBERS}
    FOR    ${index}    IN RANGE    ${length}
        Log Many    ${NUMBERS}[${index}]    ${NAMES}[${index}]
    END

FOR-IN-ZIP
    FOR    ${number}    ${name}    IN ZIP    ${NUMBERS}    ${NAMES}
        Log Many    ${number}    ${name}
    END

FOR-IN-ZIP with multiple lists
    FOR    ${a}    ${x}    ${n}    IN ZIP    ${ABC}    ${XYZ}    ${NUM}
        Log Many    ${a}    ${x}    ${n}
    END

FOR-IN-ZIP with one variable
    FOR    ${items}    IN ZIP    ${ABC}    ${XYZ}    ${NUM}
        Length Should Be    ${items}    3
        Log Many    ${items}[0]    ${items}[1]    ${items}[2]
    END

*** Keywords ***
My Keyword
    [Arguments]    ${index}    ${item}
    Log    ${index}: ${item}
