@echo off
title Locker
color 02
cd /D %~DP0

echo.
echo Hi :)
echo.

set local=D:\myfolder
if exist %local% goto lock
if not exist %local% goto MDmyfolder

:MDmyfolder
md D:\myfolder
md %local%\lockfolder
timeout /t 15
cls
goto end

:unlock


:lock
ren \\.\%local%\lockfolder Nul
ren %local% lock
attrib +h +s lock
echo folder locked!
goto end

:end
echo.
echo See you soon!
echo.