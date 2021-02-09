*** Settings ***
Library    SeleniumLibrary    

Suite Setup     Log      Testi asetukset
Suite Teardown    Log    Testiasetukset2
Test Setup    Log        Testiasetukset3
Test Teardown    Log     Testiasetukset4 

*** Test Cases ***
EkaTesti
    Log    Heippa...  
    
ToinenTesti
    Open Browser        ${URL}        chrome
    Set Browser Implicit Wait    5
    LoginKW    
    Click Element   id=welcome
    Click Element   link=Logout
    Log             Valmis  
    Log              Valmista %{username}
    

KolmasTesti
    Open Browser    https://opensource-demo.orangehrmlive.com    chrome
    Set Browser Implicit Wait    5
    Input Text      id=txtUsername    Admin
    Input Password  id=txtPassword    admin123
    Click Button    id=btnLogin    
    Click Element   id=welcome
    Click Element   link=Logout
    Log             Valmis

***Variables***
${URL}     https://opensource-demo.orangehrmlive.com
@{CREDENTIALS}    Admin    admin123 
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text      id=txtUsername    @{CREDENTIALS}[0]
    Input Password  id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin
