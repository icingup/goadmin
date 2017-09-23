@echo off

:: echo %~dp0

SET MAIN_PK=thomas.com/app

SET TARGET_NAME=thomas.exe

TITLE build %~dp0 %server%

set FP=%~dp0
cd %FP%


SET GOPATH=%GOPATH%;%FP%

echo "use GOPATH %GOPATH%"




call :build %1


PAUSE



:build
	go fmt %MAIN_PK%
	go build -o %FP%src\%TARGET_NAME% %MAIN_PK%
