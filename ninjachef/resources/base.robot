*** Settings ***
Documentation   Aqui temos a estrutura base do projeto, o selenium é importado
...             aqui

Library     SeleniumLibrary

Resource     kws.robot
*** Keywords ***
Open Session
    Open Browser    auto:blank      chrome

Close Session
    Close Browser
