*** Settings ***
Documentation		Suite dos testes de cadastro

*** Test Case ***
Cadstro Simples
	Dado Que Acesso A Página Principal
	Quando Submeto O Meu Email "joao@gmail.com"
	Então Devo Ser Autenticado

*** Keywords ***
Dado Que Acesso A Página Principal
	