@echo off

:: echo %~dp0
set FP=%~dp0
cd %FP%


SET GOPATH=%FP%

go get -u github.com/julienschmidt/httprouter

PAUSE
