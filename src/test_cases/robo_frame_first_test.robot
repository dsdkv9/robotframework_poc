*** Settings ***
Documentation       Simple example using SeleniumLibrary.

Library             SeleniumLibrary


*** Variables ***
${SAMPLE_URL}       https://automationpanda.com/2021/12/29/want-to-practice-test-automation-try-these-demo-sites/
${BROWSER}          Chrome


*** Test Cases ***
Valid Add Contect
    Open Home Page
    Follow Blog Via Email
    [Teardown]    Close Browser


*** Keywords ***
Open Home Page
    Open Browser    ${SAMPLE_URL}    ${BROWSER}
    Maximize Browser Window

Navigate To Contact Page
    Click Element    //a[contains(text(),'Contact')]

Follow Blog Via Email
    Navigate To Contact Page
    Input Email Address
    Sleep    5s
    Submit Follow Email Address
    Sleep    5s

Input Email Address
    Input Text    //p[@id='subscribe-email']//input[@name='email']    abcd@testtt.com

Submit Follow Email Address
    Click Button    //p[@id='subscribe-submit']//button[@type='submit']
