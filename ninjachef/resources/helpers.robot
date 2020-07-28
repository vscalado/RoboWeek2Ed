*** Settings ***
Documentation       Aqui teremos palavras chaves de apoio


*** Keywords ***

Login Session
    [Arguments]     ${EMAIL}
    Open Session

    Go To               http://ninjachef-qaninja-io.umbler.net/

    Input Text          id:email        ${EMAIL}
    Click Element       css:button[type=submit]
    
    Wait Until Page Contains Element    class:dashboard
