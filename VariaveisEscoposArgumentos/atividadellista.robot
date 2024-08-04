*** Settings ***
Library    String

*** Variables ***
&{PESSOA}    nome=Marlon    sobrenome=Porto

*** Test Cases ***
email customizado
    
    ${EMAIL}    criando email    ${PESSOA.nome}    ${PESSOA.sobrenome}      

*** Keywords ***

criando email
    [Arguments]  ${PESSOA.nome}    ${PESSOA.sobrenome}
    ${PALAVRA_ALEATORIA}    Generate Random String
    ${EMAIL_CRIADO}    Set Variable    ${PESSOA.nome}${PESSOA.sobrenome}${PALAVRA_ALEATORIA}@testerobot.com
    [Return]    ${EMAIL_CRIADO}

    Log To Console    ${EMAIL_CRIADO}