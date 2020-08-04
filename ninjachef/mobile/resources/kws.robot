*** Settings ***
Documentation   Palavras chaves do projeto

Library         AppiumLibrary


*** Keywords ***
Dado Que Desejo Comer "${prato}"
    Set Test Variable    ${prato}

Quando Submeto Meu Email "${email}"
    Wait Until Page Contains        Buscar Prato        10

    Input Text          accessibility_id=emailInput     ${email}
    Input Text          accessibility_id=plateInput     ${prato}
    Click Text          Buscar Prato

Então Devo Ver A Lista De Pratos Por Tipo
    Sleep    5

    Wait Until Page Contains        Fome de ${prato}
