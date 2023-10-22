*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${OPEN_URL}                         https://demo.nopcommerce.com/
${BROWSER}                          Chrome
${search_store_locator}             //input[@id='small-searchterms']
${products_page_size_locator}       //select[@id='products-pagesize']
${search_product_button_locator}    //button[@type='submit'][1]


*** Keywords ***
Open Test Browser
    Open Browser    ${OPEN_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s

Close Test Browser
    Close Browser

Input Search Product Criteria
    [Arguments]    ${searchstoreby}
    Log    ${searchstoreby}
    Input Text    ${search_store_locator}    ${searchstoreby}

Click Search Button
    Click Button    ${search_product_button_locator}


