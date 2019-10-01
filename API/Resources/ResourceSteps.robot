*** Settings ***
Resource          ../Resources/PO/ResourceRequests.robot

*** Variable ***
${petNotFoundCode}                 404
${petNotFoundMessage}              Pet not found

*** Keywords ***
que esteja conectado na API Petstore do Swagger
  Connect ao API

efetuada consulta por status ${Status}
  Find pet by status               ${Status}

é retornada a consulta com os pets com o status ${Status}
  Validate Response by Status      ${Status}

efetuada consulta por id ${Id}
  Find pet by id                   ${Id}

é retornada a consulta com o pet ${Name} com o status ${Status}
  Validate Response by Name        ${Status}    ${Name}

é retornada a consulta com erro de pet não encontrado
  Validate Response                ${petNotFoundCode}     ${petNotFoundMessage}

é retornada a consulta vazia
  Validade Empty Response

Validar se o endpoint está responsivo
  Endpoint Health Check

Validar contrato da resposta
  No Operation

efetuada a requisição de cadastro do "${fileName}"
  Post Pet                         ${fileName}