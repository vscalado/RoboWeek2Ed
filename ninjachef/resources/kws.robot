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

# Cadastro de Pratos
Dado que "${produto}" é um dos meus pratos
    Set Test Variable    ${produto}


Quando eu faço o cadastro desse item
    Wait Until Element Is Visible       class:btn-add       5
    Click Element                       class:btn-add

    Choose File      css:input[id=thumbnail]    ${EXECDIR}/resources/images/${produto['img']}

    Input Text       id:name            ${produto['nome']}
    Input Text       id:plate           ${produto['tipo']}
    Input Text       id:price           ${produto['preco']}
    Click Element    class:btn-cadastrar

Então devo ver esse prato no meu dashboard
    Wait Until Element Contains     class:product-list      ${produto['nome']}
