:: #!/bin/sh
:: # SCRIPT: NOME DO SCRIPT
:: # AUTHOR: HIPOLITO LUIZ CARIGNANO
:: # DATE:Ter 28/Jul/2020 hs 08:45
:: # REV:    1.1.A (Valid are A, B, D, T and P)
:: #         (For Alpha, Beta, Dev, Test and Production
:: # PLATFORM: WINDOWS 10 
:: # (SPECIFY: AIX, HP-UX, Linux, Solaris
:: #                      or Not platform dependent
:: # PURPOSE:      Instalar e preconfigurar a plataforma gpredict e hamlib para controle de rotor e radio
:: # REV LIST:
:: # DATE:Ter 30/Jul/2020 hs 22:33
:: # BY:      Hipolito
:: # MODIFICATION: Ajuste no controle UAC para instalaçao do hamlib com permissao admin
::
:: # REV LIST:
:: # DATE:Ter 30/Jul/2020 hs 22:33
:: # BY:      Hipolito
:: # MODIFICATION: ????
::
:: # set -n   # Uncomment to check your syntax, without execution.
:: # # NOTE: Do not forget to put the comment back in or
:: # #       the shell script will not execute!
:: # set -x   # Uncomment to debug this shell script (Korn shell only)
:: #
@echo off
TITLE ^<^< OLD SCHOOL GUYS ^>^>
mode 135,20
cls
:menu
cls
color 70

mkdir tmp



echo Downloading HAMLIB
wget -O .\tmp\hamlib-w64-3.3.exe https://sourceforge.net/projects/hamlib/files/latest/download

echo iniciando instalacao HAMLIB
@powershell Start-Process .\tmp\hamlib-w64-3.3.exe -Wait -Verb runAs

echo Downloading GPREDICT
REM httpget sourceforge.net/projects/gpredict/files/Gpredict/2.3.37/gpredict-win32-2.3.37.zip tmp\gpredict-win32-2.3.37.zip

wget -O .\tmp\gpredict-win32-2.3.37.zip https://sourceforge.net/projects/gpredict/files/latest/download?use_mirror=ufpr

echo Descompactando GPREDICT
unzip -o tmp\gpredict-win32-2.3.37.zip -d tmp

echo movimentando pasta
move tmp\gpredict-win32-2.3.37 "C:\Program Files (x86)\"

echo apagando pasta temporaria
rmdir tmp /S /Q

echo Movendo diretorios para a pasta de programas
echo 
echo Movendo script de inicio para sua area de trabalho
echo 
echo Criando atalho para o script em sua are a de trabalho
copy GPREDICT_SCRIPT.lnk %userprofile%\desktop

echo 
