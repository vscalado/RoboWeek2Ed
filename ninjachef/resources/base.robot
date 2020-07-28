*** Settings ***
Documentation   Aqui temos a estrutura base do projeto, o selenium é importado
...             aqui

Library         SeleniumLibrary

Resource        elements.robot
Resource        kws.robot
Resource        helpers.robot


*** Variables ***
${base_url}     http://ninjachef-qaninja-io.umbler.net/

*** Keywords ***
Open Session
    Open Browser    auto:blank      chrome

Close Session
    Close Browser
