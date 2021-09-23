@echo off
REM set PATH=%PATH%;"C:\Program Files\hamlib-w64-3.3\bin\"
REM set PATH=%PATH%;"C:\Program Files\gpredict-win32-2.3.37"
REM echo %PATH%

set PATH=%PATH%;"C:\Program Files (x86)\hamlib-w32-4.1\bin"
set PATH=%PATH%;"C:\Program Files (x86)\gpredict-win32-2.3.37"

TITLE ^<^< OLD SCHOOL GUYS ^>^>
mode 100,30
cls
:menu
cls
color 70

echo Computador: %computername%        Usuario: %username%
echo  =====================================================
date /t  
time /t
echo  ======================================                  
echo       MENU TAREFAS DISPONIVEIS
echo  ======================================
echo  * 1. Iniciar TS 2000 porta serial  * 
echo  * 2. Iniciar Icom IC 746 Pro   porta serial  *
echo  * 3. Iniciar Gpredict                 *
echo  * 4. Exibir as opcoes radios hamlib   *
echo  * 5. Listar portas serias disponiveis *
echo  * 6. Sair                             * 
echo  ======================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% GEQ 6 goto opcao6

:opcao1
cls
rigctld -m 2014 -s 9600 -r COM4 -T 127.0.0.1 -t 4532 --vfo
echo ==================================
echo *      Kenwood TS 2000 iniciado        *
echo ==================================
pause
goto menu

:opcao2
cls
rigctld -m 360 -r COM15 -T 127.0.0.1 -t 4535
echo ==================================
echo *      Icom IC 746Pro iniciado          *
echo ==================================
pause
goto menu

:opcao3
cls
START GPREDICT
echo ==================================
echo * GPREDICT Iniciado, rastreando   *
echo ==================================
goto menu

:opcao4
cls
echo ==================================
echo * HAMLIB Radios suportados        * 
echo ==================================
rigctl -l
pause
goto menu

:opcao5
cls
echo ====================================
echo * LISTA de portas serias disponives *
echo ====================================
mode
pause
goto menu

:opcao6
cls
exit