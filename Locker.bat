@echo off
title Locker
color 02
cd /D %~DP0

echo.
echo Hi :)
echo.
goto menu

set local=D:\myfolder
if exist %local% goto lock
if not exist %local% goto MDmyfolder

:menu
echo "                  Menu                    "
echo.
echo 1. Create Folder
echo 2. Lock Folder
echo 3. Unlock Folder
echo 4. Remove Folder
echo 5. Exit
echo.
echo.
Set /p Select=Please select a number from the menu: 
echo %Select%
if %Select% == 1 (
    goto MDmyfolder
) else if %Select% == 2 (
    goto Lock
) else if %Select% == 3 (
    goto Unlock
) else if %Select% == 4 (
    goto Remove
) else if %Select% == 5 (
    goto End
) else (
    
    echo Invalid choice, try again!
    timeout /t 7
    cls
    goto menu
)

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

:End
echo.
echo See you soon!
timeout /t 5 
Exit Locker.bat
echo.