# LuaJIT 2.1

---

Такая хуйня, что-бы luajit.exe работал нормально, нужна вся папка Source, снизу не актуально

---

|Файл|Описание|Собран|
|-|-|-|
|**luajit.exe**|LuaJIT с вшитым lua51.dll и -b модулем|``msvcbuild-with-b.bat static`` в **DCP**|
|**luajit-no-b.exe**|LuaJIT с вшитым lua51.dll|``msvcbuild.bat static`` в **DCP**|
|**Source\luajit.exe**|LuaJIT требующий lua51.dll|``msvcbuild.bat`` в **DCP**|
|**bin2c.lua**|Для конвертации Lua в бинарный файл|Помощь ИИ|

**DCP*** - **Developer Command Prompt**

---

``luajit -b`` вызывает ошибку, по этому ИИ написал файл ``bin2c.lua``, вызывается так:

``luajit "W:\Other\DevTools\LuaJIT 2.1\bin2c.lua" ..\source\Main.lua WOV.out``

---

* https://luajit.org/
* https://github.com/LuaJIT/LuaJIT