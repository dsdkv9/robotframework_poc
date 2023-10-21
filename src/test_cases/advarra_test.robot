*** Settings ***
# Library    ${RESOURCES_PATH}/Lib/site-packages/RequestsLibrary/RequestsKeywords.py
Library     RequestsLibrary


*** Variables ***
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
    Create User Via HTTP API Call


*** Keywords ***
Create User Via HTTP API Call
    ${headers}=    Create Dictionary    Content-Type    application/json
    # &{body}=    Create Dictionary
    # ...    api_user_title=${api_user_title}
    # ...    api_user_first_name=${api_user_first_name}
    # ...    api_user_middle_name=${api_user_middle_name}
    # ...    api_user_last_name=${api_user_last_name}
    # ...    api_user_email=${api_user_email}
    # ...    api_user_system_role=${api_user_system_role}
    # ...    api_user_role_title=${api_user_role_title}
    # ...    api_user_country_code=${api_user_country_code}
    # ...    api_user_office_phone=${api_user_office_phone}
    # ...    api_user_sms=${api_user_sms}
    # ...    api_user_timezone=${api_user_timezone}
    # ...    api_user_email_alerts=${api_user_email_alerts}
    # ...    api_user_sms_alerts=${api_user_sms_alerts}
    # ...    api_user_language=${api_user_language}

    ${payload}=    Catenate
    ...    SEPARATOR=
    ...    {"api_user_title":"${api_user_title}","api_user_first_name":"${api_user_first_name}",
    ...    "api_user_middle_name":"${api_user_middle_name}","api_user_last_name":"${api_user_last_name}",
    ...    "api_user_email":"${api_user_email}","api_user_system_role":"${api_user_system_role}",
    ...    "api_user_role_title":"${api_user_role_title}","api_user_country_code":"${api_user_country_code}",
    ...    "api_user_office_phone":"${api_user_office_phone}","api_user_sms":"${api_user_sms}",
    ...    "api_user_timezone":"${api_user_timezone}","api_user_email_alerts":"${api_user_email_alerts}",
    ...    "api_user_sms_alerts":"${api_user_language}","api_user_language":"${api_user_language}"}
    
    ${REQUEST_URL}=    Catenate    SEPARATOR=    ${HTTP_LOCAL_SERVER}${API_ADMIN_PATH}
    
    ${response}=    POST    uri=${REQUEST_URL}    json=${payload}

    RETURN ${response}
