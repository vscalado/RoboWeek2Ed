*** Settings ***
Documentation       Cadastro de produtos/pratos
...                 Sendo um cosinheiro amador
...                 Quero cadastrar meus melhores pratos
...                 Para que eu possa cozinha-los para outras pessoas

Resource            ../resources/base.robot

Test Setup			Open Session
Test Teardown		Close Session

*** Variables ***
&{nnhoque}=         nome=Nnhoque molhoo páprica     tipo=Massas     preco=20.00

*** Test Case ***
Novo prato
    Dado que "${nnhoque}" é um dos meus pratos
    Quando eu faço o cadastro desse item
    Então devo ver esse prato no meu dashboard
