*** Settings ***
Documentation   Aqui teremos todas as palavras chaves de automação dos comportamentos

Library		SeleniumLibrary

*** Keywords ***
Dado Que Acesso A Página Principal
    Go To    ${base_url}

Quando Submeto O Meu Email "${email}"
    Input Text          ${CAMPO_EMAIL}     ${email}
    Click Element       ${BOTAO_ENTRAR}

Então Devo Ser Autenticado
    Wait Until Page Contains Element    ${DIV_DASH}

Então Devo Ver A Mensagem "${mensagem}"
    Wait Until Element Contains     ${DIV_ALERT}     ${mensagem}

# Cadastro de Pratos
Dado que "${produto}" é um dos meus pratos
    Set Test Variable    ${produto}


Quando eu faço o cadastro desse item
    Wait Until Element Is Visible       ${BOTAO_ADD}       5
    Click Element                       ${BOTAO_ADD}

    Choose File      ${CAMPO_FOTO}      ${EXECDIR}/resources/images/${produto['img']}

    Input Text       ${CAMPO_NOME}            ${produto['nome']}
    Input Text       ${CAMPO_TIPO}            ${produto['tipo']}
    Input Text       ${CAMPO_PRECO}           ${produto['preco']}
    Click Element    ${BOTAO_CADASTRAR}

Então devo ver esse prato no meu dashboard
    Wait Until Element Contains     ${DIV_LISTA}      ${produto['nome']}
