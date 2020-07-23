*** Settings ***
Documentation   Aqui teremos todas as palavras chaves de automação dos comportamentos

Library		SeleniumLibrary

*** Keywords ***
Dado Que Acesso A Página Principal
    Go To    http://ninjachef-qaninja-io.umbler.net/

Quando Submeto O Meu Email "${EMAIL}"
    Input Text    id:email     ${EMAIL}
    Click Element    css:button[type=submit]

Então Devo Ser Autenticado
    Wait Until Page Contains Element    class:dashboard

Então Devo Ver A Mensagem "${MENSAGEM}"
    Wait Until Element Contains     class:alert     ${MENSAGEM}
    
