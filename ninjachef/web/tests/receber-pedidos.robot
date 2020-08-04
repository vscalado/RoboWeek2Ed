
*** Settings ***
Documentation		Receber pedidos
...					Sendo um cozinheiro que possui pratos no dashboard
...					Quero receber solicitações de preparo dos meus pratos
...					Para que eu possa envia´los aos meus clientes

Resource             ../resources/base.robot

Test Setup			Open Session
Test Teardown		Close Session

*** Test Case ***
Receber Novo Pedido
	Dado Que "vitor.santos.calado@gmail.com" é a minha conta de cozinheiro
	E "vitor.calado@outlook.com" é o email do meu cliente
	E que "Feijoada" está cadastrado no meu dashboard
	Quando O Cliente Solicita O Preparo De Um Dos Meus Pratos
	Então Devo Receber Uma Notificação De Pedido
	E Posso Aceitar ou Rejeitar Esse Pedido
