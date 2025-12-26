*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://tutorialsninja.com/demo/index.php?route=product/category&path=24

*** Test Cases ***    \
Test Produits Existants

${URL}                ${BROWSER}

Maximize Browser Window

Input Text            name=search                          MacBook

Click Element         css=button.btn.btn-default.btn-lg

Page Should ContainMacBook

Input Text            name=search

Input Text            name=search                          iPhone

Click Element         css=button.btn.btn-default.btn-lg

Page Should Contain
                      iPhone
                      Close Browser

Test Produits Inexistants
                      Open Browser                         ${URL}                                                   ${BROWSER}
                      Maximize Browser Window
                      Input Text                           name=search                                              XYZ123
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Page Should Contain                  There is no product that matches the search criteria.
                      Input Text                           name=search
                      Input Text                           name=search                                              ABC999
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Page Should Contain                  There is no product that matches the search criteria.
                      Close Browser

Test Différentes Ecritures
                      Open Browser                         ${URL}                                                   ${BROWSER}
                      Maximize Browser Window
                      Input Text                           name=search                                              MacBook
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Page Should Contain                  MacBook
                      Input Text                           name=search
                      Input Text                           name=search                                              macbook
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Page Should Contain                  MacBook
                      Input Text                           name=search
                      Input Text                           name=search                                              MaCbOok
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Page Should Contain                  MacBook
                      Close Browser

Test Recherche Vide
                      Open Browser                         ${URL}                                                   ${BROWSER}
                      Maximize Browser Window
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Page Should Contain                  There is no product that matches the search criteria.
                      Close Browser

Test Caractères Spéciaux
                      Open Browser                         ${URL}                                                   ${BROWSER}
                      Maximize Browser Window
                      Input Text                           name=search                                              @#$%^&*
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Page Should Contain                  There is no product that matches the search criteria.
                      Input Text                           name=search
                      Input Text                           name=search                                              123456
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Page Should Contain                  There is no product that matches the search criteria.
                      Close Browser

Test Navigation Vers Page Produit
                      Open Browser                         ${URL}                                                   ${BROWSER}
                      Maximize Browser Window
                      Input Text                           name=search                                              MacBook
                      Click Element                        css=button.btn.btn-default.btn-lg
                      Click Link                           xpath=//a[contains(text(),'MacBook')]
                      Page Should Contain                  MacBook
                      Close Browser
