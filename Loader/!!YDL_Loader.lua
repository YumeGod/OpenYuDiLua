--YDL Loader Coded By YuDi
--Start of HTTP Lib By Yukine
local data={}
local http = {}
function http.get(URI,reqNum, callback)
    local obj = {
        ["handle"] = URI,
        ["callback"] = callback,
        ["reqNum"] = reqNum
    }

    table.insert(data, obj)
end
local error_count = {}
function http.callback()
    for k,v in pairs(data) do
        local URI = v["handle"]
        local callback = v["callback"]
        local reqNum = v["reqNum"]
        local netFunc = panorama.loadstring([[
        $.AsyncWebRequest(']]..URI..[[', {type: 'GET', complete: function(c) {
        body]]..reqNum..[[ = c.responseText;
        }});
        return body]]..reqNum..[[;
        ]])
        
        local ifSuccess, body = pcall(netFunc)
        if ifSuccess then
            table.remove( data, k )
            error_count[reqNum] = nil
            callback(body)
        else
            error_count[reqNum] = error_count[reqNum] == nil and 0 or error_count[reqNum] + 1
            if error_count[reqNum] > 5 then
            client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
            client.color_log(255,100,100,"无法连接至YDL服务器，请检查网络后重试！")
            end
        end
    end
    client.delay_call(1, http.callback)
end
client.delay_call(1, http.callback)
client.exec("cam_collision 0")

--local db
local username = database.read("YDL|CloudLoad|Username|R")
local auth = database.read("YDL|CloudLoad|Token|R")

--contains lib
local function Contains(tbl, val) 
	for i = 1, #tbl do
		if tbl[i] == val then
			return true
		end
	end
	return false
end

--Surface lib
local M = {}

local ffi = require "ffi"
local bit = require "bit"

local bit_bor = bit.bor
local ffi_string = ffi.string
local ffi_cast = ffi.cast

local function vmt_entry(instance, index, type)
	return ffi.cast(type, (ffi.cast("void***", instance)[0])[index])
end

-- instance is bound to the callback as an upvalue
local function vmt_bind(module, interface, index, typestring)
	local instance = client.create_interface(module, interface) or error("invalid interface")
	local success, typeof = pcall(ffi.typeof, typestring)
	if not success then
		error(typeof, 2)
	end
	local fnptr = vmt_entry(instance, index, typeof) or error("invalid vtable")
	return function(...)
		return fnptr(instance, ...)
	end
end

-- instance will be passed to the function at runtime
local function vmt_thunk(index, typestring)
	local t = ffi.typeof(typestring)
	return function(instance, ...)
		assert(instance ~= nil)
		if instance then
			return vmt_entry(instance, index, t)(instance, ...)
		end
	end
end

local new_charbuffer = ffi.typeof("char[?]")
local new_intptr = ffi.typeof("int[1]")
local new_widebuffer = ffi.typeof("wchar_t[?]")

-- localize
local native_Localize_ConvertAnsiToUnicode 	= vmt_bind("localize.dll", "Localize_001", 15, "int(__thiscall*)(void*, const char*, wchar_t*, int)")
local native_Localize_ConvertUnicodeToAnsi 	= vmt_bind("localize.dll", "Localize_001", 16, "int(__thiscall*)(void*, wchar_t*, char*, int)")
local native_Localize_FindSafe 							= vmt_bind("localize.dll", "Localize_001", 12, "wchar_t*(__thiscall*)(void*, const char*)")

-- surface
local native_Surface_DrawSetColor 				= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 15, "void(__thiscall*)(void*, int, int, int, int)")
local native_Surface_DrawFilledRect 			= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 16, "void(__thiscall*)(void*, int, int, int, int)")
local native_Surface_DrawOutlinedRect 		= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 18, "void(__thiscall*)(void*, int, int, int, int)")
local native_Surface_DrawLine 						= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 19, "void(__thiscall*)(void*, int, int, int, int)")
local native_Surface_DrawPolyLine 				= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 20, "void(__thiscall*)(void*, int*, int*, int)")
local native_Surface_DrawSetTextFont 			= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 23, "void(__thiscall*)(void*, unsigned long)")
local native_Surface_DrawSetTextColor 		= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 25, "void(__thiscall*)(void*, int, int, int, int)")
local native_Surface_DrawSetTextPos 			= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 26, "void(__thiscall*)(void*, int, int)")
local native_Surface_DrawPrintText 				= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 28, "void(__thiscall*)(void*, const wchar_t*, int, int)")
local native_Surface_DrawGetTextureId 		= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 34, "int(__thiscall*)(void*, const char*)") -- new
local native_Surface_DrawGetTextureFile 	= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 35, "bool(__thiscall*)(void*, int, char*, int)") -- new
local native_Surface_DrawSetTextureFile 	= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 36, "void(__thiscall*)(void*, int, const char*, int, bool)") -- new
local native_Surface_DrawSetTextureRGBA 	= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 37, "void(__thiscall*)(void*, int, const wchar_t*, int, int)") -- new
local native_Surface_DrawSetTexture 			= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 38, "void(__thiscall*)(void*, int)") -- new
local native_Surface_DeleteTextureByID 		= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 39, "void(__thiscall*)(void*, int)") -- new
local native_Surface_DrawGetTextureSize 	= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 40, "void(__thiscall*)(void*, int, int&, int&)") -- new
local native_Surface_DrawTexturedRect 		= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 41, "void(__thiscall*)(void*, int, int, int, int)")
local native_Surface_IsTextureIDValid 		= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 42, "bool(__thiscall*)(void*, int)") -- new
local native_Surface_CreateNewTextureID 	= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 43, "int(__thiscall*)(void*, bool)") -- new
local native_Surface_UnlockCursor 				= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 66, "void(__thiscall*)(void*)")
local native_Surface_LockCursor 					= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 67, "void(__thiscall*)(void*)")
local native_Surface_CreateFont 					= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 71, "unsigned int(__thiscall*)(void*)")
local native_Surface_SetFontGlyph 				= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 72, "void(__thiscall*)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int)")
local native_Surface_GetTextSize 					= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 79, "void(__thiscall*)(void*, unsigned long, const wchar_t*, int&, int&)")
local native_Surface_GetCursorPos 				= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 100, "unsigned int(__thiscall*)(void*, int*, int*)")
local native_Surface_SetCursorPos					= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 101, "unsigned int(__thiscall*)(void*, int, int)")
local native_Surface_DrawOutlinedCircle 	= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 103, "void(__thiscall*)(void*, int, int, int, int)")
local native_Surface_DrawFilledRectFade 	= vmt_bind("vguimatsurface.dll", "VGUI_Surface031", 123, "void(__thiscall*)(void*, int, int, int, int, unsigned int, unsigned int, bool)")

local function draw_print_text(text, localized)
	if localized then
		local cb_size = 1024
		local char_buffer = new_charbuffer(cb_size)
		native_Localize_ConvertUnicodeToAnsi(text, char_buffer, cb_size)

		local test = ffi_string(char_buffer)
		return native_Surface_DrawPrintText(text, test:len(), 0)
	else
		local wb_size = 1024
		local wide_buffer = new_widebuffer(wb_size)

		native_Localize_ConvertAnsiToUnicode(text, wide_buffer, wb_size)
		return native_Surface_DrawPrintText(wide_buffer, text:len(), 0)
	end
end

local function get_text_size(font, text)
	local wide_buffer = new_widebuffer(1024)
	local w_ptr = new_intptr()
	local h_ptr = new_intptr()

	native_Localize_ConvertAnsiToUnicode(text, wide_buffer, 1024)
	native_Surface_GetTextSize(font, wide_buffer, w_ptr, h_ptr)

	local w = tonumber(w_ptr[0])
	local h = tonumber(h_ptr[0])

	return w, h
end

--------------------------
-- renderer functions --
--------------------------

-- cache fonts since we cant delete them, so if multiple scripts create the same font they get the same ID
local font_cache = {}

function M.create_font(windows_font_name, tall, weight, flags)
	local flags_i = 0
	local t = type(flags)
	if t == "number" then
		flags_i = flags
	elseif t == "table" then
		for i=1, #flags do
			flags_i = flags_i + flags[i]
		end
	else
		error("invalid flags type, has to be number or table")
	end

	local cache_key = string.format("%s\0%d\0%d\0%d", windows_font_name, tall, weight, flags_i)
	if font_cache[cache_key] == nil then
		font_cache[cache_key] = native_Surface_CreateFont()
		native_Surface_SetFontGlyph(font_cache[cache_key], windows_font_name, tall, weight, 0, 0, bit_bor(flags_i), 0, 0)
	end

	return font_cache[cache_key]
end

function M.localize_string(str, buf_size)
	local res = native_Localize_FindSafe(str)
	local charbuffer = new_charbuffer(buf_size or 1024)
	native_Localize_ConvertUnicodeToAnsi(res, charbuffer, buf_size or 1024)
	return charbuffer and ffi_string(charbuffer) or nil
end

function M.draw_text(x, y, r, g, b, a, font, text)
	native_Surface_DrawSetTextPos(x, y)
	native_Surface_DrawSetTextFont(font)
	native_Surface_DrawSetTextColor(r, g, b, a)
	return draw_print_text(text, false)
end

function M.draw_localized_text(x, y, r, g, b, a, font, text)
	native_Surface_DrawSetTextPos(x, y)
	native_Surface_DrawSetTextFont(font)
	native_Surface_DrawSetTextColor(r, g, b, a)

	local localized_string = native_Localize_FindSafe(text)
	return draw_print_text(localized_string, true)
end

function M.draw_line(x0, y0, x1, y1, r, g, b, a)
	native_Surface_DrawSetColor(r, g, b, a)
	return native_Surface_DrawLine(x0, y0, x1, y1)
end

function M.draw_filled_rect(x, y, w, h, r, g, b, a)
	native_Surface_DrawSetColor(r, g, b, a)
	return native_Surface_DrawFilledRect(x, y, x + w, y + h)
end

function M.draw_outlined_rect(x, y, w, h, r, g, b, a)
	native_Surface_DrawSetColor(r, g, b, a)
	return native_Surface_DrawOutlinedRect(x, y, x + w, y + h)
end

function M.draw_filled_outlined_rect(x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1)
	native_Surface_DrawSetColor(r0, g0, b0, a0)
	native_Surface_DrawFilledRect(x, y, x + w, y + h)
	native_Surface_DrawSetColor(r1, g1, b1, a1)
	return native_Surface_DrawOutlinedRect(x, y, x + w, y + h)
end

function M.draw_filled_gradient_rect(x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1, horizontal)
	native_Surface_DrawSetColor(r0, g0, b0, a0)
	native_Surface_DrawFilledRectFade(x, y, x + w, y + h, 255, 255, horizontal)

	native_Surface_DrawSetColor(r1, g1, b1, a1)
	return native_Surface_DrawFilledRectFade(x, y, x + w, y + h, 0, 255, horizontal)
end

function M.draw_outlined_circle(x, y, r, g, b, a, radius, segments)
	native_Surface_DrawSetColor(r, g, b, a)
	return native_Surface_DrawOutlinedCircle(x, y, radius, segments)
end

function M.draw_poly_line(x, y, r, g, b, a, count)
	native_Surface_DrawSetColor(r, g, b, a)
	return native_Surface_DrawPolyLine(new_intptr(x), new_intptr(y), count)
end

function M.test_font(x, y, r, g, b, a, font)
	local _, height_offset = get_text_size(font, "a b c d e f g h i j k l m n o p q r s t u v w x y z")

	M.draw_text(x, y, r, g, b, a, font, "a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 ? + # ? ? ü , . -")
	M.draw_text(x, y + height_offset, r, g, b, a,  font, "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z = ! \" § $ % & / ( ) = ? { [ ] } \\ * ' _ : ; ~ ")
end

function M.get_text_size(font, text)
	return get_text_size(font, text)
end

function M.set_mouse_pos(x, y)
	return native_Surface_SetCursorPos(x, y)
end

function M.get_mouse_pos()
	local x_ptr = new_intptr()
	local y_ptr = new_intptr()

	native_Surface_GetCursorPos(x_ptr, y_ptr)

	local x = tonumber(x_ptr[0])
	local y = tonumber(y_ptr[0])

	return x, y
end

function M.unlock_cursor()
	return native_Surface_UnlockCursor()
end

function M.lock_cursor()
	return native_Surface_LockCursor()
end

function M.load_texture(filename)
	local texture = native_Surface_CreateNewTextureID(false)
	native_Surface_DrawSetTextureFile(texture, filename, true, true)

	local wide_ptr = new_intptr()
	local tall_ptr = new_intptr()
	native_Surface_DrawGetTextureSize(texture, wide_ptr, tall_ptr)

	local w = tonumber(wide_ptr[0])
	local h = tonumber(tall_ptr[0])

	return texture, w, h
end

-- fallback to built in renderer
setmetatable(M, {
	__index = renderer
})
surface = M
local verdana = surface.create_font("verdana", 256, 605, {0x001}) or error("Failed to generate font")
local verdanac = surface.create_font("verdana", 50, 605, {0x001}) or error("Failed to generate font")
local verdanalc = surface.create_font("verdana", 200, 605, {0x001}) or error("Failed to generate font")

--change clipboard lib

local ffi = require "ffi"

local ffi_cast = ffi.cast

ffi.cdef [[
typedef int(__thiscall* get_clipboard_text_count)(void*);
typedef void(__thiscall* set_clipboard_text)(void*, const char*, int);
typedef void(__thiscall* get_clipboard_text)(void*, int, const char*, int);
]]

local VGUI_System010 =  client.create_interface("vgui2.dll", "VGUI_System010") or print( "Error finding VGUI_System010")
local VGUI_System = ffi_cast( ffi.typeof( "void***" ), VGUI_System010 )

local get_clipboard_text_count = ffi_cast( "get_clipboard_text_count", VGUI_System[ 0 ][ 7 ] ) or print( "get_clipboard_text_count Invalid")
local set_clipboard_text = ffi_cast( "set_clipboard_text", VGUI_System[ 0 ][ 9 ] ) or print( "set_clipboard_text Invalid")
local get_clipboard_text = ffi_cast( "get_clipboard_text", VGUI_System[ 0 ][ 11 ] ) or print( "get_clipboard_text Invalid")

local function get_clipboard()
  local clipboard_text_length = get_clipboard_text_count( VGUI_System )
  if clipboard_text_length > 0 then
    local buffer = ffi.new("char[?]", clipboard_text_length)
    local size = clipboard_text_length * ffi.sizeof("char[?]", clipboard_text_length)
    get_clipboard_text( VGUI_System, 0, buffer, size )
    local clipboard_data = ffi.string( buffer, clipboard_text_length-1 )
    return clipboard_data
  else
    return nil
  end
end
local function set_clipboard(content)
    if content then
      set_clipboard_text( VGUI_System, content, content:len() )
    end
end
--end region





--start lua





--clear console
client.exec("clear")
client.color_log(255,255,255,"LUA Script By YuDi")

--log color
client.set_event_callback("paint_ui",function()
    cr = client.random_int(1, 255)
    cb = client.random_int(1, 255)
    cg = client.random_int(1, 255)
end)

--Ui renderering
sr,sg,sb =0,255,100
local a = table.insert
local b = globals.tickcount
local c = globals.tickinterval
local d, e = client.screen_size()
local f = entity.get_all
local g = entity.get_prop
local h = entity.get_local_player
local i = client.draw_rectangle
local j = string.format
local k = math.floor
local l = ui.get
local m = ui.reference("MISC", "Settings", "Anti-untrusted")
local n = (function()
    local o = {}
    local p, q, r, s, t, u, v, w, x, y, z, A, B, C, D
    local E = {__index = {drag = function(self, ...)
                local F, G = self:get()
                local H, I = o.drag(F, G, ...)
                if F ~= H or G ~= I then
                    self:set(H, I)
                end
                return H, I
            end, set = function(self, F, G)
                local x, y = client.screen_size()
                ui.set(self.x_reference, F / x * self.res)
                ui.set(self.y_reference, G / y * self.res)
            end, get = function(self)
                local x, y = client.screen_size()
                return ui.get(self.x_reference) / self.res * x, ui.get(self.y_reference) / self.res * y
            end}}
    function o.new(J, K, L, M)
        M = M or 10000
        local x, y = client.screen_size()
        local N = ui.new_slider("LUA", "A", J .. " load position", 0, M, K / x * M)
        local O = ui.new_slider("LUA", "A", "\n" .. J .. " load position y", 0, M, L / y * M)
        ui.set_visible(N, false)
        ui.set_visible(O, false)
        return setmetatable({name = J, x_reference = N, y_reference = O, res = M}, E)
    end
    function o.drag(F, G, P, Q, R, S, T)
        if globals.framecount() ~= p then
            q = ui.is_menu_open()
            t, u = r, s
            r, s = ui.mouse_position()
            w = v
            v = client.key_state(0x01) == true
            A = z
            z = {}
            C = B
            B = false
            x, y = client.screen_size()
        end
        if q and w ~= nil then
            if (not w or C) and v and t > F and u > G and t < F + P and u < G + Q then
                B = true
                F, G = F + r - t, G + s - u
                if not S then
                    F = math.max(0, math.min(x - P, F))
                    G = math.max(0, math.min(y - Q, G))
                end
            end
            if t >= F and u >= G and t <= F + P and u <= G + Q then
                D = true
            else
                D = false
            end
        else
            t, u, r, s = 0, 0, 0, 0
            D = false
        end
        table.insert(z, {F, G, P, Q})
        return F, G, P, Q
    end
    function o.match()
        return D
    end
    return o
end)()
local U = n.new("lualod", 600, 500)
local V = 255
local W = true
local X, Y, Z = 239, 77, 77
local _ = true
local a0, a1, a2 = 0, 0, 0
local function a3(a4)
    local a5 = globals.realtime()
    local a6 = 8 + math.sin(math.abs(-math.pi + globals.realtime() * 0.6 / 1 % (math.pi * 2))) * 12
    local a7, a8, a9 = 194, 102, 255
    local aa, ab, ac = 255, 240, 0
    local ad, ae, af = 194, 102, 255
    local ag = n.match() and 200 or 0
    local ah, ai = U:get()
    local v, L = 20, 210
    if load_success and _ then
        _ = false
        X, Y, Z = 182, 236, 34
    end
    if username == nil then
        gun = "Guest"
    else
        gun = username
    end
    lx , ly = renderer.measure_text(nil,gun)
    testt = lx
    client.draw_gradient(a4, ah, ai - 2, 136 + a0 + a1 + a6 * 5, 2, a7, a8, a9, a6 * 6, 25, 25, 25, 5, true)
    client.draw_gradient(a4, ah + 220 + a0 + a1, ai - 2, -a6 * 3, 2, a7, a8, a9, a6 * 6, 25, 25, 25, 5, true)
    client.draw_gradient(a4, ah + 220 + a0 + a1, ai - 1, -a6 * 2, 1 + v, a7, a8, a9, a6 * 6, 25, 25, 25, 5, true)
    client.draw_gradient(a4, ah, ai, a6 + a0 + a1, v, a7, a8, a9, 255, 25, 25, 25, 5, true)
    client.draw_gradient(a4, ah, ai, L + a0 + a1, v, 30, 30, 30, 200, 10, 10, 10, 10, true)
    renderer.text(ah + 15, ai + 2, 255, 255, 255,255, "", 0, "[")
    renderer.text(ah + 22, ai + 3, cr, cg, cb, 255, "", 0, "YuDi.Lua")
    renderer.text(ah + 65 + a0, ai + 2, 255, 255, 255,255, "", 0, "]")
    renderer.text(ah + 5 + a0 + a1, ai + 2, 255, 255, 255, 255, "", 0, "Welcome")
    renderer.text(ah + 52 + a0 + a1, ai + 2, 0, 255, 100, 255, "", 0, gun)
    nv = ah + 52 + a0 + a1+testt+5
    renderer.text(nv, ai + 2, 255, 255, 255, 255, "", 0, "|")
    renderer.text(nv +10, ai + 2, 255, 255, 255, 255, "", 0, "Lua Status:")
    renderer.text(nv +75, ai + 7, sr, sg, sb, 255, "c+", 0, " ● ")
    client.draw_gradient(a4, ah + 220 + a0 + a1, ai + v, -120 - a6 * 5, 2, a7, a8, a9, a6 * 6, 25, 25, 25, 20, true)
    client.draw_gradient(a4, ah, ai + v, a6 * 3 + a0 + a1, 2, a7, a8, a9, a6 * 6, 25, 25, 25, 20, true)
    client.draw_gradient(a4, ah, ai - 1, a6, 1 + v, a7, a8, a9, a6 * 6, 25, 25, 25, 5, true)
    if ui.is_menu_open() then
        mx,my = ui.menu_position()
        msx,msy = ui.menu_size()
        mmx,mmy = ui.mouse_position()
        hrs,min,sec,mil = client.system_time()
        surface.draw_text(500, 100, 0, 155, 255, 255, verdana, "YuDi")
        surface.draw_text(970, 100, 255, 255, 255, 255, verdana, ".Lua")
        surface.draw_text(950, 320, 255, 255, 255, 255, verdanalc, "By")
        surface.draw_text(1170, 320, 0, 155, 255, 255, verdanalc, "YuDi.")
        surface.draw_text(340, 400, 255, 255, 255, 255, verdanac, ".Lua")
        renderer.circle_outline(450, 400, 0, 200, 255, 170, 210, 130, 0.37, 55)
        renderer.circle_outline(450, 400, 255, 255, 0, 170, 210, 15, 0.32, 55)
        renderer.circle(450,-100 + 500,0,155,255,230,100,180,0.4)
        renderer.circle(450,-100 + 500,255,255,0,230,100,320,0.35)
    end
    a1 = 70
    U:drag(L + a0 + a1 + 12, v)
end
client.set_event_callback("paint_ui", a3)





-- Auth

--check if hwid already bind
if auth ~= nil then
    local mdfile = readfile("csgo/package.YDL")
    if mdfile ~= nil then
    --loading
    client.set_event_callback("paint_ui",function()
        cr = client.random_int(1, 255)
        cb = client.random_int(1, 255)
        cg = client.random_int(1, 255)
    end)
    ui.new_label('Lua', 'B', "------------------------- YuDi.Lua -------------------------")
    ui.new_label('Lua', 'B', " | Loader Version : 3.8.11.20.2512")
    ui.new_label('Lua', 'B', " | Lua Status: Online")
    ui.new_label('Lua', 'B', " | LUA Scripy Made By YuDi")
    ui.new_label('Lua', 'B', "------------------------------------------------------------")
    ui.new_label('Lua', 'B', " | User: "..username)
    local get_local_player = entity.get_local_player
local entity_get_prop = entity.get_prop
local client_set_clan_tag = client.set_clan_tag
local oldTick = globals.tickcount()
local TwinTower_enabled = ui.new_checkbox("LUA", "B", " | YDL Clantag")
local TwinTowerClantag = {"@%!&$%@","Y%!&$%@","Yu!&$%@","YuD&$%@","YuDi$%@","YuDi.$%@","YuDi.L%@","YuDi.Lu@","YuDi.Lua","YuDi.Lu@","YuDi.L%@","YuDi.$%@","YuDi$%@","YuD&$%@","Yu!&$%@","Y%!&$%@"} 
local cur = 1
local function get_twint(e)
    if (ui.get(TwinTower_enabled)) then
        if globals.tickcount() - oldTick > 55 then
            cur = math.floor(globals.curtime() % 16 + 1)
            client_set_clan_tag(TwinTowerClantag[cur])
            oldTick = globals.tickcount()
        end
    end
end
client.set_event_callback("player_connect_full", function(e)
    oldTick = globals.tickcount()
end)
client.set_event_callback("paint", get_twint)
    ui.new_label('Lua', 'B', "------------------------------------------------------------")
    client.color_log(255,255,255," [YuDi.Lua]  \0")
    client.color_log(0,255,100,"欢迎回来 \0")
    client.color_log(0,255,255,username)
    http.get("http://3.21.122.196:8310/configs?token="..auth.."&password=YuDiTheGod", "MainLoader", function(ce)
        export = ui.reference('Config','Presets','Export to clipboard')
cce = ui.new_checkbox("Lua","B"," | Cloud Config System")
cfgnametxt = ui.new_label("LUA","B"," | ConfigName:")
cfgname = ui.new_textbox("lua","B"," | ConfigName")
b = ui.new_button("Lua","B","Upload",function()
    cfginname = ui.get(cfgname)
    if cfginname ~= nil then
        ui.set(export,true)
        lc = get_clipboard()
        local construct = {
            ConfigName = username.."-"..cfginname,
            Contains = lc
        }
        local reqFreq = 0.5
local function httpHashMap()
	panorama.loadstring([[
        HashMap = function HashMap(){  
        var length = 0;  
        var obj = new Object();  
    
        this.isEmpty = function(){  
            return length == 0;  
        };  
    
        this.containsKey=function(key){  
            return (key in obj);  
        };  
     
        this.containsValue=function(value){  
            for(var key in obj){  
                if(obj[key] == value){  
                    return true;  
                }  
            }  
            return false;  
        };  
    
        this.put=function(key,value){  
            if(!this.containsKey(key)){  
                length++;  
            }  
            obj[key] = value;  
        };  
    
        this.get=function(key){  
            return this.containsKey(key)?obj[key]:null;  
        };  
     
        this.remove=function(key){  
            if(this.containsKey(key)&&(delete obj[key])){  
                length--;  
            }  
        };  
     
        this.values=function(){  
            var _values= new Array();  
            for(var key in obj){  
                _values.push(obj[key]);  
            }  
            return _values;  
        };  
     
        this.keySet=function(){  
            var _keys = new Array();  
            for(var key in obj){  
                _keys.push(key);  
            }  
            return _keys;  
        };  
    
        this.size = function(){  
            return length;  
        };  
     
        this.clear = function(){  
            length = 0;  
            obj = new Object();  
        };  
    }  ]])()
	local data = {}
	local http = {}
	local http_lut = panorama.loadstring([[
        http_lut = new HashMap()
        return http_lut
    ]])()
	local function uuid(len)
		local res, len = "", len or 24
		for i = 1, len do
			res = res .. string.char(client.random_int(97, 122))
		end
		return res
	end

	local netFunc = panorama.loadstring([[
        //Credit baka
        var _create_http_req = function(type, url, data, id, header){	
            http_lut.put(id, "requesting");
            let send = {
                type: type, 
                data: data,
                complete: function(c){http_lut.put(id, c.responseText);} , 
                timeout: 60000, 
                headers: header,
            };
            $.AsyncWebRequest(url, send)
        }
        return _create_http_req
    ]])()
	function http.create(type, URI, req_data, header, callback)
		local obj = {["type"] = type, ["handle"] = URI, ["data"] = req_data or {}, ["callback"] = callback, ["reqNum"] = uuid(), ["headers"] = header}
		table.insert(data, obj)
	end
	function http.get(URI, callback)
		local obj = {["type"] = 'GET', ["handle"] = URI, ["data"] = {}, ["callback"] = callback, ["reqNum"] = uuid(), ["headers"] = {}}
		table.insert(data, obj)
	end
	function http.post(URI, req_data, callback)
		local obj = {["type"] = 'POST', ["handle"] = URI, ["data"] = req_data or {}, ["callback"] = callback, ["reqNum"] = uuid(), ["headers"] = {}}
		table.insert(data, obj)
	end
	function http.post_header(URI, req_data, header, callback)
		local obj = {["type"] = 'POST', ["handle"] = URI, ["data"] = req_data or {}, ["callback"] = callback, ["reqNum"] = uuid(), ["headers"] = header or {}}
		table.insert(data, obj)
	end
	function http.put(URI, req_data, callback)
		local obj = {["type"] = 'PUT', ["handle"] = URI .. "&data=" .. json.stringify(req_data), ["data"] = req_data or {}, ["callback"] = callback, ["reqNum"] = uuid(), ["headers"] = {_method = "PUT"}}
		table.insert(data, obj)
	end
	function http.delete(URI, req_data, callback)
		local obj = {["type"] = 'DELETE', ["handle"] = URI, ["data"] = req_data or {}, ["callback"] = callback, ["reqNum"] = uuid(), ["headers"] = {}}
		table.insert(data, obj)
	end
	function http.callback()
		for k, v in pairs(data) do
			local type = v["type"]
			local URI = v["handle"]
			local req_data = v["data"]
			local callback = v["callback"]
			local reqNum = v["reqNum"]
			local headers = v["headers"] or {}
			local body = http_lut.get(reqNum)
			if body then
				if body ~= "requesting" then
					http_lut.remove(reqNum)
					table.remove(data, k)
					callback(body)
				end
			else
				netFunc(type, URI, req_data, reqNum, headers)
			end
		end
		client.delay_call(reqFreq, http.callback)
	end
	client.delay_call(reqFreq, http.callback)
	return http
end
local http = httpHashMap()
local master_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjA1OTE3OTg1LCJleHAiOjE2MDg1MDk5ODV9.p6dIxuZ-0dg53vTBCoEWux_UuIhTxqkkkKq5X54oPWE"
        http.post_header("http://3.21.122.196:8310/configs", construct, {Authorization = "Bearer "..master_key}, function (ctx)
            client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
            client.color_log(0,255,255,"上传参数 >  \0")
            client.color_log(255,255,255,username.."-"..cfginname.."\0")
            client.color_log(0,255,100," 上传成功！（重启两遍Loader即可看到）")
        end)
    else
        client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
        client.color_log(255,100,100,"请填写ConfigName！")
    end
end)
ui.set_visible(cfgname,false)
ui.set_visible(b,false)
ui.set_visible(cfgnametxt,false)
ui.set_callback(cce,function()
    client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
    client.color_log(0,255,100,"云端参数系统初始化成功！ ")
    ui.set_visible(cfgname,true)
    ui.set_visible(b,true)
    ui.set_visible(cce,false)
    ui.set_visible(cfgnametxt,true)
end)
client.set_event_callback("paint_ui",function()
    ui.set_visible(export,false)
end)
        client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
        client.color_log(0,255,100,"参数系统初始化成功！ ")
        local obj = {}
        local data = json.parse(ce)
        for k,v in pairs(data) do
        if v and v.ConfigName and v.Contains then
        obj[v.ConfigName] = v.Contains
        end
        end
        local names={}
        for name,_ in pairs(obj) do
        table.insert(names,name)
        end
        local config = ui.new_combobox('Lua', 'B', ' | Choose Configs', names)
        local configb = ui.new_button('Lua','B','Click to load',function()
            local configloaded = ui.get(config)
            client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
            client.color_log(0,255,255,"加载参数 >  \0")
            client.color_log(255,255,255,configloaded.."\0")
            client.color_log(0,255,100," 加载成功！")
            local cchache = get_clipboard()
            set_clipboard(obj[configloaded])
            local import_cfg = ui.reference('config','presets','Import from clipboard')
            ui.set(import_cfg,true)
            set_clipboard(cchache)
        end)
        ui.new_label('Lua', 'B', "------------------------------------------------------------")
    end)    
    http.get("http://3.21.122.196:8310/luas?token="..auth.."&password=YuDiTheGod", "LuaLoading", function(L)
        client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
        client.color_log(0,255,100,"Lua系统初始化成功！ ")
        ui.set_visible(ui.new_checkbox('Visuals', 'Other ESP', 'YDL LoadLuaKey 3NyJna4GGWe07eiQAneHZNdMP1T1Hi54 R'), false)
        local obj = {}
        local loaded = {}
        local data = json.parse(L)
        for k,v in pairs(data) do
        if v and v.Name and v.Lua then
        obj[v.Name] = v.Lua
        end
        end
        local names={}
        for name,_ in pairs(obj) do
        table.insert(names,name)
        end
        local load = ui.new_multiselect('Lua', 'B', ' | Choose Scrips', names)
        local load_ref = {}
        local load_ref_v = 0
        local function load_meta()
            for key, value in pairs(ui.get(load)) do
                if obj[value] ~= nil then
                    local ifSuccess, data_ptr = pcall(loadstring, obj[value])
                    if ifSuccess and not Contains(load_ref, value) then
                        client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
                        client.color_log(0,255,255,"加载脚本 >  \0")
                        client.color_log(255,255,255,value.."\0")
                        client.color_log(0,255,100," 加载成功！")
                        data_ptr()
                        table.insert(load_ref, value)
                        load_ref_v = #load_ref
                    end
                end
            end
        end
        load_meta()
        local apply = ui.new_button("Lua", "B", " | Apply changes", function(self)
            ui.set_visible(self, false)
            client.reload_active_scripts()
        end)
        ui.set_visible(apply, false)
        ui.set_callback(load, function ()
            load_meta()
            if #load_ref < load_ref_v then
                ui.set_visible(apply, true)
            end
        end)
        ui.new_label('Lua', 'B', "------------------------------------------------------------")
    end)
else
    client.color_log(255,200,100," [YuDi.Lua]  \0")
    client.color_log(255,100,100,"请安装最新的YDL模组包！(在QQ群下载！)")
end
else
--if hwid didnt bind then register function
local function ctx()
    client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
    client.color_log(255,100,100,"请使用 !Reg <用户名> <卡密> 进行注册！")
  end
  client.set_event_callback("paint_ui",ctx)
  --if hwid not bind then
  local username = "" -- Just for storage
  --console stuffs
  function string:split(sep)
      local sep, fields = sep or ":", {}
      local pattern = string.format("([^%s]+)", sep)
      self:gsub(pattern, function(c) fields[#fields+1] = c end)
      return fields
  end
  client.set_event_callback("console_input", function(cmd)
      local tmpCmd = string.sub(cmd, 1, 5)
      if tmpCmd == "!Reg " then
        client.unset_event_callback("paint_ui", ctx)
          if cmd:len() > string.len("!Reg ") then
              local cmd = cmd:gsub("!Reg ", "")
              local args = cmd:split(" ")
              if #args < 2 then 
                  client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
                  client.color_log(255,100,100,"请使用 !Reg <用户名> <卡密> 进行注册！")
                  return true
              end
              username = args[1] local authCode = args[2]
              http.get("http://3.21.122.196:8310/users/me?token="..authCode, "MainLoader", function(L)
                  local dataa = json.parse(L)
                  if dataa then
                      if dataa.statusCode == 401 and dataa.error == "Unauthorized" and string.sub(dataa.message,1,17) == "Token registered:" then
                          client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
                          client.color_log(0,255,100,"欢迎使用YDL , "..username.." ("..authCode..")")
                          database.write("YDL|CloudLoad|Username|R",username)
                          database.write("YDL|CloudLoad|Token|R",authCode)
                          client.delay_call(3,function()
                            client.reload_active_scripts()
                          end)
                      else
                        client.color_log(cr,cg,cb," [YuDi.Lua]  \0")
                        client.color_log(255,100,100,"卡密错误")
                      end
                  end
              end)
          -- add elseif to pack more functions
          end
          return true --otherwise cause console error
      end
  end)
end



