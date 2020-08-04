*** Settings ***
Documentation   Teste do Login no NinjaChef Mobile

Resource            ../resources/base.robot

Test Setup          Open Session
Test Teardown       Close Session
*** Test Case ***
Acessar O Cardápio
    Dado Que Desejo Comer "Massas"
    Quando Submeto Meu Email "vitor.calado@outlook.com.br"
    Então Devo Ver A Lista De Pratos Por Tipo
