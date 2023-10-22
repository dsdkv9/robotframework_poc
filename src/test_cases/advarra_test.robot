*** Settings ***
# Library    ${RESOURCES_PATH}/Lib/site-packages/RequestsLibrary/RequestsKeywords.py
Library     RequestsLibrary
Library     SeleniumLibrary
Library    json
Library    Screenshot


*** Variables ***
${headers}=                 Create Dictionary    Content-Type    application/json

${HTTP_LOCAL_SERVER}        http://sw4-qa-lb.longboat.qa.advarraeng.com
${API_ADMIN_PATH}           /test1/admin/users
${api_user_title}           Mr.
${api_user_first_name}      Peter
${api_user_middle_name}     ${EMPTY}
${api_user_last_name}       garcia
${api_user_email}           peter_garcia@mail.bi
${api_user_system_role}     CLIENT
${api_user_role_title}      ${EMPTY}
${api_user_country_code}    BG
${api_user_office_phone}    +353892525252
${api_user_sms}             +353892525252
${api_user_timezone}        Europe/Dublin
${api_user_email_alerts}    0
${api_user_sms_alerts}      0
${api_user_language}        en


*** Tasks ***
Test Create User Via HTTP API Call
    ${payload}=    Catenate
    ...    SEPARATOR=
    ...    {"api_user_title":"${api_user_title}","api_user_first_name":"${api_user_first_name}",
    ...    "api_user_middle_name":"${api_user_middle_name}","api_user_last_name":"${api_user_last_name}",
    ...    "api_user_email":"${api_user_email}","api_user_system_role":"${api_user_system_role}",
    ...    "api_user_role_title":"${api_user_role_title}","api_user_country_code":"${api_user_country_code}",
    ...    "api_user_office_phone":"${api_user_office_phone}","api_user_sms":"${api_user_sms}",
    ...    "api_user_timezone":"${api_user_timezone}","api_user_email_alerts":"${api_user_email_alerts}",
    ...    "api_user_sms_alerts":"${api_user_language}","api_user_language":"${api_user_language}"}

    ${response}=    Create User Via HTTP API Call    test_payload=${payload}

    Should Be Equal As Numbers    200    ${response.json()}[status_code]


*** Keywords ***
Create User Via HTTP API Call
    [Arguments]    ${test_payload}

    ${REQUEST_URL}=    Catenate    SEPARATOR=    ${HTTP_LOCAL_SERVER}${API_ADMIN_PATH}

    ${response}=    POST    uri=${REQUEST_URL}    json=${test_payload}

    RETURN ${response}

Test Keyword
    [Arguments]    ${abc}
    Log    ${abc}

Get Active Users From Country
    [Arguments]    ${study}    ${country_name}
    Log    Filtering counter name: ${country_name}
    ${select_study_from_drop_down}=    Catenate    SEPARATOR=    generic_lcator_${study}
    ${select_country_name_from_drop_down}=    Catenate    SEPARATOR=    generic_lcator_${country_name}
    
    @{users_list}=    Get Users List 

Get Users List 
    Log    Write following code here
    Log    Get count of users list may be drop down
    Log    Iterate list and read element text
    Log    Append List
    Log    Return User List

Page Screenshot with no input arguments
    Run Keyword And Ignore Error    
    ...    Take Screenshot
