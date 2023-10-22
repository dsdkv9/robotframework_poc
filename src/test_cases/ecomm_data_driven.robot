*** Settings ***
Library    SeleniumLibrary
Resource    ecomm_resources.robot
Library    DataDriver    ecomm.xlsx    sheet_name=Sheet1

Suite Setup    Open Test Browser
Suite Teardown    Close Test Browser

Test Template    Validate Product Search

*** Test Cases ***
SearchProductWithExcel    ${searchstoreby}

*** Keywords ***
Validate Product Search
    [Arguments]    ${searchstoreby}
    Log    ${searchstoreby}
    Input Search Product Criteria    ${searchstoreby}
    Click Search Button