

local fakelag_enabled = ui.new_checkbox("AA", "Fake lag", "Enabled YuDi.Lua Fakelag")
local amount_mode = ui.new_combobox("AA", "Fake lag", "Fakelag Amount", "Dynamic", "Maximum", "Fluctuate")
local variance_slider = ui.new_slider("AA", "Fake lag", "Fakelag Variance", 0, 100, 0, true, "%")
local fakelag_limit = ui.new_slider("AA", "Fake lag", " Fakelag Limit", 1, 16, 13, true)
local fakelag_fluctuate_limit = ui.new_slider("AA", "Fake lag", " Fakelag Fluctuate Limit", 1, 16, 1, true)
local variance_mode = ui.new_combobox("AA", "Fake lag", "Fakelag Variance Types", "Random", "Fluctuate")
local fakelag_slider_trigger = ui.new_multiselect("AA", "Fake lag", "Fakelag Limit Trigger", {"Avoid Aerial Limit", "Avoid Fired Limit", "Avoid Wall Peek", "Avoid Visible Peek"})
local trigger_aerial_limit = ui.new_slider("AA", "Fake lag", " Aerial Limit[In Air]", 1, 16, 13, true)
local trigger_fired_limit = ui.new_slider("AA", "Fake lag", " Fired Limit[Shooting]", 1, 16, 1, true)
local trigger_wall_limit = ui.new_slider("AA", "Fake lag", " Peek Limit[Avoid Wall]", 1, 16, 13, true)
local trigger_visible_limit = ui.new_slider("AA", "Fake lag", " Peek Limit[Avoid Visible]", 1, 16, 13, true)
local fakelag_trigger_types = ui.new_combobox("AA", "Fake lag", "Fakelag Trigger Types", "Fakelag Limit Trigger", "Fakelag Send Packet Trigger")
local fakelag_send_packet_trigger = ui.new_multiselect("AA", "Fake lag", "Fakelag Triggers Settings", {"On Standing", "While Moving", "On Duck", "On High Speed", "On Jump", "On Exploit", "On Use", "On Freezetime", "Weapon Switch", "Weapon Reload", "Weapon Fired", "On Land", "While Climbing Ladder"})
local fakelag_limit_trigger_limit = ui.new_slider("AA", "Fake lag", " Fakelag Limit Trigger UnSelect Flags Limit", 1, 16, 3, true)
local lagcomp_break = ui.new_checkbox("AA", "Fake lag", "Fakelag Break Lag Compstation")

local limit = ui.reference("AA", "Fake lag", "Limit")
local amount = ui.reference("AA", "Fake lag", "Amount")
local variance = ui.reference("AA", "Fake lag", "Variance")
local ref_pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch")
local ref_fakeduck = ui.reference("RAGE", "Other", "Duck peek assist")
local ref_yawbase = ui.reference("AA", "Anti-aimbot angles", "Yaw base")
local slow_walk, slow_hotkey =  ui.reference("AA", "Other", "Slow motion")
local ref_yaw, ref_yawslider = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local on_shot, on_shot_hotkey = ui.reference("AA", "Other", "On shot anti-aim")
local fake_yaw_limit =  ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local double_tap, double_tap_hotkey = ui.reference("RAGE", "Other", "Double tap")
local ref_jitter, ref_jitterslider = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")
local bodyyaw, bodyyaw_slider = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local lower_body =  ui.reference("AA", "Anti-aimbot angles", "Lower body yaw target")
local fakelag_urmaxprocess = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks")
local freestanding_bodyyaw =  ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")

local directionadd = 0
local desyncside = LEFT
local noenemies = false
local LEFT, RIGHT = 1, 2
local aadirection = "LEFT"
local stored_target = false
local aadirection = "BACK"
local flags_on_land = false
local YDL_State = "YDL-Default"
local YDL_weapon_visible = false
local last_manual_presstime = 0
local trigger_send_packet = true

local lag_info = {
    current_phase = 1,
    prev_choked = 15
}

local lag_shit = {{
    variance = 0,
    limit = 13,
    break_lagcomp = true,
    amount = "Dynamic"
},

{
    variance = 0,
    limit = 13,
    break_lagcomp = false,
    amount = "Dynamic"
}}


local weapons_disabled = {
    "CKnife",
    "CWeaponTaser",
    "CC4",
    "CHEGrenade",
    "CSmokeGrenade",
    "CMolotovGrenade",
    "CSensorGrenade",
    "CFlashbang",
    "CDecoyGrenade",
    "CIncendiaryGrenade"
}

local cache = { }
local data = {
    threshold = false,
    stored_last_shot = 0,
    stored_item = 0
}

local function multi_select(tab, val, sys)
	for index, value in ipairs(tab) do
		if sys == 1 and index == val then
			return true
		elseif value == val then
			return true
		end
	end
		return false
end


local function vec_3(_x, _y, _z)
	return { x = _x or 0, y = _y or 0, z = _z or 0 }
end

local function ticks_to_time(ticks)
	return globals.tickinterval() * ticks
end

local function player_will_peek(e)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) then
		return
	end

	local enemies = entity.get_players(true)
	if not enemies then
		return false
	end

	local eye_position = vec_3(client.eye_position())
	local velocity_prop_local = vec_3( entity.get_prop(entity.get_local_player(), "m_vecVelocity"))
	local predicted_eye_position = vec_3( eye_position.x + velocity_prop_local.x * ticks_to_time(16), eye_position.y + velocity_prop_local.y * ticks_to_time(16), eye_position.z + velocity_prop_local.z * ticks_to_time(16))

	for i = 1, #enemies do
		local player = enemies[i]
		local velocity_prop = vec_3(entity.get_prop(player, "m_vecVelocity"))
		local origin = vec_3(entity.get_prop(player, "m_vecOrigin"))
		local predicted_origin = vec_3(origin.x + velocity_prop.x * ticks_to_time(16), origin.y + velocity_prop.y * ticks_to_time(16), origin.z + velocity_prop.z * ticks_to_time(16))
		entity.get_prop(player, "m_vecOrigin", predicted_origin)
		local head_origin = vec_3(entity.hitbox_position(player, 0))
		local predicted_head_origin = vec_3( head_origin.x + velocity_prop.x * ticks_to_time(16), head_origin.y + velocity_prop.y * ticks_to_time(16), head_origin.z + velocity_prop.z * ticks_to_time(16))
		local trace_entity, damage = client.trace_bullet( entity.get_local_player(), predicted_eye_position.x, predicted_eye_position.y, predicted_eye_position.z, predicted_head_origin.x, predicted_head_origin.y, predicted_head_origin.z)
		entity.get_prop(player, "m_vecOrigin", origin)

		if damage > 0 then
			return true
		end
	end

	return false
end


local function vec2_distance(f_x, f_y, t_x, t_y)
	local delta_x, delta_y = f_x - t_x, f_y - t_y
	return math.sqrt(delta_x*delta_x + delta_y*delta_y)
end

local function get_all_player_positions(ctx, screen_width, screen_height, enemies_only)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) then
		return
	end

	local player_indexes = {}
	local player_positions = {}
	local players = entity.get_players(enemies_only)

	if #players == 0 then
		return
	end

	for i=1, #players do
		local player = players[i]
		local px, py, pz = entity.get_prop(player, "m_vecOrigin")
		local vz = entity.get_prop(player, "m_vecViewOffset[2]")
		if pz ~= nil and vz ~= nil then
		pz = pz + (vz*0.5)

		local sx, sy = client.world_to_screen(ctx, px, py, pz)
			if sx ~= nil and sy ~= nil then
				if sx >= 0 and sx <= screen_width and sy >= 0 and sy <= screen_height then 
					player_indexes[#player_indexes+1] = player
					player_positions[#player_positions+1] = {sx, sy}
				end
			end
		end
	end
		return player_indexes, player_positions
	end

local function check_fov(ctx)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) then
		return
	end

	local screen_width, screen_height = client.screen_size()
	local screen_center_x, screen_center_y = screen_width*0.5, screen_height*0.5
	local fov_limit = 250
	
	if get_all_player_positions(ctx, screen_width, screen_height, true) == nil then
		return
	end

	local enemy_indexes, enemy_coords = get_all_player_positions(ctx, screen_width, screen_height, true)
	if #enemy_indexes <= 0 then
		return true
	end

	if #enemy_coords == 0 then
		return true
	end

	local closest_fov = 133337
	local closest_entindex = 133337

	for i=1, #enemy_coords do
		local x = enemy_coords[i][1]
		local y = enemy_coords[i][2]
		local current_fov = vec2_distance(x, y, screen_center_x, screen_center_y)

		if current_fov < closest_fov then
			closest_fov = current_fov -- found a target that is closer to center of our screen
			closest_entindex = enemy_indexes[i]
		end
	end
		return closest_fov > fov_limit, closest_entindex
	end

local function can_see(ent)	
	for i=0, 18 do
		if client.visible(entity.hitbox_position(ent, i)) then
			return true
		end
	end
		return false
	end

local function YDL_visible_enemy(ctx)
	local local_entindex = entity.get_local_player()
	if entity.get_prop(local_entindex, "m_lifeState") ~= 0 then	
		YDL_weapon_visible = false
		return
	end
	
	local enemy_visible, enemy_entindex = check_fov(ctx)
	if enemy_entindex == nil then
		return
	end
	
	if enemy_visible and enemy_entindex ~= nil and stored_target ~= enemy_entindex then
		stored_target = enemy_entindex
	end

	local visible = can_see(enemy_entindex)
	if visible then
		YDL_weapon_visible = true
	else
		YDL_weapon_visible = false
	end

	stored_target = enemy_entindex
	local enemy_player_number = entity.get_players(true)
end

client.set_event_callback("paint",YDL_visible_enemy)

client.set_event_callback("weapon_fire", function(e)
	local localplayer = entity.get_local_player()
	if not localplayer or not entity.is_alive(localplayer) or not client.userid_to_entindex(e.userid) == localplayer then
		return
	end

	flags_weapon_reload = true
	client.delay_call(0.45, function(reload)
		flags_weapon_reload = false
	end)
end)


local function status_lagshift(e)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(fakelag_enabled) then
		return
	end

	ui.set(fakelag_urmaxprocess, 18)
	local player_move_type = entity.get_prop(local_player, "m_movetype")
	local flags_status = entity.get_prop(local_player, "m_fFlags")
	local flags_climbing_adder = player_move_type == 9
	local can_fire_wall = player_will_peek()

	if ui.get(amount_mode) == "Dynamic" then
		lag_new_amo = "Dynamic"
		lag_get_limit = - ui.get(variance_slider) * 0.01
		lag_variance_limit = - lag_get_limit * ui.get(fakelag_limit)
		lag_variance_fixer = lag_variance_limit <= 0 and lag_variance_limit or lag_variance_limit
		lag_variance_status = ui.get(variance_mode) == "Random" and math.random(ui.get(fakelag_limit) - lag_variance_fixer, ui.get(fakelag_limit)) or ui.get(fakelag_limit) - ui.get(variance_slider) * 0.01 * ui.get(fakelag_limit)
		lag_first_limit = lag_variance_status
		lag_two_limit = ui.get(fakelag_limit)
	elseif ui.get(amount_mode) == "Maximum" then
		lag_new_amo = "Maximum"
		lag_get_limit = - ui.get(variance_slider) * 0.01
		lag_variance_limit = - lag_get_limit * ui.get(fakelag_limit)
		lag_variance_fixer = lag_variance_limit <= 0 and lag_variance_limit or lag_variance_limit
		lag_variance_status = ui.get(variance_mode) == "Random" and math.random(ui.get(fakelag_limit) - lag_variance_fixer, ui.get(fakelag_limit)) or ui.get(fakelag_limit) - ui.get(variance_slider) * 0.01 * ui.get(fakelag_limit)
		lag_first_limit = lag_variance_status
		lag_two_limit = ui.get(fakelag_limit)
	elseif ui.get(amount_mode) == "Fluctuate" then
		lag_new_amo = "Fluctuate"
		lag_get_limit = - ui.get(variance_slider) * 0.01
		lag_variance_limit = - lag_get_limit * ui.get(fakelag_limit)
		lag_variance_fixer = lag_variance_limit <= 0 and lag_variance_limit or lag_variance_limit
		lag_variance_status = ui.get(variance_mode) == "Random" and math.random(ui.get(fakelag_limit) - lag_variance_fixer, ui.get(fakelag_limit)) or ui.get(fakelag_limit) - ui.get(variance_slider) * 0.01 * ui.get(fakelag_limit)
		lag_first_limit = lag_variance_status
		lag_two_limit = ui.get(fakelag_fluctuate_limit)
	end

	if multi_select(ui.get(fakelag_slider_trigger), "Avoid Wall Peek") and can_fire_wall == true and YDL_weapon_visible == false then
		lag_first_limit = ui.get(amount_mode) == "Fluctuate" and ui.get(fakelag_fluctuate_limit) or ui.get(trigger_wall_limit)
		lag_two_limit = ui.get(trigger_wall_limit)
	else
		lag_first_limit = lag_first_limit < 1 and 1 or lag_first_limit
		lag_two_limit = lag_two_limit < 1 and 1 or lag_two_limit
	end

	if multi_select(ui.get(fakelag_slider_trigger), "Avoid Visible Peek") and YDL_weapon_visible == true then
		lag_first_limit = ui.get(amount_mode) == "Fluctuate" and ui.get(fakelag_fluctuate_limit) or ui.get(trigger_visible_limit)
		lag_two_limit = ui.get(trigger_visible_limit)
	else
		lag_first_limit = lag_first_limit < 1 and 1 or lag_first_limit
		lag_two_limit = lag_two_limit < 1 and 1 or lag_two_limit
	end

	if multi_select(ui.get(fakelag_slider_trigger), "Avoid Aerial Limit") and flags_status == 256 and not flags_climbing_adder then
		lag_first_limit = ui.get(amount_mode) == "Fluctuate" and ui.get(fakelag_fluctuate_limit) or ui.get(trigger_aerial_limit)
		lag_two_limit = ui.get(trigger_aerial_limit)
	else
		lag_first_limit = lag_first_limit < 1 and 1 or lag_first_limit
		lag_two_limit = lag_two_limit < 1 and 1 or lag_two_limit
	end

	lag_shit ={{
		variance = 0,
		limit = lag_first_limit,
		break_lagcomp = true,
		amount = lag_new_amo
	},
	{
		variance = 0,
		limit = lag_two_limit,
		break_lagcomp = false,
		amount = lag_new_amo
	}}
end

client.set_event_callback("setup_command", status_lagshift)

client.set_event_callback("setup_command", function(cmd)
	local localplayer = entity.get_local_player()
	if not localplayer or not entity.is_alive(localplayer) or not ui.get(fakelag_enabled) then
		return
	end

	local flags_weapon_switch = cmd.weaponselect
	local flags_on_use = cmd.in_use
	local trigger_choked = cmd.chokedcommands
	local vx, vy, vz = entity.get_prop(localplayer, "m_vecVelocity")
	local velocity_speed = math.sqrt((vx * vx) + (vy * vy))
	local onground = (bit.band(entity.get_prop(localplayer, "m_fFlags"), 1) == 1)
	local infiniteduck = (bit.band(entity.get_prop(localplayer, "m_fFlags"), 2) == 2)
	local slowwalking = ui.get(slow_walk) and ui.get(slow_hotkey)
	local exploit = ui.get(on_shot) and ui.get(on_shot_hotkey) or ui.get(double_tap) and ui.get(double_tap_hotkey) or ui.get(ref_fakeduck)
	local weapons = entity.get_player_weapon(localplayer)
	local next_attack = entity.get_prop(weapons, "m_flNextPrimaryAttack")
	local tickbase_shift = entity.get_prop(localplayer, "m_nTickBase")
	local fired_shoot = next_attack <= tickbase_shift * globals.tickinterval() - 0.12
	local in_freeze_time = entity.get_prop(entity.get_game_rules(), "m_bFreezePeriod") == 1
	local player_move_type = entity.get_prop(localplayer, "m_movetype")
	local flags_climbing_adder = player_move_type == 9

	local flags_on_land = false
	if not onground then
		client.delay_call(0.75, function(land)
			flags_on_land = true
		end)

		client.delay_call(0.9, function(land)
			flags_on_land = false
		end)
	end

	if velocity_speed < 5 and not slowwalking and onground and not infiniteduck and velocity_speed < 190 and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then 
		YDL_State = "YDL-Default"
	elseif velocity_speed > 2 and not slowwalking and onground and not infiniteduck and velocity_speed < 190 and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		YDL_State = "YDL-Running"
	elseif velocity_speed > 2 and slowwalking and onground and not infiniteduck and velocity_speed < 190 and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		YDL_State = "YDL-Slow Motion"
	elseif velocity_speed > 190 and onground and not infiniteduck and not exploit and fired_shoot == true and flags_on_use == 0 and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		YDL_State = "YDL-High Speed"
	elseif not onground and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		YDL_State = "YDL-Air"
	elseif infiniteduck and velocity_speed < 190 and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		YDL_State = "YDL-Crouching"
	elseif exploit and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and not flags_climbing_adder then
		YDL_State = "YDL-Exploit"
	elseif flags_on_use == 1 and fired_shoot == true and not in_freeze_time and flags_weapon_switch <= 0 and not flags_climbing_adder then
		YDL_State = "YDL-In Use"
	elseif fired_shoot == false and not in_freeze_time and flags_weapon_switch <= 0 and flags_weapon_reload == true and not flags_climbing_adder then
		YDL_State = "YDL-Fired"
	elseif flags_weapon_switch >= 0.001 and not in_freeze_time and onground and flags_on_land == false and not flags_climbing_adder then
		YDL_State = "YDL-Weapon Switch"
	elseif fired_shoot == false and flags_weapon_reload == false and onground and not in_freeze_time and flags_on_land == false and flags_weapon_switch <= 0 and not flags_climbing_adder then
		YDL_State = "YDL-Weapon Reload"
	elseif flags_on_land == true and flags_weapon_switch <= 0 and not in_freeze_time and fired_shoot == false and not flags_climbing_adder then
		YDL_State = "YDL-On Land"
	elseif flags_climbing_adder and not in_freeze_time then
		YDL_State = "YDL-Climbing Ldder"
	elseif in_freeze_time then
		YDL_State = "YDL-Freeze Time"
	end

	local trigger_always_packet = true
	local trigger_send_packet = true
	if multi_select(ui.get(fakelag_send_packet_trigger), "On Standing") and YDL_State == "YDL-Default" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "While Moving") and YDL_State == "YDL-Running" or multi_select(ui.get(fakelag_send_packet_trigger), "While Moving") and YDL_State == "YDL-Slow Motion" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "On Duck") and YDL_State == "YDL-Crouching" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "On High Speed") and YDL_State == "YDL-High Speed" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "On Jump") and YDL_State == "YDL-Air" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "On Exploit") and YDL_State == "YDL-Exploit" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "Weapon Fired") and YDL_State == "YDL-Fired" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "On Use") and YDL_State == "YDL-In Use" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "On Freezetime") and YDL_State == "YDL-Freeze Time" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "Weapon Switch") and YDL_State == "YDL-Weapon Switch" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "Weapon Reload") and YDL_State == "YDL-Weapon Reload" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "On Land") and YDL_State == "YDL-On Land" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if multi_select(ui.get(fakelag_send_packet_trigger), "While Climbing Ladder") and YDL_State == "YDL-Climbing Ldder" then
		trigger_send_packet = trigger_choked >= ui.get(limit)
		trigger_always_packet = false
	end

	if ui.get(fakelag_trigger_types) == "Fakelag Limit Trigger" then
		cmd.allow_send_packet = false
		fakelag_limit_trigget_status = trigger_always_packet == true and ui.get(fakelag_limit_trigger_limit) or lag_shit[lag_info.current_phase].limit
	elseif ui.get(fakelag_trigger_types) == "Fakelag Send Packet Trigger" then
		cmd.allow_send_packet = ui.get(amount_mode) == "Fluctuate" and false or trigger_send_packet
		fakelag_limit_trigget_status = lag_shit[lag_info.current_phase].limit
	end

end)


local function choke_cycle(cmd)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) then
		return
	end

	if cmd.chokedcommands < lag_info.prev_choked then
		lag_info.current_phase = lag_info.current_phase + 1
		if lag_info.current_phase > #lag_shit then
			lag_info.current_phase = 1
		end
	end

	if ui.get(fakelag_enabled) then
		ui.set(amount, ui.get(ref_fakeduck) and "Maximum" or lag_shit[lag_info.current_phase].amount)
		ui.set(variance, ui.get(ref_fakeduck) and 0 or lag_shit[lag_info.current_phase].variance)
		ui.set(limit, ui.get(ref_fakeduck) and 15 or fakelag_limit_trigget_status)
	end

	ui.set(lagcomp_break, lag_shit[lag_info.current_phase].break_lagcomp)
	lag_info.prev_choked = cmd.chokedcommands
end

client.set_event_callback("setup_command",choke_cycle)

local set_cache = function(self)
	local localplayer = entity.get_local_player()
	local weapon = entity.get_player_weapon(localplayer)
	local player_move_type = entity.get_prop(localplayer, "m_movetype")
	local flags_status = entity.get_prop(localplayer, "m_fFlags")
	local flags_climbing_adder = player_move_type == 9
	local aerial_flags = not flags_climbing_adder and flags_status == 256
	if not localplayer or not entity.is_alive(localplayer) or not ui.get(fakelag_enabled) or ui.get(ref_fakeduck) or weapon == nil or multi_select(weapons_disabled, entity.get_classname(weapon)) or not multi_select(ui.get(fakelag_slider_trigger), "Avoid Fired Limit") or aerial_flags then
		return
	end

	local process = function(name, condition, should_call, VAR)
	local hotkey_modes = {
		[0] = "always on",
		[1] = "on hotkey",
		[2] = "toggle",
		[3] = "off hotkey"
	}

	local _cond = ui.get(condition)
	local _type = type(_cond)

	local value, mode = ui.get(condition)
	local finder = mode ~= nil and mode or (_type == "boolean" and tostring(_cond) or _cond)
	cache[name] = cache[name] ~= nil and cache[name] or finder

	if should_call then ui.set(condition, mode ~= nil and hotkey_modes[VAR] or VAR) else
		if cache[name] ~= nil then
			local _cache = cache[name]
			if _type == "boolean" then
				if _cache == "true" then 
					_cache = true 
				end

				if _cache == "false" then 
					_cache = false 
				end
			end
    
				ui.set(condition, mode ~= nil and hotkey_modes[_cache] or _cache)
				cache[name] = nil
			end
		end
	end

	process("limit", limit, (self == nil and false or self), ui.get(trigger_fired_limit))
end

client.set_event_callback("shutdown", set_cache)

client.set_event_callback("setup_command", function(cmd)
	local localplayer = entity.get_local_player()
	local weapon = entity.get_player_weapon(localplayer)
	local player_move_type = entity.get_prop(localplayer, "m_movetype")
	local flags_status = entity.get_prop(localplayer, "m_fFlags")
	local flags_climbing_adder = player_move_type == 9
	local aerial_flags = not flags_climbing_adder and flags_status == 256
	if not localplayer or not entity.is_alive(localplayer) or not ui.get(fakelag_enabled) or ui.get(ref_fakeduck) or weapon == nil or multi_select(weapons_disabled, entity.get_classname(weapon)) or not multi_select(ui.get(fakelag_slider_trigger), "Avoid Fired Limit") or aerial_flags then
		return
	end

	local last_shot_time = entity.get_prop(weapon, "m_fLastShotTime")
	local m_iItem = bit.band(entity.get_prop(weapon, "m_iItemDefinitionIndex"), 0xFFFF)
	local limitation = function(cmd)
	local in_accel = function()
		local localplayer = entity.get_local_player()
		local x, y = entity.get_prop(localplayer, "m_vecVelocity")
		return math.sqrt(x^2 + y^2) ~= 0
	end

	local max_commands = in_accel() and 1 or 2
	if not data.threshold and last_shot_time ~= data.stored_last_shot then
		data.stored_last_shot = last_shot_time
		if not onshot_mode then
			data.threshold = true
		end

		return true
	end

	if data.threshold and cmd.chokedcommands >= max_commands then
		data.threshold = false
		return true
	end
		return false
	end
    
	if data.stored_item ~= m_iItem then
		data.stored_last_shot = last_shot_time
		data.stored_item = m_iItem
	end

	set_cache(limitation(cmd))
end)

client.set_event_callback("paint",function(e)
	ui.set_visible(lagcomp_break, false)
	ui.set_visible(fakelag_limit, ui.get(fakelag_enabled))
	ui.set_visible(variance_slider, ui.get(fakelag_enabled))
	ui.set_visible(amount_mode, ui.get(fakelag_enabled))
	ui.set_visible(variance_mode, ui.get(fakelag_enabled))
	ui.set_visible(fakelag_slider_trigger, ui.get(fakelag_enabled))
	ui.set_visible(fakelag_trigger_types, ui.get(fakelag_enabled))
	ui.set_visible(fakelag_send_packet_trigger, ui.get(fakelag_enabled))
	ui.set_visible(fakelag_fluctuate_limit, ui.get(fakelag_enabled) and ui.get(amount_mode) == "Fluctuate" )
	ui.set_visible(trigger_wall_limit, ui.get(fakelag_enabled) and multi_select(ui.get(fakelag_slider_trigger), "Avoid Wall Peek"))
	ui.set_visible(trigger_fired_limit, ui.get(fakelag_enabled) and multi_select(ui.get(fakelag_slider_trigger), "Avoid Fired Limit"))
	ui.set_visible(trigger_aerial_limit, ui.get(fakelag_enabled) and multi_select(ui.get(fakelag_slider_trigger), "Avoid Aerial Limit"))
	ui.set_visible(trigger_visible_limit, ui.get(fakelag_enabled) and multi_select(ui.get(fakelag_slider_trigger), "Avoid Visible Peek"))
	ui.set_visible(fakelag_limit_trigger_limit, ui.get(fakelag_enabled) and ui.get(fakelag_trigger_types) == "Fakelag Limit Trigger")
end)