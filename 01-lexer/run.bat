@echo off
cd /d "%~dp0"
set JJ=%1
if "%JJ%"=="" set JJ=Lexer.jj
set IN=%2
if "%IN%"=="" set IN=test.txt
if exist build rmdir /s /q build
mkdir build
@echo on

java -cp ..\javacc.jar javacc -OUTPUT_DIRECTORY=build %JJ%

javac -d build build\*.java

java -cp build Lexer %IN%

@echo off
echo.
pause
