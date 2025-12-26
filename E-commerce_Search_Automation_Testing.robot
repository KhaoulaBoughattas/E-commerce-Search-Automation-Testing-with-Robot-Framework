*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://tutorialsninja.com/demo/index.php?route=product/category&path=24

*** Test Cases ***
ProjectEcommerce
    [Documentation]    Teste tous les scénarios de recherche en un seul test avec pauses
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2
    # --- Produits existants ---
    Input Text    name=search    MacBook
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    MacBook
    Sleep    1
    Input Text    name=search    iPhone
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    iPhone
    Input Text    name=search    ${EMPTY}
    Sleep    1
    # --- Produits inexistants ---
    Input Text    name=search    XYZ123
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    There is no product that matches the search criteria.
    Input Text    name=search    ABC999
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    There is no product that matches the search criteria.
    Input Text    name=search    ${EMPTY}
    Sleep    1
    # --- Différentes écritures (casse) ---
    Input Text    name=search    MacBook
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    MacBook
    Sleep    1
    Input Text    name=search    macbook
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    MacBook
    Sleep    1
    Input Text    name=search    MaCbOok
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    MacBook
    Input Text    name=search    ${EMPTY}
    Sleep    1
    # --- Recherche vide ---
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    There is no product that matches the search criteria.
    Sleep    1
    # --- Caractères spéciaux ---
    Input Text    name=search    @#$%^&*
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    There is no product that matches the search criteria.
    Sleep    1
    Input Text    name=search    123456
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Page Should Contain    There is no product that matches the search criteria.
    Input Text    name=search    ${EMPTY}
    Sleep    1
    # --- Navigation vers page produit ---
    Input Text    name=search    MacBook
    Sleep    1
    Click Element    css=button.btn.btn-default.btn-lg
    Sleep    2
    Click Link    xpath=//a[contains(text(),'MacBook')]
    Sleep    2
    Page Should Contain    MacBook
    Sleep    8
    Close Browser
