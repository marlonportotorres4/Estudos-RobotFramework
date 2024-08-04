*** Variables ***

@{NUMEROS}    0  3  5  7  9  10  13

*** Test Cases ***

Percorrendo lista FOR
    imprimir numero 5 e 10
 

*** Keywords ***

imprimir numero 5 e 10
   Log To Console    ${\n}
   
    FOR    ${i}    IN    @{NUMEROS}
        IF   ${i} == 5
           
            Log To Console     Eu sou o número 5! - ${i} -
            
        ELSE IF  ${i} == 10
            
            Log To Console     Eu sou o número 10! - ${i} -

        ELSE
            
            Log To Console    Eu nao sou nem o numero 5, nem o 10! - ${i} -
        END
        
    END