*** Settings ***
Documentation   Código base para abrir uma sessao com
...             Appium Server

Library         AppiumLibrary

Resource        kws.robot


*** Keywords ***
#HOOKS
Open Session
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UiAutomator2
    ...                     platformName=Android
    ...                     deviceName=emulator
    ...                     app=${EXECDIR}/app/ninjachef.apk
    ...                     udid=56e9d304
    ...                     adbExecTimeout=300000


Close Session
    Capture Page Screenshot
    Close Application
