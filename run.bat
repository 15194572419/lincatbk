set /p index=<index.txt
echo %index%
set /a max=0
for %%i in (pic/*.*) do set /a max=max+1
set /a max=max-1
if %index% equ %max% (set /a index=0) else (set /a index=index+1)
echo %index% >index.txt
set current=%cd%\pic\
echo %current%
if %index% equ 0 (for /f %%i in (picurl.txt) do reg add "hkcu\control panel\desktop" /v wallpaper /d %current%%%i /f & goto end) else (for /f "skip=%index%" %%i in (picurl.txt) do reg add "hkcu\control panel\desktop" /v wallpaper /d %current%%%i /f & goto end)
:end
for /l %%j in (1,1,40) do start C:\Windows\System32\RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
timeout -t 1
for /l %%j in (1,1,40) do start C:\Windows\System32\RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters

 
