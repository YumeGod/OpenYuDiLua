local notify = {}
notify.__index = notify
ui.new_label("Rage","other","----------Aimbot Log----------")
-- Green 150, 185, 1
-- Red 255, 24, 24

notify.invoke_callback = function(timeout)
    return setmetatable({
        active = false,
        delay = 0,
        laycoffset = -11, 
        layboffset = -11
    }, notify)
end

notify.setup_color = function(color, sec_color)
    -- Reset function
    if type(color) ~= 'table' then
        notify:setup()
        return
    end

    if notify.color == nil then notify:setup() end

    if color ~= nil then notify.color[1] = color end
    if sec_color ~= nil then notify.color[2] = sec_color end
end

notify.add = function(time, is_right, ...)
    if notify.color == nil then
        notify:setup()
    end

    table.insert(notify.__list, {
        ["tick"] = globals.tickcount(),
        ["invoke"] = notify.invoke_callback(),
        ["text"] = { ... }, ["time"] = time,
        ["color"] = notify.color,
        ["right"] = is_right,
        ["first"] = false
    })
end

function notify:setup()
    notify.color = { 
        { 150, 185, 1 },
        { 0, 0, 0 }
    }

    -- Due to security reasons
    if notify.__list == nil then
        notify.__list = {}
        client.delay_call(0.05, function()
            -- useless but ok
            -- notify.setup_color({ 25, 118, 210 })
            notify.add(3, false, { 255, 255, 255, "Added callback handler for " }, { 150, 185, 1, "notify.lib" })
        end)
    end
end

function notify:listener()
    local count_left = 0
    local count_right = 0
    local old_tick = 0

    if notify.__list == nil then
        notify:setup()
    end

    for i=1, #notify.__list do
        local layer = notify.__list[i]
        if layer.tick ~= old_tick then
            notify:setup()
        end

        if layer.right == true then
            layer.invoke:show_right(count_right, layer.color, layer.text)
            if layer.invoke.active then
                count_right = count_right + 1
            end
        else
            layer.invoke:show(count_left, layer.color, layer.text)
            if layer.invoke.active then
                count_left = count_left + 1
            end
        end

        if layer.first == false then
            layer.invoke:start(layer.time)
            notify.__list[i]["first"] = true
        end

        old_tick = layer.tick
    end
end

function notify:start(timeout)
    self.active = true
    self.delay = globals.realtime() + timeout
end

function notify:get_text_size(lines_combo)
    local x_offset_text = 0

    for i=1, #lines_combo do
        local r, g, b, message = unpack(lines_combo[i])
        local width, height = renderer.measure_text("", message)
        x_offset_text = x_offset_text + width
    end

    return x_offset_text
end

function notify:string_ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
 end

function notify:multicolor_text(x, y, flags, lines_combo)
    local line_height_temp = 0
    local x_offset_text = 0
    local y_offset = 0

    for i=1, #lines_combo do
        local r, g, b, message = unpack(lines_combo[i])

        message = message .. "\0"
        renderer.text(x + x_offset_text, y + y_offset, r, g, b, 255, flags, 0, message)

        if self:string_ends_with(message, "\0") then
            local width, height = renderer.measure_text(flags, message)
            x_offset_text = x_offset_text + width
        else
            x_offset_text = 0
            y_offset = y_offset + line_height_temp
        end
    end
end

function notify:show(count, color, text)
    if self.active ~= true then
        return
    end

    local x, y = client.screen_size()
    local y = 5 + (27 * count)
    local text_w, text_h = self:get_text_size(text)
    
    local max_width = text_w 
    local max_width = max_width < 150 and 150 or max_width 

    if color == nil then color = self.color end
    local factor = 255 / 25 * globals.frametime()

    if globals.realtime() < self.delay then
        if self.laycoffset < max_width then self.laycoffset = self.laycoffset + (max_width - self.laycoffset) * factor end
        if self.laycoffset > max_width then self.laycoffset = max_width end
        if self.laycoffset > max_width / 1.09 then
            if self.layboffset < max_width - 6 then
                self.layboffset = self.layboffset + ((max_width - 6) - self.layboffset) * factor
            end
        end

        if self.layboffset > max_width - 6 then
            self.layboffset = max_width - 6
        end
    else
        if self.layboffset > -11 then
            self.layboffset = self.layboffset - (((max_width-5)-self.layboffset) * factor) + 0.01
        end

        if self.layboffset < (max_width - 11) and self.laycoffset >= 0 then
            self.laycoffset = self.laycoffset - (((max_width + 1) - self.laycoffset) * factor) + 0.01
        end

        if self.laycoffset < 0 then 
            self.active = false
        end
    end

    renderer.rectangle(self.laycoffset - self.laycoffset, y, self.laycoffset + 16, 25, color[1][1], color[1][2], color[1][3], 255)
    renderer.rectangle(self.layboffset - self.laycoffset, y, self.layboffset + 22, 25, color[2][1], color[2][2], color[2][3], 255)
    self:multicolor_text(self.layboffset - max_width + 11, y + 6, "", text)
end

function notify:show_right(count, color, text)
    if self.active ~= true then
        return
    end

    local x, y = client.screen_size()
    local y = y - 68 - (27 * count)
    local text_w, text_h = self:get_text_size(text)
    
    local max_width = text_w + 22
    local max_width = max_width < 150 and 150 or max_width 

    if color == nil then color = self.color end
    local factor = 255 / 25 * globals.frametime()

    if globals.realtime() < self.delay then
        if self.laycoffset < max_width then self.laycoffset = self.laycoffset + (max_width - self.laycoffset) * factor end
        if self.laycoffset > max_width then self.laycoffset = max_width end
        if self.laycoffset > max_width / 1.09 then
            if self.layboffset < max_width - 6 then
                self.layboffset = self.layboffset + ((max_width - 6) - self.layboffset) * factor
            end
        end

        if self.layboffset > max_width - 6 then
            self.layboffset = max_width - 6
        end
    else
        if self.layboffset > 0 then
            self.layboffset = self.layboffset - (((max_width-5)-self.layboffset) * factor) + 0.01
        end

        if self.layboffset < (max_width - 11) and self.laycoffset >= 0 then
            self.laycoffset = self.laycoffset - (((max_width + 1) - self.laycoffset) * factor) + 0.01
        end

        if self.laycoffset < 0 then 
            self.active = false
        end
    end

    renderer.rectangle(x - self.laycoffset + 3, y, self.laycoffset + 3 + self.laycoffset, 25, color[1][1], color[1][2], color[1][3], 255)
    renderer.rectangle(x - self.layboffset + 3, y, self.layboffset + 3 + self.layboffset, 25, color[2][1], color[2][2], color[2][3], 255)
    self:multicolor_text(x - self.layboffset + 10, y + 6, "", text)
end

local aimbotlog_enable = ui.new_checkbox("Rage", "Other", "Nofiction Logs")
local on_fire_enable = ui.new_checkbox("Rage", "Other", "Fire log")
local on_fire_colour = ui.new_color_picker("Rage", "Other", "Fire log", 147, 112, 219, 255)
local on_miss_enable = ui.new_checkbox("Rage", "Other", "Miss log")
local on_miss_colour = ui.new_color_picker("Rage", "Other", "Miss log", 255, 253, 166, 255)
local on_damage_enable = ui.new_checkbox("Rage", "Other", "Damage log")
local on_damage_colour = ui.new_color_picker("Rage", "Other", "Damage log", 100, 149, 237, 255)

local function handle_menu()
	if ui.get(aimbotlog_enable) then
		ui.set_visible(on_fire_enable, true)
		ui.set_visible(on_fire_colour, true)
		ui.set_visible(on_miss_enable, true)
		ui.set_visible(on_miss_colour, true)
		ui.set_visible(on_damage_enable, true)
		ui.set_visible(on_damage_colour, true)
	else
		ui.set_visible(on_fire_enable, false)
		ui.set_visible(on_fire_colour, false)
		ui.set_visible(on_miss_enable, false)
		ui.set_visible(on_miss_colour, false)
		ui.set_visible(on_damage_enable, false)
		ui.set_visible(on_damage_colour, false)
	end
end
handle_menu()
ui.set_callback(aimbotlog_enable, handle_menu)

client.set_event_callback("paint", function()
    notify:listener()
end)

local function on_aim_fire(e)
    if ui.get(aimbotlog_enable) and ui.get(on_fire_enable) and e ~= nil then
    	local r, g, b = ui.get(on_fire_colour)
        local hitgroup_names = { "body", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear" }
        local group = hitgroup_names[e.hitgroup + 1] or "?"
        local tickrate = client.get_cvar("cl_cmdrate") or 64
        local target_name = entity.get_player_name(e.target)
        local ticks = math.floor((e.backtrack * tickrate) + 0.5)
        local flags = {
        e.teleported and 't' or '',
        e.interpolated and 'i' or '',
        e.extrapolated and 'e' or '',
        e.boosted and 'b' or '',
        e.high_priority and 'h' or ''
    	}

        notify.setup_color({ r, g, b })
        notify.add(5, false,
        { 255, 255, 255, "fired at " },
        { r, g, b, string.lower(target_name) },
        { 255, 255, 255, "'s " },
        { r, g, b, group },
        { 255, 255, 255, " for " },
        { r, g, b, e.damage },
        { 255, 255, 255, " damage (" },
        { r, g, b, "hc: " .. string.format("%d", e.hit_chance) },
        { 255, 255, 255, "%, " },
        { r, g, b, "bt: " .. e.backtrack },
        { 255, 255, 255, " (" },
        { r, g, b, ticks .. "tks" },
        { 255, 255, 255, "), " },
        { r, g, b, "flgs: " .. table.concat(flags) },
        { 255, 255, 255, ")" })
    end
end

local function on_player_hurt(e)
	if ui.get(aimbotlog_enable) and ui.get(on_damage_enable) then
    local attacker_id = client.userid_to_entindex(e.attacker)
    if attacker_id == nil then
        return
    end

    if attacker_id ~= entity.get_local_player() then
        return
    end

    local hitgroup_names = { "body", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear" }
    local group = hitgroup_names[e.hitgroup + 1] or "?"
    local target_id = client.userid_to_entindex(e.userid)
    local target_name = entity.get_player_name(target_id)

    local rhp = ""
    if e.health <= 0 then
        rhp = rhp .. " *dead*"
    end

    local r, g, b = ui.get(on_damage_colour)
        notify.setup_color({ r, g, b })
        notify.add(5, false,
        { 255, 255, 255, "hit " },
        { r, g, b, string.lower(target_name) },
        { 255, 255, 255, "'s " },
        { r, g, b, group },
        { 255, 255, 255, " for " },
        { r, g, b, e.dmg_health },
        { 255, 255, 255, " damage (" },
        { r, g, b, e.health .. " remaining" },
        { 255, 255, 255, ")" },
        { 255, 255, 255, rhp })
    end
end

local function on_aim_miss(e)
	if ui.get(aimbotlog_enable) and ui.get(on_miss_enable) and e ~= nil then
	local r, g, b = ui.get(on_miss_colour)
    local hitgroup_names = { "body", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear" }
    local group = hitgroup_names[e.hitgroup + 1] or "?"
    local target_name = entity.get_player_name(e.target)
    local reason
    if e.reason == "?" then
    	reason = "resolver"
    else
    	reason = e.reason
    end

        notify.setup_color({ r, g, b })
        notify.add(5, false,
        { 255, 255, 255, "missed " },
        { r, g, b, string.lower(target_name) },
        { 255, 255, 255, "'s " },
        { r, g, b, group },
        { 255, 255, 255, " due to " },
        { r, g, b, reason })
    end
end

client.set_event_callback('aim_fire', on_aim_fire)
client.set_event_callback('player_hurt', on_player_hurt)
client.set_event_callback('aim_miss', on_aim_miss)
---for any question pls contect BaKa
local ffi = require("ffi")
ffi.cdef[[
typedef void***(__thiscall* FindHudElement_t)(void*, const char*);
typedef void(__cdecl* ChatPrintf_t)(void*, int, int, const char*, ...);
]]

local signature_gHud = "\xB9\xCC\xCC\xCC\xCC\x88\x46\x09"
local signature_FindElement = "\x55\x8B\xEC\x53\x8B\x5D\x08\x56\x57\x8B\xF9\x33\xF6\x39\x77\x28"

local match = client.find_signature("client_panorama.dll", signature_gHud) or error("sig1 not found")
local hud = ffi.cast("void**", ffi.cast("char*", match) + 1)[0] or error("hud is nil")

match = client.find_signature("client_panorama.dll", signature_FindElement) or error("FindHudElement not found")
local find_hud_element = ffi.cast("FindHudElement_t", match)
local hudchat = find_hud_element(hud, "CHudChat") or error("CHudChat not found")

local chudchat_vtbl = hudchat[0] or error("CHudChat instance vtable is nil")
local print_to_chat = ffi.cast("ChatPrintf_t", chudchat_vtbl[27])
local function print_chat(text)
	print_to_chat(hudchat, 0, 0, text)
end
local misses = ui.new_checkbox("Rage", "Other", "[Console&Chat] Aimbot Log Misses")
local hits = ui.new_checkbox("Rage", "Other", "[Console&Chat] Aimbot Log Hits")
local function on_aim_hit(e)
	if ui.get(hits) then

    local hitgroup_names = { "身体", "头部", "胸部", "肚子", "胳膊", "胳膊", "脚", "腿", "脖子", "?", "gear" }
        local group = hitgroup_names[e.hitgroup + 1] or "?"

        local target_name = entity.get_player_name(e.target)
        local entityHealth = entity.get_prop(e.target, "m_iHealth")
        print_chat(" \x01[\x01Game\04Sense\x01] " .. "\x01命中\x04 " .. string.lower(target_name) .. "\x01 的 \x04" .. group .. "\x01 造成了 \x04" .. e.damage .. "\x01 伤害 命中率: \x04" .. string.format("%d", e.hit_chance) .. "%")
        client.color_log(255,255,255,"[\0")
        client.color_log(255,255,255," Game\0")
        client.color_log(100,255,100,"Sense\0")
        client.color_log(255,255,255," ]\0")
        client.color_log(255,255,255," 命中 \0")
        client.color_log(0,255,0,string.lower(target_name).."\0")
        client.color_log(255,255,255," 的 \0")
        client.color_log(0,255,0,group.."\0")
        client.color_log(255,255,255," 造成了\0")
        client.color_log(0,255,0,e.damage.."\0")
        client.color_log(255,255,255," 伤害 命中率：\0")
        client.color_log(0,255,0,e.hit_chance)
    end
end

local function on_aim_miss(e)
	if ui.get(misses) and e ~= nil then

    local hitgroup_names = { "身体", "头部", "胸部", "肚子", "胳膊", "胳膊", "脚", "腿", "脖子", "?", "gear" }
    local group = hitgroup_names[e.hitgroup + 1] or "?"
    local target_name = entity.get_player_name(e.target)
    local reason
	local entityHealth = entity.get_prop(e.target, "m_iHealth")
	if (entityHealth == nil) or (entityHealth <= 0) then
		client.log("The player was killed prior to your shot being able to land")
	return
	end

    if e.reason == "?" then
    reason = "解析"
    elseif e.reason == "spread" then
        reason = "扩散"
    elseif e.reason == "prediction error" then
        reason = "预判错误"
    elseif e.reason == "unregistered shot" then
        reason = "未注册镜头"
    elseif e.reason == "death" then
        reason = "死亡"
    else
        reason = e.reason
    end
	
        print_chat("\x01[\x01Game\04Sense\x01] " .. "\x01空了 \x02" .. string.lower(target_name) .. "\x01 的 " .. " \x02" .. group .. "\x01 原因： \x02" .. reason.."\x01 命中率: \x02" .. string.format("%d", e.hit_chance) .. "%")
        client.color_log(255,255,255,"[\0")
        client.color_log(255,255,255," Game\0")
        client.color_log(100,255,100,"Sense\0")
        client.color_log(255,255,255," ]\0")
        client.color_log(255,255,255," 空了 \0")
        client.color_log(255,0,0,string.lower(target_name).."\0")
        client.color_log(255,255,255," 的 \0")
        client.color_log(255,0,0,group.."\0")
        client.color_log(255,255,255," 原因：\0")
        client.color_log(255,0,0,reason.."\0")
        client.color_log(255,255,255," 命中率：\0")
        client.color_log(255,0,0,e.hit_chance)
    end
end


client.set_event_callback('aim_hit', on_aim_hit)
client.set_event_callback('aim_miss', on_aim_miss)
ui.new_label("Rage","other","-------------------------------------")