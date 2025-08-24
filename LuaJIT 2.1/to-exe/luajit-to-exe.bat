if "%~1"=="" (
    echo Usage: %0 "path\to\your\script.lua" "path\to\your\out-exe.exe"
    exit /b 1
)

set SRC=W:\Other\DevTools\LuaJIT 2.1\src
set OUT=W:\Other\DevTools\LuaJIT 2.1\to-exe
set DCP=W:\Programs\MVS 2022\VC\Tools\MSVC\14.43.34808\bin\Hostx64\x64

for %%f in ("%~1") do set FNAME=%%~nf

if "%~2"=="" (
    set EXE=%OUT%\%FNAME%.exe
) else (
    set EXE=%~2
)

pushd %SRC%
luajit -b "%~1" "%OUT%\main.out"

"%OUT%\luajit-xxd" "%OUT%\main.out" "%OUT%\main.h"
popd

call "W:\Programs\MVS 2022\Common7\Tools\VsDevCmd.bat"
cl "%OUT%\main.c" "%SRC%\lua51.lib" user32.lib /I"%SRC%" /Fo"%OUT%\main.obj" /Fe"%EXE%"

echo Done! Created %EXE%