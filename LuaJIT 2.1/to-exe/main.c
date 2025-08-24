#include <windows.h>
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

#include "main.h"

int main() {
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    if (luaL_loadbuffer(L, (const char*)lua_code, lua_code_size, "main") || lua_pcall(L, 0, 0, 0)) {
        MessageBoxA(NULL, lua_tostring(L, -1), "LuaJIT Error", MB_OK | MB_ICONERROR);
    }
    lua_close(L);
    return 0;
}