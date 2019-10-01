*** Settings ***
Resource          ../Resources/BDDpt-br.robot
Resource          ../Resources/ResourceSteps.robot

*** Variable ***
${Id}             121991
${Name}           blackcat
${Status}         available

*** Test Cases ***
Cenário 01: Health check no endpoint
  [Tags]  HealthCheck
  Validar se o endpoint está responsivo

Cenário 02: Contract Test no endpoint
  [Tags]  Contract
  Validar contrato da resposta 

Cenário 03: Efetuar consulta por id
  Dado(a) que esteja conectado na API Petstore do Swagger
  Quando efetuada consulta por id ${Id}
  Então é retornada a consulta com o pet ${Name} com o status ${Status}

Cenário 04: Efetuar consulta por id inválido
  Dado(a) que esteja conectado na API Petstore do Swagger
  Quando efetuada consulta por id 753
  Então é retornada a consulta com erro de pet não encontrado