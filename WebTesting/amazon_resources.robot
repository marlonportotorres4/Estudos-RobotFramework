*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}    chrome
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h2[@class='a-size-base a-color-base apb-browse-refinements-indent-1 a-text-bold'][contains(.,'Eletrônicos e Tecnologia')]    
${CAMPO_PESQUISA}    twotabsearchtextbox
${BOTAO_PESQUISA}    nav-search-submit-button
${CARRINHO}    nav-cart
${EXCLUIR_CARRINHO}    //input[@value='Excluir']
${CARRINHO_VAZIO}    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}   
    Maximize Browser Window
    
Captura de tela da pagina 
    Capture Page Screenshot

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    # NESSA FORMA, O ROBOT JÁ LE O QUE EU PASSEI NOS CASOS DE TESTES E SUBSTITUI
    # NO LOCAL CERTO ONDE BOTEI A VARIAVEL. ASSIM NAO PRECISO MUDAR A VARIAVEL CASO
    # EU MUDE O NOME NOS CASOS DE TESTES
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Rolar para baixo até a navegação de categorias
    Sleep    time_=3
    Scroll Element Into View    locator=//a[@aria-label='Computadores e Informática']
    Sleep    time_=3
    Scroll Element Into View    locator=//a[@aria-label='Computadores e Informática']
Verificar se o título da página fica "${TITULO_PAGINA}"   
    Title Should Be    title=${TITULO_PAGINA}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']
    #ASSIM, PODEMOS VISUALIZAR QUALQUER CATEGORIA SEM PRECISAR REPETIR
    

Verificar se aparece o campo de pesquisa
    Element Should Be Visible    locator=${CAMPO_PESQUISA}

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAMPO_PESQUISA}    text=${NOME_PRODUTO}    clear=false

 Clicar no botão de pesquisa
     Click Element    locator=${BOTAO_PESQUISA}

Verificar se o resultado da pesquisa esta listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Button    locator=a-autoid-1-announce

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Scroll Element Into View    locator=${CARRINHO}
    Click Element    locator=${CARRINHO}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=${EXCLUIR_CARRINHO}

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=${CARRINHO_VAZIO}

Clicar no produto "${PRODUTO}"
    Click Element    locator=//a[contains(.,'${PRODUTO}')]



















# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
   
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."   

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

 Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"   

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

 Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
     Verificar se o título da página fica "Amazon.com.br : Xbox Series S"   

E um produto da linha "Xbox Series S" deve ser mostrado na página
     Verificar se o resultado da pesquisa esta listando o produto "Console Xbox Series S"

E adicionar o produto "Console Xbox Series S" no carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
     