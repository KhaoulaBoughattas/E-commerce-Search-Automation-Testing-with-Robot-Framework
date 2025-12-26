*** Settings ***
Library           SeleniumLibrary
Resource          keywords.robot

*** Test Cases ***
Recherche Produits Existants
    Ouvrir Navigateur    ${BROWSER}
    :FOR    ${term}    IN    @{TERMS_EXISTANTS}
    Recherche Produit    ${term}
    Page Should Contain    ${term}
    Fermer Navigateur
