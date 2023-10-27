*** Settings ***
Library             SeleniumLibrary
Resource            ecomm_resources.robot
Library             DataDriver    ecomm.xlsx    sheet_name=Sheet1

Suite Setup         Open Test Browser
Suite Teardown      Close Test Browser
Test Template       Validate Product Search


*** Variables ***
${test_env}     ${EMPTY}
${OS}           ${EMPTY}
${IP}           ${EMPTY}


*** Test Cases ***
SearchProductWithExcel    ${searchstoreby}


*** Keywords ***
Validate Product Search
    [Arguments]    ${searchstoreby}
    Log    ${searchstoreby}
    Log    test_env: ${test_env}, OS: ${OS} & IP: ${IP}
    Input Search Product Criteria    ${searchstoreby}
    Click Search Button
