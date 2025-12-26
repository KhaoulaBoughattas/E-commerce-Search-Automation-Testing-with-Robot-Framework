*** Keywords ***
Ouvrir Navigateur
    [Arguments]    ${browser}
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    Sleep    2

Fermer Navigateur
    Close Browser

Recherche Produit
    [Arguments]    ${term}
    Input Text    name=search    ${term}
    Click Button css=button.btn.btn-default.btn-lg
    Sleep    2

Verifier Resultats
    [Arguments]    ${term}    ${inexistant}=False
    Run Keyword If    ${inexistant}    Page Should Contain    There is no product that matches the search criteria.
    ...    ELSE    Page Should Contain    ${term}
