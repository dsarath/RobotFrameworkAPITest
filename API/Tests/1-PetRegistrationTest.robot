*** Settings ***
Resource          ../Resources/BDDpt-br.robot
Resource          ../Resources/ResourceSteps.robot

*** Variable ***
${Name}           blackcat
${Status}         available

*** Test Cases ***
Cenário 01: Health check no endpoint
  [Tags]  HealthCheck
  Validar se o endpoint está responsivo

Cenário 02: Cadastrar o novo Pet 
  Dado(a) que esteja conectado na API Petstore do Swagger
  Quando efetuada a requisição de cadastro do "newPet"
  Então é retornada a consulta com o pet ${Name} com o status ${Status}