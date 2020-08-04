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

### Kewywords do Cenário Receber Novo Pedido
Dado Que "${email_cozinheiro}" é a minha conta de cozinheiro
	Set Test Variable		${email_cozinheiro}

    ${token_cozinheiro}=    Get Login Api           ${email_cozinheiro}
	Set Test Variable		${token_cozinheiro}

E "${email_cliente}" é o email do meu cliente
	Set Test Variable		${email_cliente}

	${token_cliente}=       Get Login Api           ${email_cliente}
	Set Test Variable		${token_cliente}

E que "${produto}" está cadastrado no meu dashboard
	Set Test Variable		${produto}

	&{payload}=				Create Dictionary		name=${produto}		plate=Tipo		price=20.00

	${image_file}=			Get Binary File			${EXECDIR}/resources/images/feijoada.jpg
	&{files}=				Create Dictionary		thumbnail=${image_file}

	&{headers}=				Create Dictionary		user_id=${token_cozinheiro}

	Create Session    		api         		${api_url}
    ${resp}=          		Post Request    	api		/products		files=${files}		data=${payload} 	headers=${headers}
	Status Should Be  		200            		${resp}

	${produto_id}		Convert To String		${resp.json()['_id']}
	Set Test Variable		${produto_id}

	#Acessando o Dashboard
	Go To               ${base_url}
    Input Text          ${CAMPO_EMAIL}        ${email_cozinheiro}
    Click Element       ${BOTAO_ENTRAR}

    Wait Until Page Contains Element    ${DIV_DASH}

Quando O Cliente Solicita O Preparo De Um Dos Meus Pratos 
	Set Test Variable		${email_cozinheiro}

	&{headers}=				Create Dictionary		Content-Type=application/json		user_id=${token_cliente}
	&{payload}=				Create Dictionary		payment=Dinheiro

	Create Session    		api         			${api_url}
    ${resp}=          		Post Request    		api		/products/${produto_id}/orders		data=${payload} 	headers=${headers}
	Status Should Be  		200            			${resp}

	${token_cozinheiro}		Convert To String		${resp.json()['_id']}
	Set Test Variable		${token_cozinheiro}

Então Devo Receber Uma Notificação De Pedido
	${mensaagem_esperada}			Convert To String		${email_cliente} está solicitando o preparo do seguinte prato: ${produto}.
	Wait Until Page Contains		${mensaagem_esperada}		5


E Posso Aceitar ou Rejeitar Esse Pedido
	Wait Until Page Contains		ACEITAR			5
	Wait Until Page Contains		REJEITAR		5