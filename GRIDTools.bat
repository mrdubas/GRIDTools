::GRID 2008 Tools v1.1 by Dubas
@echo off
set folder=C:\ProgramData\Codemasters\GRID\DataCache
For /F "Tokens=2*" %%I In ('Reg Query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 12750" /V InstallLocation') Do Set InstallLocation=%%J
cls
:menu
echo.
echo Main Menu
echo ---------
echo Enter the number with the desired option and press enter
echo.
echo [1] Set ultra setting without postprocessing and anti-aliasing
echo [2] Set ultra setting with postprocessing and 4xMSAA
echo [3] Clear GRID replay cache folder
echo [4] Skip intro video
echo [5] Restore intro video
echo [6] Remaps instant replay jump key from f12 to the Enter
echo [7] Open GRID folder in new window
echo.
set /P input=""
if %input% == 1 (goto postprocess_off_msaa_off)
if %input% == 2 (goto postprocess_on_msaa_on)
if %input% == 3 (goto clear_cache)
if %input% == 4 (goto skip_intro)
if %input% == 5 (goto restore_intro)
if %input% == 6 (goto remap_key)
if %input% == 7 (goto open_folder)
echo.
echo ERROR! Enter correct number from 1 to 5!
echo.
goto menu

:postprocess_off_msaa_off
echo.
echo Select resolution
echo.
echo [1] 1920x1080
echo [2] 2560x1440
echo [3] 3840x2160
echo.
set /P pp_off_input=""
if %pp_off_input% == 1 (goto pp_off_1080p)
if %pp_off_input% == 2 (goto pp_off_1440p)
if %pp_off_input% == 3 (goto pp_off_2160p)
echo.
echo ERROR! Enter correct number from 1 to 3!
echo.
goto postprocess_off_msaa_off

:pp_off_1080p
echo.
xcopy "%cd%\settings\hardware_settings_restrictions.xml" "%InstallLocation%\system" /i /y
xcopy "%cd%\settings\postprocess_off_msaa_off\1080p\hardware_settings_config.xml" C:\Users\%USERNAME%\Documents\Codemasters\GRID\hardwaresettings /i /y
goto pp_off_message

:pp_off_1440p
echo.
xcopy "%cd%\settings\hardware_settings_restrictions.xml" "%InstallLocation%\system" /i /y
xcopy "%cd%\settings\postprocess_off_msaa_off\1440p\hardware_settings_config.xml" C:\Users\%USERNAME%\Documents\Codemasters\GRID\hardwaresettings /i /y
goto pp_off_message

:pp_off_2160p
echo.
xcopy "%cd%\settings\hardware_settings_restrictions.xml" "%InstallLocation%\system" /i /y
xcopy "%cd%\settings\postprocess_off_msaa_off\2160p\hardware_settings_config.xml" C:\Users\%USERNAME%\Documents\Codemasters\GRID\hardwaresettings /i /y
goto pp_off_message

:pp_off_message
echo.
echo Ultra setting without postprocessing and anti-aliasing installed!
echo.
goto menu

:postprocess_on_msaa_on
echo.
echo Select resolution
echo.
echo [1] 1920x1080
echo [2] 2560x1440
echo [3] 3840x2160
echo.
set /P pp_on_input=""
if %pp_on_input% == 1 (goto pp_on_1080p)
if %pp_on_input% == 2 (goto pp_on_1440p)
if %pp_on_input% == 3 (goto pp_on_2160p)
echo.
echo ERROR! Enter correct number from 1 to 3!
echo.
goto postprocess_on_msaa_on

:pp_on_1080p
echo.
xcopy "%cd%\settings\hardware_settings_restrictions.xml" "%InstallLocation%\system" /i /y
xcopy "%cd%\settings\postprocess_on_msaa_on\1080p\hardware_settings_config.xml" C:\Users\%USERNAME%\Documents\Codemasters\GRID\hardwaresettings /i /y
goto pp_on_message

:pp_on_1440p
echo.
xcopy "%cd%\settings\hardware_settings_restrictions.xml" "%InstallLocation%\system" /i /y
xcopy "%cd%\settings\postprocess_on_msaa_on\1440p\hardware_settings_config.xml" C:\Users\%USERNAME%\Documents\Codemasters\GRID\hardwaresettings /i /y
goto pp_on_message

:pp_on_2160p
echo.
xcopy "%cd%\settings\hardware_settings_restrictions.xml" "%InstallLocation%\system" /i /y
xcopy "%cd%\settings\postprocess_on_msaa_on\2160p\hardware_settings_config.xml" C:\Users\%USERNAME%\Documents\Codemasters\GRID\hardwaresettings /i /y
goto pp_on_message

:pp_on_message
echo.
echo Ultra setting with postprocessing and 4xMSAA installed!
echo.
goto menu

:clear_cache
echo.
RMDIR /S /Q "%folder%"
if not exist "%folder%" mkdir "%folder%"
echo.
echo Folder %folder% cleared!
echo.
goto menu

:skip_intro
echo.
ren "%InstallLocation%\video\intro.bik" skip_intro.bik
echo. 
echo Intro video skipped
echo.
goto menu

:restore_intro
echo.
ren "%InstallLocation%\video\skip_intro.bik" intro.bik
echo. 
echo Intro video restored
echo.
goto menu

:remap_key
echo.
echo If we remapping key, it will stop being displayed in the game interface!
echo.
echo Continue?
echo.
echo [1] Yes
echo [2] No (back to menu)
echo [3] Reset to default (f12)
echo.
set /P remap_input=""
if %remap_input% == 1 (goto remap_yes)
if %remap_input% == 2 (goto menu)
if %remap_input% == 3 (goto remap_default)
echo.
echo ERROR! Enter correct number from 1 to 3!
echo.
goto remap_key

:remap_yes
echo.
xcopy "%cd%\settings\actionmap\enter\actionMapPreset0.xml" "%InstallLocation%\ActionMap" /i /y
echo.
echo The instant replay jump key has been changed to the Enter key
echo.
goto menu

:remap_default
echo.
xcopy "%cd%\settings\actionmap\f12\actionMapPreset0.xml" "%InstallLocation%\ActionMap" /i /y
echo.
echo The instant replay jump key has been changed to the standard f12 key
echo.
goto menu

:open_folder
echo.
%SystemRoot%\explorer.exe "%InstallLocation%"
goto menu