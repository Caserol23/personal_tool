@echo off
setlocal EnableDelayedExpansion
title GHRBCHYARG Tools

:: ======================================================== Misc ============================

set sevenz=C:\Program Files\7-Zip\7z.exe
:: set mainzip=D:\ghrbchtools\main.zip

:inscomp
:: ======================================== Initial Installation ============================
cls
echo.
echo   Installation of the Tools and Chart Projects, please use a proper naming scheme or else
echo              you'll be screwed for installation and throws you a error message
echo.
echo   Follow These Steps
echo.
echo  =======================================================================================
echo   Step 1 - Create a folder anywhere else that can easily to locate...
echo   Step 2 - Drag and Drop here on the blinking cursor the created folder of your choice
echo   Step 3 - Then hit "Enter" to proceed steps.
echo  =======================================================================================
echo.
pause
cls
echo.
echo   Installation folder?
echo.
echo   Note: This is where the location of the source programs and all tool located all at once.
echo.
set /p installfol=" > "
cls
echo.
echo   Chart Project folder?
echo.
echo   Note: This is where the location of all of your chart projects, with all project files,
echo   audios, images and other miscellaneous items.
echo.
set /p chartproj=" > "

:srcdl
cls
echo.
echo   You need to download the resources, in order to install progress, it automatically opens
echo   into the browser in Google Drive, please confirm that you wish to download...
echo.
echo   Press 1 - Download   Press 2 - Specify the file   Press 3 - Skip Downloading (Reinstall^)
echo.
set /p mainspecify=" > "
if %mainspecify%=="1" goto maindl
if %mainspecify%=="2" goto srcspecify
if %mainspecify%=="3" goto srcskipped

:maindl
start "" "https://drive.google.com/file/d/16YY0e73KLfx81es_6WteTwb7cN8ldz_a/view?usp=drive_link"
goto srcspecify

:srcspecify
cls
echo.
echo   Please specify the downloaded file "main.zip", please drag and drop here...
echo.
set /p spefmain=" > "
goto insconf

:srcskipped
set spefmain=None
goto insconf

:insconf
cls
echo.
echo   Please confirm your installation...
echo.
echo   Installation folder: %installfol%
echo   Chart Project Folder: %chartproj%
echo.
echo   The sources files: %spefmain%
echo.
echo   Press 1 - yes        Press 2 - no
echo.

set /p confirm=" > "
if "%confirm%"=="1" goto inscont
if "%confirm%"=="2" goto inscomp
cls
goto :eof

:inscont
cls
"%sevenz%" x "%spefmain%" -o"%installfol%" -y
cls

echo.
echo   Installing...

mkdir "%installfol%\_misc\scripts\game\menu"
mkdir "%installfol%\_misc\scripts\gh\menu"
mkdir "%installfol%\_misc\scripts\rb\menu"
mkdir "%installfol%\_misc\scripts\tools\menu"

:: ============================================================================================================== Game Menu ======================

(
echo @echo off
echo title Game Menu
echo :menu
echo cls
echo echo  ===============================
echo echo         Choose Your Game
echo echo  ===============================
echo echo.
echo echo         - Latest Games -
echo echo.
echo echo  1. Clone Hero
echo echo  2. YARG
echo echo.
echo echo  ===============================
echo echo.
echo echo         - Legacy Games -
echo echo.
echo echo  3. Phase Shift
echo echo  4. Frets on Fire IX
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\game\x64\ch\Clone_Hero.exe
echo if "%%choice%%"=="2" start %installfol%\game\x64\yarg\YARG.exe
echo if "%%choice%%"=="3" start %installfol%\game\x86\ps\phase_shift.exe
echo if "%%choice%%"=="4" start %installfol%\game\x86\fofix\FoFiX.exe
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\game\menu\main_menu.bat"

(
echo @echo off
echo setlocal EnableDelayedExpansion
echo set output=test.bat
echo set fbout=fbtest.bat
echo set folder=folder.bat
echo set choiceplaceholder=choice
echo. 
echo cls
:: echo set /p testfol=" Where your song could generate: > "
echo :: Ask for folder name
echo set /p "artist=Artist Name: > "
echo set /p "song=Song Name: > "
echo set foldername=%%artist%% - %%song%%
echo.
echo :: Create the folder (handles spaces and special characters^)
echo mkdir "%chartproj%\%%foldername%%"
echo.
echo :: Confirm folder creation
echo echo Folder %%foldername%% has been created successfully.
echo mkdir "%chartproj%\%%foldername%%\_____magma_files"
echo echo MAGMA Project Folder has been created successfully.
echo mkdir "%chartproj%\%%foldername%%\test"
echo echo Test Chart Folder for Clone Hero has been created successfully.
echo pause
echo.

:: ====================================== Generate 1 ========================================
echo (
echo echo @echo off
echo echo title "%%foldername%%" Chart Preview
echo echo :menu
echo echo echo.
echo echo echo Only 4 Present Instrument was used to initiate Clone Hero, please specify carefully or else the game will throw a error message and force you to kick you out! you've been warned
echo echo echo.
echo echo echo.
echo echo set testchart="%chartproj%\%%foldername%%\test"
echo echo set chexec="%installfol%\game\x64\ch\Clone_Hero.exe"
echo echo.
echo echo set /p stdvsghl="1. Standard Full Band / 2. 6 Fret Band > "
echo echo.
echo echo if "%%%%stdvsghl%%%%"=="1" (
echo echo ^^ cls
echo echo ^^ goto guitar
echo echo ^^^) else if "%%%%stdvsghl%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto guitar6fret
echo echo ^^^) else (
echo echo ^^ cls
echo echo ^^^ pause
echo echo ^^^ cls
echo echo ^^^ goto menu
echo echo ^^^ echo.
echo echo ^^^)
echo echo.
echo echo :guitar
echo echo set /p guitar="Guitar? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%guitar%%%%"=="1" (
echo echo ^^ set guitarinfo=Guitar 
echo echo ^^ cls
echo echo ^^ goto guitardiff
echo echo ^^^) else if "%%%%guitar%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto prodrums
echo echo ^^^) else if "%%%%guitar%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto guitar
echo echo ^^^)
echo echo.
echo echo :guitardiff
echo echo set /p guitardiff="Guitar Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%guitardiff%%%%"=="1" (
echo echo ^^ set guidiff=--player Guitar,Easy 
echo echo ^^ cls
echo echo ^^^) else if "%%%%guitardiff%%%%"=="2" (
echo echo ^^ set guidiff=--player Guitar,Medium 
echo echo ^^ cls
echo echo ^^^) else if "%%%%guitardiff%%%%"=="3" (
echo echo ^^ set guidiff=--player Guitar,Hard 
echo echo ^^ cls
echo echo ^^^) else if "%%%%guitardiff%%%%"=="4" (
echo echo ^^ set guidiff=--player Guitar,Expert 
echo echo ^^ cls
echo echo ^^^) else if "%%%%guitardiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto guitardiff
echo echo ^^^)
echo echo.
echo echo :prodrums
echo echo set /p prodrums="Pro Drums? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%prodrums%%%%"=="1" (
echo echo ^^ set prodrumsinfo=Pro Drums 
echo echo ^^ cls
echo echo ^^ goto prodrumsdiff
echo echo ^^^) else if "%%%%prodrums%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto keys
echo echo ^^^) else if "%%%%prodrums%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto prodrums
echo echo ^^^)
echo echo.
echo echo :prodrumsdiff
echo echo set /p prodrumsdiff="Pro Drums Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%prodrumsdiff%%%%"=="1" (
echo echo ^^ set prodrumsdiff=--player ProDrums,Easy 
echo echo ^^ cls
echo echo ^^^) else if "%%%%prodrumsdiff%%%%"=="2" (
echo echo ^^ set prodrumsdiff=--player ProDrums,Medium 
echo echo ^^ cls
echo echo ^^^) else if "%%%%prodrumsdiff%%%%"=="3" (
echo echo ^^ set prodrumsdiff=--player ProDrums,Hard 
echo echo ^^ cls
echo echo ^^^) else if "%%%%prodrumsdiff%%%%"=="4" (
echo echo ^^ set prodrumsdiff=--player ProDrums,Expert 
echo echo ^^ cls
echo echo ^^^) else if "%%%%prodrumsdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto prodrumsdiff
echo echo ^^^)
echo echo.
echo echo :keys
echo echo set /p keys="Keys? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%keys%%%%"=="1" (
echo echo ^^ set keysinfo=Keys 
echo echo ^^ cls
echo echo ^^ goto keysdiff
echo echo ^^^) else if "%%%%keys%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto bass
echo echo ^^^) else if "%%%%keys%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto keys
echo echo ^^^)
echo echo.
echo echo :keysdiff
echo echo set /p keysdiff="Keys Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%keysdiff%%%%"=="1" (
echo echo ^^ set keysdiff=--player Keys,Easy 
echo echo ^^ cls
echo echo ^^^) else if "%%%%keysdiff%%%%"=="2" (
echo echo ^^ set keysdiff=--player Keys,Medium 
echo echo ^^ cls
echo echo ^^^) else if "%%%%keysdiff%%%%"=="3" (
echo echo ^^ set keysdiff=--player Keys,Hard 
echo echo ^^ cls
echo echo ^^^) else if "%%%%keysdiff%%%%"=="4" (
echo echo ^^ set keysdiff=--player Keys,Expert 
echo echo ^^ cls
echo echo ^^^) else if "%%%%keysdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto keysdiff
echo echo ^^^)
echo echo.
echo echo :bass
echo echo set /p bass="Bass? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%bass%%%%"=="1" (
echo echo ^^ set bassinfo=Bass 
echo echo ^^ cls
echo echo ^^ goto bassdiff
echo echo ^^^) else if "%%%%bass%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto rhythm
echo echo ^^^) else if "%%%%bass%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto bass
echo echo ^^^)
echo echo.
echo echo :bassdiff
echo echo set /p bassdiff="Bass Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%bassdiff%%%%"=="1" (
echo echo ^^ set bassdiff=--player Bass,Easy 
echo echo ^^ cls
echo echo ^^^) else if "%%%%bassdiff%%%%"=="2" (
echo echo ^^ set bassdiff=--player Bass,Medium 
echo echo ^^ cls
echo echo ^^^) else if "%%%%bassdiff%%%%"=="3" (
echo echo ^^ set bassdiff=--player Bass,Hard 
echo echo ^^ cls
echo echo ^^^) else if "%%%%bassdiff%%%%"=="4" (
echo echo ^^ set bassdiff=--player Bass,Expert 
echo echo ^^ cls
echo echo ^^^) else if "%%%%bassdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto bassdiff
echo echo ^^^)
echo echo.
echo echo :rhythm
echo echo set /p rhythm="Rhythm? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%rhythm%%%%"=="1" (
echo echo ^^ set rhythminfo=Rhythm 
echo echo ^^ cls
echo echo ^^ goto rhythmdiff
echo echo ^^^) else if "%%%%rhythm%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto guitarcoop
echo echo ^^^) else if "%%%%rhythm%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto rhythm
echo echo ^^^)
echo echo.
echo echo :rhythmdiff
echo echo set /p rhythmdiff="Rhythm Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%rhythmdiff%%%%"=="1" (
echo echo ^^ set rhythmdiff=--player Rhythm,Easy 
echo echo ^^ cls
echo echo ^^^) else if "%%%%rhythmdiff%%%%"=="2" (
echo echo ^^ set rhythmdiff=--player Rhythm,Medium 
echo echo ^^ cls
echo echo ^^^) else if "%%%%rhythmdiff%%%%"=="3" (
echo echo ^^ set rhythmdiff=--player Rhythm,Hard 
echo echo ^^ cls
echo echo ^^^) else if "%%%%rhythmdiff%%%%"=="4" (
echo echo ^^ set rhythmdiff=--player Rhythm,Expert 
echo echo ^^ cls
echo echo ^^^) else if "%%%%rhythmdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto rhythmdiff
echo echo ^^^)
echo echo.
echo echo :guitarcoop
echo echo set /p guitarcoop="Guitar Coop? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%guitarcoop%%%%"=="1" (
echo echo ^^ set guitarcoopinfo=Guitar Coop 
echo echo ^^ cls
echo echo ^^ goto guitarcoopdiff
echo echo ^^^) else if "%%%%guitarcoop%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoop%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto guitarcoop
echo echo ^^^)
echo echo.
echo echo :guitarcoopdiff
echo echo set /p guitarcoopdiff="GuitarCoop Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%guitarcoopdiff%%%%"=="1" (
echo echo ^^ set guitarcoopdiff=--player GuitarCoop,Easy 
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoopdiff%%%%"=="2" (
echo echo ^^ set guitarcoopdiff=--player GuitarCoop,Medium 
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoopdiff%%%%"=="3" (
echo echo ^^ set guitarcoopdiff=--player GuitarCoop,Hard 
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoopdiff%%%%"=="4" (
echo echo ^^ set guitarcoopdiff=--player GuitarCoop,Expert 
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoopdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto guitarcoopdiff
echo echo ^^^)
echo echo.
echo echo.
echo echo :guitar6fret
echo echo set /p guitar6fret="Guitar 6Fret? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%guitar6fret%%%%"=="1" (
echo echo ^^ set guitar6fretinfo=Guitar6Fret 
echo echo ^^ cls
echo echo ^^ goto guitar6fretdiff
echo echo ^^^) else if "%%%%guitar6fret%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto bass6fret
echo echo ^^^) else if "%%%%guitar6fret%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto guitar6fret
echo echo ^^^)
echo echo.
echo echo :guitar6fretdiff
echo echo set /p guitar6fretdiff="Guitar6Fret Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%guitar6fretdiff%%%%"=="1" (
echo echo ^^ set gui6fretdiff=--player Guitar6Fret,Easy 
echo echo ^^ cls
echo echo ^^^) else if "%%%%guitar6fretdiff%%%%"=="2" (
echo echo ^^ set gui6fretdiff=--player Guitar6Fret,Medium 
echo echo ^^ cls
echo echo ^^^) else if "%%%%guitar6fretdiff%%%%"=="3" (
echo echo ^^ set gui6fretdiff=--player Guitar6Fret,Hard 
echo echo ^^ cls
echo echo ^^^) else if "%%%%guitar6fretdiff%%%%"=="4" (
echo echo ^^ set gui6fretdiff=--player Guitar6Fret,Expert 
echo echo ^^ cls
echo echo ^^^) else if "%%%%guitar6fretdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto guitar6fretdiff
echo echo ^^^)
echo echo.
echo echo :bass6fret
echo echo set /p bass6fret="Bass 6Fret? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%bass6fret%%%%"=="1" (
echo echo ^^ set bass6fretinfo=Bass6Fret 
echo echo ^^ cls
echo echo ^^ goto bass6fretdiff
echo echo ^^^) else if "%%%%bass6fret%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto rhythm6fret
echo echo ^^^) else if "%%%%bass6fret%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto bass6fret
echo echo ^^^)
echo echo.
echo echo :bass6fretdiff
echo echo set /p bass6fretdiff="Bass 6Fret Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%bass6fretdiff%%%%"=="1" (
echo echo ^^ set bass6fret6fretdiff=--player Bass6Fret,Easy 
echo echo ^^ cls
echo echo ^^^) else if "%%%%bass6fretdiff%%%%"=="2" (
echo echo ^^ set bass6fret6fretdiff=--player Bass6Fret,Medium 
echo echo ^^ cls
echo echo ^^^) else if "%%%%bass6fretdiff%%%%"=="3" (
echo echo ^^ set bass6fret6fretdiff=--player Bass6Fret,Hard 
echo echo ^^ cls
echo echo ^^^) else if "%%%%bass6fretdiff%%%%"=="4" (
echo echo ^^ set bass6fret6fretdiff=--player Bass6Fret,Expert 
echo echo ^^ cls
echo echo ^^^) else if "%%%%bass6fretdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto bass6fretdiff
echo echo ^^^)
echo echo.
echo echo :rhythm6fret
echo echo set /p rhythm6fret="Rhythm 6Fret? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%rhythm6fret%%%%"=="1" (
echo echo ^^ set rhythm6fretinfo=Rhythm6Fret 
echo echo ^^ cls
echo echo ^^ goto rhythm6fretdiff
echo echo ^^^) else if "%%%%rhythm6fret%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto guitarcoop6fret
echo echo ^^^) else if "%%%%rhythm6fret%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto rhythm6fret
echo echo ^^^)
echo echo.
echo echo :rhythm6fretdiff
echo echo set /p rhythm6fretdiff="Rhythm 6Fret Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%rhythm6fretdiff%%%%"=="1" (
echo echo ^^ set rhythm6fret6fretdiff=--player Rhythm6Fret,Easy 
echo echo ^^ cls
echo echo ^^^) else if "%%%%rhythm6fretdiff%%%%"=="2" (
echo echo ^^ set rhythm6fret6fretdiff=--player Rhythm6Fret,Medium 
echo echo ^^ cls
echo echo ^^^) else if "%%%%rhythm6fretdiff%%%%"=="3" (
echo echo ^^ set rhythm6fret6fretdiff=--player Rhythm6Fret,Hard 
echo echo ^^ cls
echo echo ^^^) else if "%%%%rhythm6fretdiff%%%%"=="4" (
echo echo ^^ set rhythm6fret6fretdiff=--player Rhythm6Fret,Expert 
echo echo ^^ cls
echo echo ^^^) else if "%%%%rhythm6fretdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto rhythm6fretdiff
echo echo ^^^)
echo echo.
echo echo :guitarcoop6fret
echo echo set /p guitarcoop6fret="Guitar Coop 6Fret? - 1. yes / 2. no / 0. go back to menu: > "
echo echo if "%%%%guitarcoop6fret%%%%"=="1" (
echo echo ^^ set guitarcoop6fretinfo=GuitarCoop6Fret 
echo echo ^^ cls
echo echo ^^ goto guitarcoop6fretdiff
echo echo ^^^) else if "%%%%guitarcoop6fret%%%%"=="2" (
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoop6fretdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto guitarcoop6fret
echo echo ^^^)
echo echo.
echo echo :guitarcoop6fretdiff
echo echo set /p guitarcoop6fretdiff="Guitar Coop 6Fret Difficulty? - 1. easy / 2. medium / 3. hard / 4. expert ~ 0. go back to menu: > "
echo echo if "%%%%guitarcoop6fretdiff%%%%"=="1" (
echo echo ^^ set guitarcoop6fretdiff=--player GuitarCoop6Fret,Easy 
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoop6fretdiff%%%%"=="2" (
echo echo ^^ set guitarcoop6fretdiff=--player GuitarCoop6Fret,Medium 
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoop6fretdiff%%%%"=="3" (
echo echo ^^ set guitarcoop6fretdiff=--player GuitarCoop6Fret,Hard 
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoop6fretdiff%%%%"=="4" (
echo echo ^^ set guitarcoop6fretdiff=--player GuitarCoop6Fret,Expert 
echo echo ^^ cls
echo echo ^^ goto execute
echo echo ^^^) else if "%%%%guitarcoop6fretdiff%%%%"=="0" (
echo echo ^^ cls
echo echo ^^ goto menu
echo echo ^^^) else (
echo echo ^^ echo error not specified
echo echo ^^ echo.
echo echo ^^ pause
echo echo ^^ cls
echo echo ^^ goto guitarcoop6fretdiff
echo echo ^^^)
echo echo.
echo echo :execute
echo echo set /p profile="Profile Name: "
echo echo echo Instruments: %%%%guitarinfo%%%%%%%%guitarcoopinfo%%%%%%%%guitar6fretinfo%%%%%%%%guitarcoop6fretinfo%%%%%%%%prodrumsinfo%%%%%%%%keysinfo%%%%%%%%bassinfo%%%%%%%%bass6fretinfo%%%%%%%%rhythminfo%%%%%%%%rhythm6fretinfo%%%%
echo echo echo.
echo echo echo Executing...
echo echo %%%%chexec%%%% --song %%%%testchart%%%% %%%%guidiff%%%%%%%%gui6frediff%%%%%%%%guitarcoopdiff%%%%%%%%guitarcoop6fretdiff%%%%%%%%prodrumsdiff%%%%%%%%keysdiff%%%%%%%%bassdiff%%%%%%%%bass6fretdiff%%%%%%%%rhythmdiff%%%%%%%%rhythm6fretdiff%%%% --profile %%%%profile%%%% -i
echo echo exit
echo echo.
echo ^) ^> "%chartproj%\%%foldername%%\%%fbout%%"
echo echo.
echo start "" "%chartproj%\%%foldername%%"
echo exit
echo.
) > "%installfol%\_misc\scripts\game\menu\newchart_project.bat"


:: =================================================== Test Chart ===================================================


(
echo @echo off
echo setlocal enabledelayedexpansion
echo.
echo title Test Clone Hero Chart
echo.
echo :folder
echo cd %chartproj%
echo echo.
echo echo Select Song to preview
echo echo.
echo echo.
echo.
echo :: Collect all subfolders
echo set i=0
echo for /d %%%%A in (*^) do (
echo ^    set /a i+=1
echo ^    set "folder[^!i^!]=%%%%A"
echo ^    echo ^^!i^^!. %%%%A
echo ^)
echo.
echo if %%i%%==0 (
echo ^    echo No folders found.
echo ^    pause
echo ^    exit
echo ^)
echo.
echo echo. 
echo set /p choice=Select Song: 
echo echo.
echo if not defined folder[%%choice%%] (
echo ^	cls
echo ^    echo Invalid choice. Try again.
echo ^	echo.
echo ^	pause
echo ^	cls
echo ^    goto folder
echo ^)
echo.
echo set "selected=^!folder[%%choice%%]^!"
echo echo You selected: ^^!selected^^!
echo echo.
echo if exist "^!selected^!\fbtest.bat" (
echo ^    echo Running folder.bat inside "^!selected^!"...
echo ^    pushd "^!selected^!"
echo ^	cls
echo ^    call fbtest.bat
echo ^    popd
echo ^) else (
echo ^	cls
echo ^    echo No test.bat found inside "^!selected^!" please create first.
echo ^	echo.
echo ^)
echo pause
echo cls
echo goto folder
echo endlocal
echo.
) > "%installfol%\_misc\scripts\game\menu\test_chart.bat"


:: ========================================================================================================== Guitar Hero 2 Menu ==================

(
echo @echo off
echo title Build Ark Menu
echo :menu
echo cls
echo echo  ===============================
echo echo          Build Ark Menu
echo echo  ===============================
echo echo.
echo echo         - Latest Games -
echo echo.
echo echo  1. Build GH2 ARK
echo echo  2. Backup Build ARK
echo echo  3. Update Backup Build ARK
echo echo  4. Restore Build ARK
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\_misc\scripts\gh\build_ark.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\backup_build_ark.bat
echo if "%%choice%%"=="3" start %installfol%\_misc\scripts\gh\update_build_ark.bat
echo if "%%choice%%"=="4" start %installfol%\_misc\scripts\gh\restore_build_ark.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\build_ark_menu.bat"

(
echo @echo off
echo title Build ISO Menu
echo :menu
echo cls
echo echo  ===============================
echo echo          Build ISO Menu
echo echo  ===============================
echo echo.
echo echo          - Main Menu  -
echo echo.
echo echo  1. Backup ISO GH2
echo echo  2. Update ISO GH2
echo echo  3. Restore ISO GH2
echo echo.
echo echo  ===============================
echo echo.
echo echo  4. Traditional
echo echo  5. New Method
echo echo  6. CD/DVDGen Profile Menu
echo echo  7. Vanilla/Debug Exec Menu
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\_misc\scripts\gh\backup_iso.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\update_iso.bat
echo if "%%choice%%"=="3" start %installfol%\_misc\scripts\gh\restore_iso.bat
echo if "%%choice%%"=="4" call %installfol%\_misc\scripts\gh\build_tra.bat
echo if "%%choice%%"=="5" start %installfol%\_misc\scripts\gh\build_exp.bat
echo if "%%choice%%"=="6" call %installfol%\_misc\scripts\gh\menu\cddvdgen_profile_menu.bat
echo if "%%choice%%"=="7" call %installfol%\_misc\scripts\gh\menu\vanilla_debug_exec_menu.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\build_iso_menu.bat"

(
echo @echo off
echo title CD/DVD Generator Profile Menu
echo :menu
echo cls
echo echo  ===============================
echo echo   CD/DVD Generator Profile Menu
echo echo  ===============================
echo echo.
echo echo          - Main Menu  -
echo echo.
echo echo  1. Guitar Hero 2: Original
echo echo  2. Guitar Hero 2: Deluxe
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\_misc\scripts\gh\gh2og_profile.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\gh2dx_profile.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\cddvdgen_profile_menu.bat"

(
echo @echo off
echo title Extract ARK Menu
echo :menu
echo cls
echo echo  ===============================
echo echo         Extract ARK Menu
echo echo  ===============================
echo echo.
echo echo          - Main Menu  -
echo echo.
echo echo  1. Extract ARK
echo echo  2. Backup ARK
echo echo  3. Update Backup ARK
echo echo  4. Restore Backup ARK
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\_misc\scripts\gh\extract_ark.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\backup_extract_ark.bat
echo if "%%choice%%"=="3" start %installfol%\_misc\scripts\gh\update_extract_ark.bat
echo if "%%choice%%"=="4" start %installfol%\_misc\scripts\gh\restore_extract_ark.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\extract_ark_menu.bat"

(
echo @echo off
echo title Guitar Hero Requirements Menu
echo :menu
echo cls
echo echo  ===============================
echo echo   Guitar Hero Requirements Menu
echo echo  ===============================
echo echo.
echo echo          - Main Menu  -
echo echo.
echo echo  1. 32-Bit
echo echo  2. 64-Bit
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\_misc\scripts\gh\gh_32.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\gh_64.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\gh_req.bat"

(
echo @echo off
echo title Guitar Hero Project Menu
echo :menu
echo cls
echo echo  ===============================
echo echo     Guitar Hero Project Menu
echo echo  ===============================
echo echo.
echo echo          - Main Menu  -
echo echo.
echo echo  1. Guitar Hero 2: Original
echo echo  2. Guitar Hero 2: Deluxe
echo echo  3. OPM Guitar Hero
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\_misc\scripts\gh\clean_up_project_gh2og.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\clean_up_project.bat
echo if "%%choice%%"=="3" start %installfol%\_misc\scripts\gh\clean_up_project_gh2opm.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\gh2_project_menu.bat"

(
echo @echo off
echo title Guitar Hero Menu
echo :menu
echo cls
echo echo  ===============================
echo echo         Guitar Hero Menu
echo echo  ===============================
echo echo.
echo echo           - Main Menu -
echo echo.
echo echo  1. Extract ARK
echo echo  2. Build ARK
echo echo  3. Build ISO
echo echo.
echo echo             - Tools -
echo echo.
echo echo  4. Open Guitar Hero Explorer
echo echo  5. Open VGS Splitter
echo echo  6. Open Chart2MID
echo echo.
echo echo            - Options -
echo echo.
echo echo  7. New Project
echo echo  8. Full CleanUp Project
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" call %installfol%\_misc\scripts\gh\menu\extract_ark_menu.bat
echo if "%%choice%%"=="2" call %installfol%\_misc\scripts\gh\menu\build_ark_menu.bat
echo if "%%choice%%"=="3" call %installfol%\_misc\scripts\gh\menu\build_iso_menu.bat
echo if "%%choice%%"=="4" start %installfol%\gh\_tools\ghex.exe
echo if "%%choice%%"=="5" start %installfol%\gh\_tools\vgs.exe
echo if "%%choice%%"=="6" start %installfol%\_tools\chart2mid\Chart2Mid.jar
echo if "%%choice%%"=="7" call %installfol%\_misc\scripts\gh\menu\gh2_project_menu.bat
echo if "%%choice%%"=="8" start %installfol%\_misc\scripts\gh\clean_up_project_full.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\main_menu.bat"

(
echo @echo off
echo title Requirements Menu
echo :menu
echo cls
echo echo  ===============================
echo echo         Requirements Menu
echo echo  ===============================
echo echo.
echo echo           - Main Menu -
echo echo.
echo echo  1. Guitar Hero Requirements
echo echo  2. Other Requirements: 32-Bit
echo echo  3. Other Requirements: 64-Bit
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" call %installfol%\_misc\scripts\gh\menu\gh_req.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\recom_32.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\recom_64.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\requirements_menu.bat"

(
echo @echo off
echo title Executables Menu
echo :menu
echo cls
echo echo  ===============================
echo echo         Executables Menu
echo echo  ===============================
echo echo.
echo echo          - Main Menu -
echo echo.
echo echo  1. GH2:OG - Vanilla
echo echo  2. GH2:OG - Debug
echo echo  3. GH2:DX - Vanilla
echo echo  4. GH2:DX - Debug
echo echo.
echo echo  ===============================
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\_misc\scripts\gh\gh2og_vanilla.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\scripts\gh\gh2og_debug.bat
echo if "%%choice%%"=="3" start %installfol%\_misc\scripts\gh\gh2dx_vanilla.bat
echo if "%%choice%%"=="4" start %installfol%\_misc\scripts\gh\gh2og_debug.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
) > "%installfol%\_misc\scripts\gh\menu\vanilla_debug_exec_menu.bat"

:: ============================================================================================ Guitar Hero Scripts Library =========================================

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_ext\GEN
echo set destination=%installfol%\gh\_extbk\GEN

echo echo Backing Up ARK File from "%%source%" to "%%destination%%"...
echo rmdir /S /Q "%%destination%%"
echo xcopy "%%source%%" "%%destination%%" /s /e /y /d /i
echo echo.
echo echo Backuped!
echo echo Check on 
echo pause
echo exit
) > "%installfol%\_misc\scripts\gh\backup_build_ark.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_ark
echo set destination=%installfol%\gh\_arkbk

echo echo Backing Up from "%%source%%" to "%%destination%%"...
echo rmdir /S /Q "%%destination%%"
echo xcopy "%%source%%" "%%destination%%" /s /e /y /d /i
echo echo.
echo echo Backuped!
echo echo Check on "%%destination%%"
echo pause
echo exit
) > "%installfol%\_misc\scripts\gh\backup_extract_ark.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_iso
echo set destination=%installfol%\gh\_isobk

echo echo Backing Up from "%%source%%" to "%%destination%%"...
echo xcopy "%%source%%" "%%destination%%" /s /e /y /d /i
echo echo.
echo echo Backuped!
echo echo Check on "%%destination%%"
echo pause
echo exit
) > "%installfol%\_misc\scripts\gh\backup_iso.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_ext\GEN
echo set destination=%installfol%\gh\_ark
echo set arkhelper=%installfol%\gh\_tools\arkhelper.exe
echo.
echo echo Copying files from "%%source%%" to "%%destination%%"...
echo "%%arkhelper%%" dir2ark "%%destination%%" "%%source%%" -n MAIN -s 4073741823
echo echo.
echo echo Builded ARK!
echo pause
echo exit
) > "%installfol%\_misc\scripts\gh\build_ark.bat"

(
echo @echo off
echo cls
echo set mainpy=D:\GHRB-Tools\gh\_tools\main.py
echo set fiml=%installfol%\gh\_iso\gh2dx.iml
echo set fims=%installfol%\gh\_iso\gh2dx.ims
echo set fiso=%installfol%\gh\_iso\gh2dx
echo set dest=%installfol%\gh\_tools
echo echo ===========================================
echo echo        Generating The IML 2 ISO
echo echo ===========================================
echo echo.
echo echo 1. Create New project
echo echo 2. Select CD-ROM Master Disc
echo echo 3. Drag and Drop your ARK files to the CD/DVD/Generator "directory" tab
echo echo.
echo echo 4. Go to the Volume enter the following:
echo echo       - Disc Name: GHCE-00003
echo echo       - Producer Name: PLAYSTATION
echo echo.
echo echo 5. Save your Project, rename it as "gh2dx", do the same with .iml and .ims files
echo echo       * The files looks like this
echo echo         - gh2dx.ccz
echo echo         - gh2dx.iml
echo echo         - gh2dx.ims
echo echo.
echo echo.
echo echo Make sure all the 3 files on the "D:\gh2_mods\_iso", once you close the program, converting .iml to .bin will executed.
echo call D:\gh2_mods\_tools\CDVD2\cdvdgen.exe
echo xcopy "%%fims%%" "%%dest%%" /Y
echo cls
echo py -3 %%mainpy%% --iml %%fiml%% --out_disc_image %%fiso%%
echo echo.
echo echo The Disc builded on %%fiso%%.bin you can now boot on the emulator or on real hardware.
echo exit
) > "%installfol%\_misc\scripts\gh\build_exp.bat"

(
echo @echo off
echo cls
echo call %installfol%\gh\_tools\CDVD2\cdvdgen.exe
echo call %installfol%\gh\_tools\cdvd.exe
) > "%installfol%\_misc\scripts\gh\build_tra.bat"

(
echo @echo off
echo set ark_extract=%installfol%\gh\_ark
echo set ark_build=%installfol%\gh\_ext
echo set iso=%installfol%\gh\_iso
echo set iso_backup=%installfol%\gh\_isobk
echo set 7z=C:\Program Files\7-Zip\7z.exe
echo set extractzip=%installfol%\gh\disc\gh2deluxe_blank_default.zip
echo cls
echo rmdir /S /Q "%%ark_extract%%"
echo mkdir "%%ark_extract%%"
echo.
echo rmdir /S /Q "%%ark_build%%"
echo mkdir "%%ark_build%%"
echo.
echo call %installfol%\_misc\scripts\gh\extract_zip.bat
echo cls
echo echo.
echo echo Project Created!
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\clean.bat"

(
echo @echo off
echo set ark_extract=%installfol%\gh\_ark
echo set ark_extract_backup=%installfol%\gh\_arkbk
echo set ark_build=%installfol%\gh\_ext
echo set ark_build_backup=%installfol%\gh\_extbk
echo set iso=%installfol%\gh\_iso
echo set iso_backup=%installfol%\gh\_isobk
echo set 7z=C:\Program Files\7-Zip\7z.exe
echo cls
echo rmdir /S /Q "%%ark_extract%%"
echo mkdir "%%ark_extract%%"
echo.
echo rmdir /S /Q "%%ark_extract_backup%%"
echo mkdir "%%ark_extract_backup%%"
echo.
echo rmdir /S /Q "%%ark_build%%"
echo mkdir "%%ark_build%%"
echo.
echo rmdir /S /Q "%%ark_build_backup%%"
echo mkdir "%%ark_build_backup%%"
echo.
echo rmdir /S /Q "%%iso%%"
echo mkdir "%%iso%%"
echo.
echo rmdir /S /Q "%%iso_backup%%"
echo mkdir "%%iso_backup%%"
echo cls
echo echo.
echo echo Project Removed!
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\clean_full.bat"

(
echo @echo off
echo set ark_extract=%installfol%\gh\_ark
echo set ark_build=%installfol%\gh\_ext
echo set iso=%installfol%\gh\_iso
echo set iso_backup=%installfol%\gh\_isobk
echo set 7z=C:\Program Files\7-Zip\7z.exe
echo set extractzip=%installfol%\gh\disc\gh2og_blank_default.zip
echo cls
echo rmdir /S /Q "%%ark_extract%%"
echo mkdir "%%ark_extract%%"
echo.
echo rmdir /S /Q "%%ark_build%%"
echo mkdir "%%ark_build%%"
echo.
echo call %installfol%\_misc\scripts\gh\extract_gh2.bat
echo cls
echo echo.
echo echo Project Created!
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\clean_gh2.bat"

(
echo @echo off
echo set ark_extract=%installfol%\gh\_ark
echo set ark_build=%installfol%\gh\_ext
echo set iso=%installfol%\gh\_iso
echo set iso_backup=%installfol%\gh\_isobk
echo set 7z=C:\Program Files\7-Zip\7z.exe
echo set extractzip=%installfol%\gh\disc\gh2opm_blank_default.zip
echo cls
echo rmdir /S /Q "%%ark_extract%%"
echo mkdir "%%ark_extract%%"
echo.
echo rmdir /S /Q "%%ark_build%%"
echo mkdir "%%ark_build%%"
echo.
echo call %installfol%\_misc\scripts\gh\extract_gh2opm.bat
echo cls
echo echo.
echo echo Project Created!
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\clean_gh2opm.bat"

(
echo @echo off
echo cls
echo set ark_extract=%installfol%\gh\_ark
echo set ark_extract_backup=%installfol%\gh\_arkbk
echo set ark_build=%installfol%\gh\_ext
echo set ark_build_backup=%installfol%\gh\_extbk
echo set iso=%installfol%\gh\_iso
echo set iso_backup=%installfol%\gh\_isobk
echo set 7z=C:\Program Files\7-Zip\7z.exe
echo set extractzip=%installfol%\gh\disc\gh2deluxe_blank_default.zip
echo. 
echo echo =====================================
echo echo                WARNING
echo echo =====================================
echo echo.
echo echo Before you do clean up things, please backup the latest modification you've done,
echo echo grab and move them away from the whole entire folder.
echo echo.
echo echo To proceed type "yes" to continue to your cleanup and make new project
echo echo or type "cancel" to cancel and go back at the menu.
echo echo.
echo set /p choice=" > "
echo if "%%choice%%"=="yes" call %installfol%\_misc\scripts\gh\clean.bat
echo if "%%choice%%"=="cancel" call %installfol%\_misc\scripts\gh\menu\main_menu.bat
echo exit
) > "%installfol%\_misc\scripts\gh\clean_up_project.bat"

(
echo @echo off
echo cls
echo set ark_extract=D:\GHRB-Tools\gh\_ark
echo set ark_extract_backup=%installfol%\gh\_arkbk
echo set ark_build=%installfol%\gh\_ext
echo set ark_build_backup=%installfol%\gh\_extbk
echo set iso=%installfol%\gh\_iso
echo set iso_backup=%installfol%\gh\_isobk
echo set 7z=C:\Program Files\7-Zip\7z.exe
echo.
echo echo =====================================
echo echo                WARNING
echo echo =====================================
echo echo.
echo echo Before you do clean up things, please backup the latest modification you've done,
echo echo grab and move them away from the whole entire folder.
echo echo.
echo echo To proceed type "cleanup" to continue to your cleanup and make new project
echo echo or type "cancel" to cancel and go back at the menu.
echo echo.
echo set /p choice=" > "
echo if "%%choice%%"=="cleanup" call %installfol%\_misc\scripts\gh\clean_full.bat
echo if "%%choice%%"=="cancel" call %installfol%\_misc\scripts\gh\menu\main_menu.bat
echo exit
) > "%installfol%\_misc\scripts\gh\clean_up_project_full.bat"

(
echo @echo off
echo cls
echo set ark_extract=%installfol%\gh\_ark
echo set ark_extract_backup=%installfol%\gh\_arkbk
echo set ark_build=%installfol%\gh\_ext
echo set ark_build_backup=%installfol%\gh\_extbk
echo set iso=%installfol%\gh\_iso
echo set iso_backup=%installfol%\gh\_isobk
echo set 7z=C:\Program Files\7-Zip\7z.exe
echo set extractzip=%installfol%\gh\disc\gh2og_blank_default.zip
echo.
echo echo =====================================
echo echo                WARNING
echo echo =====================================
echo echo.
echo echo Before you do clean up things, please backup the latest modification you've done,
echo echo grab and move them away from the whole entire folder.
echo echo.
echo echo To proceed type "yes" to continue to your cleanup and make new project
echo echo or type "cancel" to cancel and go back at the menu.
echo echo.
echo set /p choice=" > "
echo if "%%choice%%"=="yes" call %installfol%\_misc\scripts\gh\clean_gh2.bat
echo if "%%choice%%"=="cancel" call %installfol%\_misc\scripts\gh\menu\main_menu.bat
echo exit
) > "%installfol%\_misc\scripts\gh\clean_up_project_gh2og.bat"

(
echo @echo off
echo cls
echo set ark_extract=%installfol%\gh\_ark
echo set ark_extract_backup=%installfol%\gh\_arkbk
echo set ark_build=%installfol%\gh\_ext
echo set ark_build_backup=%installfol%\gh\_extbk
echo set iso=%installfol%\gh\_iso
echo set iso_backup=%installfol%\gh\_isobk
echo set 7z=C:\Program Files\7-Zip\7z.exe
echo set extractzip=%installfol%\gh\disc\gh2opm_blank_default.zip
echo.
echo echo =====================================
echo echo                WARNING
echo echo =====================================
echo echo.
echo echo Before you do clean up things, please backup the latest modification you've done,
echo echo grab and move them away from the whole entire folder.
echo echo.
echo echo To proceed type "yes" to continue to your cleanup and make new project
echo echo or type "cancel" to cancel and go back at the menu.
echo echo.
echo set /p choice=" > "
echo if "%%choice%%"=="yes" call %installfol%\_misc\scripts\gh\clean_gh2opm.bat
echo if "%%choice%%"=="cancel" call %installfol%\_misc\scripts\gh\menu\main_menu.bat
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\clean_up_project_gh2opm.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_ext\GEN\main.hdr
echo set destination=%installfol%\gh\_ark
echo set arkhelper=%installfol%\gh\_tools\arkhelper.exe
echo. 
echo "%%arkhelper%%" ark2dir "%%source%%" "%%destination%%" -a -s
echo echo.
echo echo Extracted!
echo pause
echo exit
) > "%installfol%\_misc\scripts\gh\extract_ark.bat"

(
echo @echo off
echo cls
echo setlocal
echo set zipfile=%installfol%\gh\disc\gh2og_blank_default.zip
echo set outdir=%installfol%\gh\_ext
echo. 
echo :: Extract the ZIP file
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo 
echo echo Extraction Complete!
echo exit
) > "%installfol%\_misc\scripts\gh\extract_gh2.bat"

(
echo @echo off
echo cls
echo setlocal
echo set "zipfile=%installfol%\gh\disc\gh2opm_blank_default.zip"
echo set "outdir=%installfol%\gh\_ext"
echo.
echo :: Extract the ZIP file
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo. 
echo echo Extraction Complete!
echo exit
) > "%installfol%\_misc\scripts\gh\extract_gh2opm.bat"

(
echo @echo off
echo cls
echo setlocal
echo set "zipfile=%installfol%\gh\disc\gh2eluxe_blank_default.zip"
echo set "outdir=%installfol%\gh\_ext"
echo.
echo :: Extract the ZIP file
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo.
echo echo Extraction Complete!
echo exit
) > "%installfol%\_misc\scripts\gh\extract_zip.bat"

(
echo @echo off
echo cls
echo setlocal
echo set "zipfile=%installfol%\_misc\installer\requirements\x86\ghtools_x86.zip"
echo set "outdir=%installfol%\gh\_tools"
echo.
echo :: Extract the ZIP file
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo cls
echo echo Extraction Complete!
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\gh_32.bat"

(
echo @echo off
echo cls
echo setlocal
echo set "zipfile=%installfol%\_misc\installer\requirements\x86\ghtools_x64.zip"
echo set "outdir=%installfol%\gh\_tools"
echo.
echo :: Extract the ZIP file
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo cls
echo echo Extraction Complete!
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\gh_64.bat"

(
echo @echo off
echo title Adding Guitar Hero 2 Deluxe Debug Version
echo cls
echo setlocal
echo set "zipfile=%installfol%\_misc\template\gh\debug_vanilla\gh2dx_debug.zip"
echo set "outdir=%installfol%\gh\_ext"
echo set "iop=%installfol%\gh\_ext\IOP"
echo set "dx=%installfol%\gh\_ext\SLUS_214.47"
echo set "elf=%installfol%\gh\_ext\80SDEBUG.ELF"
echo set "cnf=%installfol%\gh\_ext\SYSTEM.CNF"
echo.
echo :: Extract the ZIP file
echo del %%dx%%
echo del %%elf%%
echo del %%cnf%%
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo cls
echo echo.
echo echo Deluxe Debugged Version file has been added on the project.
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\gh2dx_debug.bat"

(
echo @echo off
echo title Adding Project for Guitar Hero 2: Original
echo cls
echo setlocal
echo set "zipfile=%installfol%\_misc\template\gh\build_profiles\gh2dx.zip"
echo set "outdir=%installfol%\gh\_iso"
echo.
echo :: Extract the ZIP file
echo rmdir /S /Q %%outdir%%
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo cls
echo echo.
echo echo CD DVD Gen Profile has been added and ready for building.
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\gh2dx_profile.bat"

(
echo @echo off
echo title Adding Guitar Hero 2 Deluxe Vanilla
echo cls
echo setlocal
echo set "zipfile=%installfol%\_misc\template\gh\debug_vanilla\gh2dx_vanilla.zip"
echo set "outdir=%installfol%\gh\_ext"
echo set "iop=%installfol%\gh\_ext\IOP"
echo set "dx=%installfol%\gh\_ext\SLUS_214.47"
echo set "elf=%installfol%\gh\_ext\80SDEBUG.ELF"
echo set "cnf=%installfol%\gh\_ext\SYSTEM.CNF"
echo.
echo :: Extract the ZIP file
echo del %%dx%%
echo del %%elf%%
echo del %%cnf%%
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo cls
echo echo.
echo echo Vanilla Deluxe Version file has been added on the project.
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\gh2dx_vanilla.bat"

(
echo @echo off
echo title Adding Guitar Hero 2 Original Debug Version
echo cls
echo setlocal
echo set "zipfile=%installfol%\_misc\template\gh\debug_vanilla\gh2og_debug.zip"
echo set "outdir=%installfol%\gh\_ext"
echo set "iop=%installfol%\gh\_ext\IOP"
echo set "dx=%installfol%\gh\_ext\SLUS_214.47"
echo set "elf=%installfol%\gh\_ext\80SDEBUG.ELF"
echo set "cnf=%installfol%\gh\_ext\SYSTEM.CNF"
echo.
echo :: Extract the ZIP file
echo del %%dx%%
echo del %%elf%%
echo del %%cnf%%
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo cls
echo echo.
echo echo Original Debugged Version file has been added on the project.
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\gh2og_debug.bat"

(
echo @echo off
echo title Adding Project for Guitar Hero 2: Original
echo cls
echo setlocal
echo set "zipfile=%installfol%\_misc\template\gh\build_profiles\gh2og.zip"
echo set "outdir=%installfol%\gh\_iso"
echo.
echo :: Extract the ZIP file
echo rmdir /S /Q %%outdir%%
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo cls
echo echo.
echo echo CD DVD Gen Profile has been added and ready for building.
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\gh2og_profile.bat"

(
echo @echo off
echo title Adding Guitar Hero 2 Deluxe Vanilla
echo cls
echo setlocal
echo set "zipfile=%installfol%\_misc\template\gh\debug_vanilla\gh2og_vanilla.zip"
echo set "outdir=%installfol%\gh\_ext"
echo set "iop=%installfol%\gh\_ext\IOP"
echo set "dx=%installfol%\gh\_ext\SLUS_214.47"
echo set "elf=%installfol%\gh\_ext\80SDEBUG.ELF"
echo set "cnf=%installfol%\gh\_ext\SYSTEM.CNF"
echo.
echo :: Extract the ZIP file
echo del %%dx%%
echo del %%elf%%
echo del %%cnf%%
echo "%sevenz%" x "%%zipfile%%" -o"%%outdir%%" -y
echo cls
echo echo.
echo echo Original Debugged Version file has been added on the project.
echo echo.
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\gh2og_vanilla.bat"

(
echo @echo off
echo cls
echo echo Install 7-zip by Default.
echo call %installfol%\_misc\installer\requirements\x86\7z_x86.exe
echo cls
echo echo Install .NET 6.0 for Mackiloha and DTAB for Guitar Hero 2.
echo call %installfol%\_misc\installer\requirements\x86\dotnet_60_sdk_86.exe
echo cls
echo echo Install Python 2.7 for Scripting Evaluation
echo call %installfol%\_misc\installer\requirements\x86\python2.7.msi
echo cls
echo echo Install Java
echo call %installfol%\_misc\installer\requirements\x86\java.exe
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\recom_32.bat"

(
echo @echo off
echo cls
echo echo Install 7-zip by Default.
echo call %installfol%\_misc\installer\requirements\x64\7z_x64.exe
echo cls
echo echo Install .NET 6.0 for Mackiloha and DTAB for Guitar Hero 2.
echo call %installfol%\_misc\installer\requirements\x64\dotne60_x64.exe
echo cls
echo echo Install Onyx Music Gametoolkit by mtolly for various rhythm games.
echo call %installfol%\_misc\installer\requirements\x64\onyxui_x64.exe
echo cls
echo echo Install Python 2.7.31 for Scripting Evaluation
echo call %installfol%\_misc\installer\requirements\x64\python-2.7.18.amd64.msi
echo cls
echo echo Install Java
echo call %installfol%\_misc\installer\requirements\x86\java.exe
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\recom_64.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_extbk\GEN
echo set destination=%installfol%\gh\_ext\GEN
echo.
echo echo Restoring ARK files from "%source%%" to "%%destination%%"...
echo rmdir /S /Q "%%destination%%"
echo mkdir "%%destination%%"
echo xcopy "%%source%%" "%%destination%%" /s /e /y /d /i
echo echo.
echo echo Restored!
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\restore_build_ark.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_arkbk
echo set destination=%installfol%\gh\_ark
echo.
echo echo Restoring ARK Files from "%%source%%" to "%%destination%%"...
echo rmdir /S /Q "%%destination%%"
echo mkdir "%%destination%%"
echo xcopy "%%source%%" "%%destination%%" /s /e /y /d /i
echo echo.
echo echo Restored!
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\restore_extract_ark.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_isobk
echo set destination=%installfol%\gh\_iso
echo.
echo echo Backing Up from "%%source%%" to "%%destination%%"...
echo rmdir /S /Q "%%destination%%"
echo xcopy "%%source%%" "%%destination%%" /s /e /y /d /i
echo echo.
echo echo Backuped!
echo echo Check on "%%destination%%"
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\restore_iso.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_extbk\GEN
echo set destination=%installfol%\gh\_ext\GEN
echo.
echo echo Updating ARK files from "%%source%%" to "%%destination%%"...
echo rmdir /S /Q "%%source%%"
echo mkdir "%%source%%"
echo xcopy "%%destination%%" "%%source%%" /s /e /y /d /i
echo echo.
echo echo Updated!
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\update_build_ark.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_ark
echo set destination=%installfol%\gh\_arkbk
echo.
echo echo Updating files from "%%source%%" to "%%destination%%"...
echo mkdir "%%destination%%"
echo xcopy "%%source%%" "%%destination%%" /s /e /y /d /i
echo echo.
echo echo Updated!
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\update_extract_ark.bat"

(
echo @echo off
echo cls
echo set source=%installfol%\gh\_iso
echo set destination=%installfol%\gh\_isobk
echo.
echo echo Backing Up from "%%source%%" to "%%destination%%"...
echo xcopy "%%source%%" "%%destination%%" /s /e /y /d /i
echo echo.
echo echo Backuped!
echo echo Check on "%%destination%%"
echo pause
echo exit
echo.
) > "%installfol%\_misc\scripts\gh\update_iso.bat"

:: ======================================================================================================================== Rock Band Tools ==========================================

(
echo @echo off
echo :menu
echo cls
echo echo  ===============================
echo echo             Rock Band
echo echo             Main Menu
echo echo  ===============================
echo echo.
echo echo             - Tools -
echo echo.
echo echo   1. CPlayer
echo echo   2. GUIFormatter
echo echo   3. KeytarRokker
echo echo   4. MAGMA C3 Roks
echo echo   5. MAGMA RBN
echo echo   6. Nautilus
echo echo   7. RBDLC Tools
echo echo   8. RokDrummer
echo echo.
echo echo             - Misc -
echo echo.
echo echo   9. Consoles Folder
echo echo   0. Back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\rb\cplayer\cPlayer.exe
echo if "%%choice%%"=="2" start %installfol%\rb\guiformatter\guiformat.exe
echo if "%%choice%%"=="3" start %installfol%\rb\keytarrokker\KeytarRokker.exe
echo if "%%choice%%"=="4" start %installfol%\rb\magma_c3\MagmaC3.exe
echo if "%%choice%%"=="5" start %installfol%\rb\magma_rbn\Magma.exe
echo if "%%choice%%"=="6" start %installfol%\rb\nautilus\Nautilus.exe
echo if "%%choice%%"=="7" start %installfol%\rb\rbdlctools\RB_DLC_Tools.exe
echo if "%%choice%%"=="8" start %installfol%\rb\rokdrummer\RokDrummer.exe
echo if "%%choice%%"=="9" call %installfol%\_misc\scripts\rb\open_console.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
echo.
) > "%installfol%\_misc\scripts\rb\menu\main_menu.bat"

(
echo @echo off
echo cls
echo :menu
echo echo  ===============================
echo echo      Chooose REAPER Version
echo echo  ===============================
echo echo.
echo echo  1. v4.22
echo echo  2. v7.34
echo echo.
echo echo           - Options -
echo echo.
echo echo  0. Go back to Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" start %installfol%\_misc\tools\reaper422\reaper.exe
echo if "%%choice%%"=="2" start %installfol%\_misc\tools\reaper745\reaper.exe
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo cls
echo goto menu
) > "%installfol%\_misc\scripts\rb\menu\reaper_menu.bat"

(
echo echo off
echo start "" "%installfol%\rb\misc"
) > "%installfol%\_misc\scripts\rb\menu\open_console.bat"

(
echo @echo off
echo title Charting
echo :menu
echo cls
echo echo  ===============================
echo echo         Charting Section
echo echo  ===============================
echo echo.
echo echo             - Menu -
echo echo.
echo echo  1. REAPER Menu
echo echo  2. Open Moonscraper
echo echo  3. Create New Chart Project
echo echo  4. Test Clone Hero Chart
echo echo.
echo echo  0. Go back to Main Menu
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo.
echo if "%%choice%%"=="1" call %installfol%\_misc\scripts\rb\menu\reaper_menu.bat
echo if "%%choice%%"=="2" start %installfol%\_misc\tools\moonscraper\moonscraper.exe
echo if "%%choice%%"=="3" start %installfol%\_misc\scripts\game\menu\newchart_project.bat
echo if "%%choice%%"=="4" start %installfol%\_misc\scripts\game\menu\test_chart.bat
echo if "%%choice%%"=="0" call %installfol%\main.bat
echo.
echo goto menu
echo.
) > "%installfol%\_misc\scripts\tools\menu\main_menu.bat"

(
echo @echo off
echo mode con: cols=33 lines=30
echo color a
echo title GHRB - Tools v4.0
echo :menu
echo cls
echo echo  ===============================
echo echo         GHRB - Tools v4.0
echo echo.
echo echo       Script and Compiled by
echo echo             Caserol23
echo echo  ===============================
echo echo.
echo echo             - Menu -
echo echo.
echo echo  1. Guitar Hero Menu
echo echo  2. Rock Band Menu
echo echo  3. Games Menu
echo echo.
echo echo             - Tools -
echo echo.
echo echo  4. Charting Tool Menu
echo echo  5. Open Notepad++
echo echo  6. Open FileZilla
echo echo  7. Open PCSX2
echo echo.
echo echo            - Options -
echo echo.
echo echo  8. Open GHRB-Tool Folder
echo echo  9. Requirements Menu
echo echo  0. Exit 
echo echo.
echo echo  ===============================
echo echo.
echo set /p choice=" > "
echo. 
echo if "%%choice%%"=="1" call %installfol%\_misc\scripts\gh\menu\main_menu.bat
echo if "%%choice%%"=="2" call %installfol%\_misc\scripts\rb\menu\main_menu.bat
echo if "%%choice%%"=="3" call %installfol%\_misc\scripts\game\menu\main_menu.bat
echo if "%%choice%%"=="4" call %installfol%\_misc\scripts\tools\menu\main_menu.bat
echo if "%%choice%%"=="5" start %installfol%\_misc\tools\notepad\notepad++.exe
echo if "%%choice%%"=="6" start %installfol%\_misc\tools\filezilla\filezilla.exe
echo if "%%choice%%"=="7" start %installfol%\_misc\tools\pcsx2\pcsx2-qt.exe
echo if "%%choice%%"=="8" start "" %installfol%
echo if "%%choice%%"=="9" call %installfol%\_misc\scripts\gh\menu\requirements_menu.bat
echo if "%%choice%%"=="0" exit
echo.
echo goto menu
) > "%installfol%\main.bat"
echo.
pause
start "" %installfol%\main.bat
