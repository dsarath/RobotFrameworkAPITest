*** Settings ***
#Externas
Library   OperatingSystem
Library   RequestsLibrary
Library   String
Library   Collections
Library   BuiltIn

*** Variable ***
${BaseUrl}                  https://petstore.swagger.io/v2
${findByStatus}             /pet/findByStatus
${findById}                 /pet


*** Keywords ***
Connect ao API
  Create Session            PetStore        ${BaseUrl}

Find pet by status
  [Arguments]               ${Status}
  ${Response}=              Get Request     PetStore   ${findByStatus}?status=${Status} 
  Set Test Variable         ${Response}

Find pet by id
  [Arguments]               ${Id}
  ${Response}=              Get Request     PetStore   ${findById}/${Id}
  Set Test Variable         ${Response}

Validate Response by Status
  [Arguments]               ${Status}
  Should Be Equal As Strings                ${Response.status_code}           200
  Should Contain                            ${Response.json()[0]['status']}   ${Status}

Validate Response by Name
  [Arguments]               ${Status}       ${Name}
  Should Be Equal As Strings                ${Response.status_code}           200
  Should Contain                            ${Response.json()['status']}   ${Status}
  Should Contain                            ${Response.json()['name']}     ${Name}

Validate Response          
  [Arguments]               ${Code}         ${Message}
  Should Be Equal As Strings                ${Response.status_code}          ${Code}
  Should Contain                            ${Response.json()['message']}    ${Message} 

Validade Empty Response
  Should Be Equal As Strings                ${Response.status_code}           200
  Should Be Empty           ${Response.json()}

Endpoint Health Check
  Connect ao API
  ${Response}=              Options Request    PetStore                    ${findByStatus}
  Should Be Equal As Strings                ${Response.status_code}  204
  Dictionary Should Contain Key             ${Response.headers}      allow

Post Pet
  [Arguments]               ${fileName}
  ${fileData}=              Get Binary File    ./API/Resources/${fileName}.json
  &{headers}=               Create Dictionary  Content-Type=application/json
  ${Response}=              Post Request     PetStore   ${findById}   data=${fileData}    headers=${headers}
  Set Test Variable         ${Response}

# Confere o status code
#     [Arguments]     ${STATUS_ESPERADO}
#     Should Be Equal As Strings   ${RESPOSTA.status_code}  ${STATUS_ESPERADO}
#     Log             Status Code Retornado: ${RESPOSTA.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}

# Confere endereço do CEP
#     [Arguments]        ${ENDERECO}
#     Dictionary Should Contain Item  ${RESPOSTA.json()}  endereco   ${ENDERECO}
  
#   &{headers}=    Create Dictionary  Content-Type=application/json  Authentication=Bearer ${AuthToken}
#   Set Test Variable                 ${headers}

# Valida erro na resposta
#   [Arguments]          ${Resp}
#   Should Be Equal As Strings  ${Resp.status_code}         401
#   Should Contain              ${Resp.json()['error']}     Unauthorized
#   Should Contain              ${Resp.json()['message']}   Unauthorized
