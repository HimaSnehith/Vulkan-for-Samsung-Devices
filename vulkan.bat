@echo off
setlocal

echo #############################################################################
echo #          Force SkiaVK (Vulkan) Renderer - Enhanced Script                 #
echo #############################################################################
echo.
echo IMPORTANT:
echo  - This change is TEMPORARY and resets on reboot.
echo  - If apps become unstable, fix them via Developer Options > Graphics Driver.
echo.

:CHOICE
set /P c="Apply the Vulkan renderer now? [Y/N]: "
if /I "%c%" EQU "Y" goto :APPLY
if /I "%c%" EQU "N" goto :END
goto :CHOICE

:APPLY
echo.
echo --- STEP 1: Setting Vulkan as the default renderer ---
adb shell setprop debug.hwui.renderer skiavk
echo Property 'debug.hwui.renderer' set to 'skiavk'.
echo.

echo --- STEP 2: Applying changes by restarting key services ---
echo    > Restarting System UI...
adb shell am crash com.android.systemui

echo    > Restarting Samsung Launcher...
adb shell am force-stop com.sec.android.app.launcher

echo    > Restarting AOD Service...
adb shell am force-stop com.samsung.android.app.aodservice

rem Checks for and restarts Gboard if it is installed
adb shell pm list packages com.google.android.inputmethod.latin | findstr "package:" >nul && (
    echo    > Restarting Gboard...
    adb shell am force-stop com.google.android.inputmethod.latin
)

echo.
echo --- DONE ---
echo The system is now using the Vulkan renderer.
echo To revert, simply reboot your phone.
echo.
goto :END

:END
echo Exiting script.
pause
