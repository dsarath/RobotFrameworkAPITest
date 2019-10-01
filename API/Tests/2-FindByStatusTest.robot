*** Settings ***
Resource          ../Resources/BDDpt-br.robot
Resource          ../Resources/ResourceSteps.robot

*** Variable ***

*** Test Cases ***
Cenário 01: Efetuar consulta por status Available
  Dado(a) que esteja conectado na API Petstore do Swagger
  Quando efetuada consulta por status available
  Então é retornada a consulta com os pets com o status available

Cenário 02: Efetuar consulta por status Pending
  Dado(a) que esteja conectado na API Petstore do Swagger
  Quando efetuada consulta por status pending
  Então é retornada a consulta com os pets com o status pending

Cenário 03: Efetuar consulta por status Sold
  Dado(a) que esteja conectado na API Petstore do Swagger
  Quando efetuada consulta por status sold
  Então é retornada a consulta com os pets com o status sold

Cenário 04: Efetuar consulta por status inexistente
  Dado(a) que esteja conectado na API Petstore do Swagger
  Quando efetuada consulta por status ABC
  Então é retornada a consulta vazia
