*** Settings ***
Documentation		Suite dos testes de cadastro

Resource             ../resources/base.robot

Test Setup			Open Session
Test Teardown		Close Session

*** Test Case ***
Cadstro Simples
	Dado Que Acesso A Página Principal
	Quando Submeto O Meu Email "joao@gmail.com"
	Então Devo Ser Autenticado
