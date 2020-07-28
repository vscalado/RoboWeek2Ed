*** Settings ***
Documentation       Cadastro de produtos/pratos
...                 Sendo um cosinheiro amador
...                 Quero cadastrar meus melhores pratos
...                 Para que eu possa cozinha-los para outras pessoas

Resource            ../resources/base.robot

Test Setup			Login Session      vitor.santos.calado@gmail.com
Test Teardown		Close Session

*** Variables ***
&{nnhoque}=         img=nhoquepaprica.jpg   nome=Nnhoque molhoo páprica     tipo=Massas     preco=20.00

*** Test Case ***
Novo prato
    Dado que "${nnhoque}" é um dos meus pratos
    Quando eu faço o cadastro desse item
    Então devo ver esse prato no meu dashboard
