@echo off
set SRC="W:\Other\DevTools\LuaJIT 2.1\src"
set OUT="W:\Other\DevTools\LuaJIT 2.1\to-exe"

cl %OUT%\main.c %SRC%\lua51.lib user32.lib /I%SRC% /Fo%OUT%\main.obj /Fe%OUT%\main.exe