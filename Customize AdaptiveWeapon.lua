target_select = ui.reference("RAGE", "Aimbot", "Target selection")
target_hitbox_ref = ui.reference("RAGE", "Aimbot", "Target hitbox")
multi_hitbox, multi_hotkey, multi_modes = ui.reference("RAGE", "Aimbot", "Multi-point")
multi_scale = ui.reference("RAGE", "Aimbot", "Multi-point scale")
prefer_safe = ui.reference("RAGE", "Aimbot", "Prefer safe point")
force_safe = ui.reference("RAGE", "Aimbot", "Force safe point")
force_safe_limbs = ui.reference("RAGE", "Aimbot", "Force safe point on limbs")
min_htc = ui.reference("RAGE", "Aimbot", "Minimum hit chance")
min_dmg = ui.reference("RAGE", "Aimbot", "Minimum damage")
auto_scope = ui.reference("RAGE", "Aimbot", "Automatic scope")
low_fps = ui.reference("RAGE", "Aimbot", "Low FPS mitigations")
delay_shot = ui.reference("RAGE", "Other", "Delay shot")
accuracy_mode = ui.reference("RAGE", "Other", "Accuracy boost")
quick_stop = ui.reference("RAGE", "Other", "Quick stop")
quick_mode = ui.reference("RAGE", "Other", "Quick stop options")
prefer_baim = ui.reference("RAGE", "Other", "Prefer body aim")
prefer_baim_disabled = ui.reference("RAGE", "Other", "Prefer body aim disablers")
double_check, double_key = ui.reference("RAGE", "Other", "Double tap")
double_tap_htc = ui.reference("RAGE", "Other", "Double tap hit chance")
double_tap_stop = ui.reference("RAGE", "Other", "Double tap quick stop")
ref_plist = ui.reference("PLAYERS", "Players", "Player list")
slow_walk, slow_key = ui.reference("AA", "Other", "Slow motion")
ref_pref_baim = ui.reference("PLAYERS", "Adjustments", "Override prefer body aim")
ref_pref_safe = ui.reference("PLAYERS", "Adjustments", "Override safe point")

local options = ui.new_multiselect("Lua", 'A' , "[Lua]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on")
local headaim_options = ui.new_multiselect("Lua", 'A' , "[Lua]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync")
local force_options = ui.new_multiselect("Lua", 'A' , "[Lua]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss")
local safe_options = ui.new_multiselect("Lua", 'A' , "[Lua]Force Safe", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss")
local indicator = ui.new_checkbox("Lua", 'A',"Indicator")
local reset_misses = ui.new_checkbox("Lua", 'A' , "Automatically reset misses")
local predictive_baim = ui.new_checkbox("Lua", 'A' , "Predictive Body Aim")
local ref_desync = ui.new_slider("Lua", 'A' , "Desync limit",290,580,290,true,"°",0.1)
local range_slider = ui.new_slider("Lua", 'A' , "Range",1,70,30,true,"°")
local jitter_sensitivity = ui.new_slider("Lua", 'A' , "Jitter Sensitivity",1,10,6,true)
local ref_hp_slider = ui.new_slider("Lua", 'A' , "HP",1,100)
local safety_condition = ui.new_slider("Lua", 'A' , "Safety Ammount",1,2)
local reset_hotkey = ui.new_hotkey("Lua", 'A' , "Reset enemy")
local force_hotkey = ui.new_hotkey("Lua", 'A' , "Force body aim nearest")

local syr_active = ui.new_checkbox("Lua", 'A', "YuDi.Lua - Enabled Adaptive Weapons")
local weapon_indicator = ui.new_multiselect("Lua", 'A', "SYR Weapon Indicators", "Active Weapon", "Min Damage","Damage Override","Hitbox Override","Hitchance Override","Distance","D & H")
local global_color_label = ui.new_label("Lua", 'A', "Global Indicators Color")
local global_c = ui.new_color_picker("Lua", 'A', "Global Color c", 0, 255, 255, 255)
local sync_change = ui.new_checkbox("Lua", 'A', "Enabled Change Select On Weapon Switch")
local disabled_scope_hitchance = ui.new_multiselect("Lua", 'A', "Scope Hitchance Disabled","Auto","AWP", "Scout", "Pistol", "Rifle", "SMG", "R8 Revolver", "Eagle", "Heavy", "Other", "Taser Zeus")
local weapons_acitve_visible = ui.new_combobox("Lua", 'A', "Weapons Selection","Auto","AWP", "Scout", "Pistol", "Rifle", "SMG", "R8 Revolver", "Eagle", "Heavy", "Other", "Taser Zeus")
local override_damage_key = ui.new_hotkey("Lua", 'A', "Override Damage Hotkey", false)
local override_hitbox_key = ui.new_hotkey("Lua", 'A', "Override Hitbox Hotkey", false)
local override_hitchance_key = ui.new_hotkey("Lua", 'A', "Override Hitchance Hotkey", false)
local high_priority_dager = ui.new_checkbox("Lua", 'A', "Prefer Attack Dangerous Targets")

require("bit")
ui.set(override_damage_key,"Toggle")
ui.set(override_hitbox_key,"Toggle")
ui.set(override_hitchance_key,"Toggle")
ui.set_visible(options,false)
ui.set_visible(headaim_options,false)
ui.set_visible(force_options,false)
ui.set_visible(safe_options,false)
ui.set_visible(indicator,false)
ui.set_visible(reset_misses,false)
ui.set_visible(predictive_baim,false)
ui.set_visible(ref_desync,false)
ui.set_visible(range_slider,false)
ui.set_visible(jitter_sensitivity,false)
ui.set_visible(reset_hotkey,false)
ui.set_visible(force_hotkey,false)
ui.set_visible(ref_hp_slider,false)
ui.set_visible(safe_options,false)
ui.set_visible(safety_condition,false)

local function syr_visible_table(val, bool)
	for key, v in pairs(val) do
		ui.set_visible(v, bool)
	end
end

local function multi_select(search_table, search_value)
	for _, table_value in pairs(search_table) do
		if (search_value == table_value) then
			return true
		end
	end

	return false
end

local damage_labels_select = 
	{[0] = "Auto"}
	for i = 1, 126 do
		damage_labels_select[i] = i <= 100 and tostring(i) or "HP+" .. tostring(i - 100)
	end

local syr_weapons = {
    ["Auto"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[Auto]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[Auto]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[Auto]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[Auto]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[Auto]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[Auto]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[Auto]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[Auto]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[Auto]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[Auto]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[Auto]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[Auto]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[Auto]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[Auto]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n Auto MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[Auto]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[Auto]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[Auto]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[Auto]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[Auto]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[Auto]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[Auto]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[Auto]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[Auto]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[Auto]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[Auto]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[Auto]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[Auto]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[Auto]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Auto]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Auto]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[Auto]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[Auto]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Auto]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Auto]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[Auto]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[Auto]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[Auto]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[Auto]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[Auto]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[Auto]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[Auto]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[Auto]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[Auto]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[Auto]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[Auto]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[Auto]<X HP",1,100),
    },

    ["AWP"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[AWP]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[AWP]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[AWP]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[AWP]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[AWP]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[AWP]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[AWP]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[AWP]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[AWP]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[AWP]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[AWP]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[AWP]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[AWP]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[AWP]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n AWP MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[AWP]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[AWP]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[AWP]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[AWP]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[AWP]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[AWP]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[AWP]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[AWP]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[AWP]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[AWP]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[AWP]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[AWP]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[AWP]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[AWP]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[AWP]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[AWP]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[AWP]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[AWP]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[AWP]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[AWP]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[AWP]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[AWP]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[AWP]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[AWP]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[AWP]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[AWP]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[AWP]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[AWP]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[AWP]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[AWP]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[AWP]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[AWP]<X HP",1,100),
    },

    ["Scout"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[Scout]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[Scout]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[Scout]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[Scout]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[Scout]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[Scout]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[Scout]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[Scout]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[Scout]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[Scout]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[Scout]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[Scout]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[Scout]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[Scout]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n Scout MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[Scout]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[Scout]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[Scout]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[Scout]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[Scout]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[Scout]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[Scout]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[Scout]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[Scout]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[Scout]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[Scout]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[Scout]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[Scout]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[Scout]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Scout]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Scout]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[Scout]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[Scout]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Scout]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Scout]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[Scout]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[Scout]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[Scout]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[Scout]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[Scout]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[Scout]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[Scout]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[Scout]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[Scout]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[Scout]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[Scout]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[Scout]<X HP",1,100),
    },

    ["Pistol"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[Pistol]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[Pistol]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[Pistol]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[Pistol]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[Pistol]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[Pistol]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[Pistol]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[Pistol]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[Pistol]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[Pistol]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[Pistol]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[Pistol]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[Pistol]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[Pistol]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n Pistol MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[Pistol]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[Pistol]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[Pistol]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[Pistol]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[Pistol]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[Pistol]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[Pistol]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[Pistol]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[Pistol]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[Pistol]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[Pistol]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[Pistol]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[Pistol]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[Pistol]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Pistol]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Pistol]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[Pistol]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[Pistol]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Pistol]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Pistol]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[Pistol]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[Pistol]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[Pistol]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[Pistol]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[Pistol]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[Pistol]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[Pistol]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[Pistol]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[Pistol]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[Pistol]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[Pistol]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[Pistol]<X HP",1,100),
    },

    ["Rifle"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[Rifle]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[Rifle]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[Rifle]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[Rifle]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[Rifle]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[Rifle]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[Rifle]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[Rifle]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[Rifle]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[Rifle]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[Rifle]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[Rifle]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[Rifle]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[Rifle]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n Rifle MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[Rifle]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[Rifle]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[Rifle]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[Rifle]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[Rifle]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[Rifle]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[Rifle]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[Rifle]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[Rifle]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[Rifle]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[Rifle]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[Rifle]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[Rifle]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[Rifle]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Rifle]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Rifle]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[Rifle]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[Rifle]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Rifle]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Rifle]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[Rifle]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[Rifle]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[Rifle]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[Rifle]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[Rifle]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[Rifle]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[Rifle]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[Rifle]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[Rifle]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[Rifle]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[Rifle]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[Rifle]<X HP",1,100),
    },

    ["SMG"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[SMG]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[SMG]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[SMG]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[SMG]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[SMG]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[SMG]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[SMG]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[SMG]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[SMG]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[SMG]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[SMG]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[SMG]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[SMG]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[SMG]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n SMG MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[SMG]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[SMG]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[SMG]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[SMG]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[SMG]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[SMG]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[SMG]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[SMG]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[SMG]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[SMG]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[SMG]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[SMG]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[SMG]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[SMG]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[SMG]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[SMG]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[SMG]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[SMG]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[SMG]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[SMG]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[SMG]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[SMG]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[SMG]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[SMG]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[SMG]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[SMG]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[SMG]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[SMG]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[SMG]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[SMG]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[SMG]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[SMG]<X HP",1,100),
    },

    ["R8 Revolver"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[R8 Revolver]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[R8 Revolver]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[R8 Revolver]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n R8 Revolver MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[R8 Revolver]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[R8 Revolver]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[R8 Revolver]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[R8 Revolver]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[R8 Revolver]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[R8 Revolver]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[R8 Revolver]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[R8 Revolver]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[R8 Revolver]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[R8 Revolver]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[R8 Revolver]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[R8 Revolver]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[R8 Revolver]<X HP",1,100),
    },


    ["Eagle"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[Eagle]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[Eagle]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[Eagle]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[Eagle]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[Eagle]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[Eagle]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[Eagle]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[Eagle]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[Eagle]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[Eagle]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[Eagle]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[Eagle]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[Eagle]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[Eagle]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n Eagle MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[Eagle]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[Eagle]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[Eagle]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[Eagle]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[Eagle]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[Eagle]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[Eagle]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[Eagle]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[Eagle]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[Eagle]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[Eagle]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[Eagle]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[Eagle]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[Eagle]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Eagle]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Eagle]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[Eagle]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[Eagle]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Eagle]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Eagle]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[Eagle]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[Eagle]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[Eagle]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[Eagle]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[Eagle]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[Eagle]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[Eagle]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[Eagle]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[Eagle]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[Eagle]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[Eagle]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[Eagle]<X HP",1,100),
    },

    ["Heavy"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[Heavy]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[Heavy]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[Heavy]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[Heavy]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[Heavy]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[Heavy]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[Heavy]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[Heavy]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[Heavy]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[Heavy]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[Heavy]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[Heavy]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[Heavy]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[Heavy]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n Heavy MP","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[Heavy]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[Heavy]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[Heavy]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[Heavy]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[Heavy]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[Heavy]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[Heavy]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[Heavy]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[Heavy]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[Heavy]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[Heavy]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[Heavy]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[Heavy]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[Heavy]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Heavy]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Heavy]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[Heavy]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[Heavy]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Heavy]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Heavy]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[Heavy]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[Heavy]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[Heavy]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[Heavy]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[Heavy]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[Heavy]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[Heavy]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[Heavy]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[Heavy]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[Heavy]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[Heavy]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[Heavy]<X HP",1,100),
    },

    ["Other"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[Other]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[Other]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[Other]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[Other]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[Other]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[Other]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[Other]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[Other]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[Other]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[Other]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[Other]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[Other]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[Other]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[Other]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n Other Mp","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[Other]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[Other]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[Other]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[Other]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[Other]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[Other]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[Other]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[Other]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[Other]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[Other]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[Other]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[Other]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[Other]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[Other]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Other]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Other]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[Other]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[Other]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Other]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Other]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[Other]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[Other]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[Other]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[Other]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[Other]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[Other]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[Other]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[Other]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[Other]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[Other]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[Other]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[Other]<X HP",1,100),
    },

    ["Taser Zeus"] = {
        ["target_select"] = ui.new_combobox("Lua", 'A', "[Taser Zeus]Target Selection","Cycle","Cycle (2x)", "Near crosshair", "Highest damage", "Lowest ping", "Best K/D ratio", "Best hit chance" ),
        ["target_hitbox"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["hitbox_override"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Override Hitboxes", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["accuracy_modes"] = ui.new_combobox("Lua", 'A', "[Taser Zeus]Accuracy Boost Mode","Off","Low", "Medium", "High","Maximum"),
        ["forcesafe_limbs"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Force SafePoint On Limbs"),
        ["delay_shot"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Delay Shot"),
        ["auto_scope"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Automatic Scope"),
        ["damage_wall"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Minimum Damage (Autowall)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_visible"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Minimum Damage (Visible)", 0, 126, 20, true, "", 1, damage_labels_select),
        ["damage_override"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Override Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["override_hitchance"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Override Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["noscope_hitchance"] = ui.new_slider("Lua", 'A', "[Taser Zeus]NoScope Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["mp_hitbox"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_modes"] = ui.new_combobox("Lua", 'A', "\n Zues Mp","Low", "Medium", "High"),
        ["dynamic_mp"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Dynamic Nulti-point"),
        ["mp_scale"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Multi-Point Scale", 24, 100, 35, true, "%", 1, {[24] = "Auto"}),
        ["prefer_safe"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Prefer Safe Point"),
        ["force_safe"] = ui.new_combobox("Lua", 'A', "[Taser Zeus]Force Safe Point", "Always on", "On Hotkey", "Toggle", "Off Hotkey"),
        ["prefer_baim"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Prefer Body Aim"),
        ["baim_disable"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Prefer Body Aim Disablers", "Low inaccuracy", "Target shot fired", "Target resolved", "Safe point headshot", "Low damage"),
        ["lua_auto_stop"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Lua - Auto Stop"),
        ["lua_auto_stop_speed"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Lua - Auto Stop Speed", 1, 100, 100, true, "%"),
        ["quick_stop"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Quick Stop"),
        ["stop_select"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Quick Stop Options", "Early", "Slow motion", "Duck", "Fake duck", "Move between shots", "Ignore molotov"),
        ["dt_enabled"] =  ui.new_checkbox("Lua", 'A', "[Taser Zeus]Double Tap"),
        ["dt_hitchance"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Double Tap Hitchance", 0, 100, 50, true, "%", 1),
        ["dt_stop"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Double Tap quick stop", "Slow motion", "Duck", "Move between shots"),
        ["fps_disable"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Low FPS Mitigations", "Force low accuracy boost", "Disable multipoint: feel", "Disable multipoint: arms", "Disable multipoint: legs", "Disable hitbox: feel", "Force low multipoint", "Lower hit chance precision", "Limit targets per tick"),
        ["label_air"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["target_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]In Air Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_air"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]In Air Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_air"] = ui.new_slider("Lua", 'A', "[Taser Zeus]In Air Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_air"] = ui.new_slider("Lua", 'A', "[Taser Zeus]In Air Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["label_air_2"] = ui.new_label("Lua", 'A', "--------------- In Air ---------------"),
        ["label_distance"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["target_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Distance Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["mp_hitbox_distance"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Distance Multi-Point Hitbox", "Head", "Chest", "Stomach", "Arms", "Legs", "Feet"),
        ["damage_distance"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Distance Minimum Damage", 0, 126, 20, true, "", 1, damage_labels_select),
        ["hitchance_distance"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Distance Hitchance", 0, 100, 60, true, "%", 1, {[0] = "Off"}),
        ["enemy_distance"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Override Enemy Distance", 0, 500, 0, true, "M", 1),
        ["label_distance_2"] = ui.new_label("Lua", 'A', "--------------- On Distance ---------------"),
        ["lua_prefer_baim"] = ui.new_multiselect("Lua", 'A', "[Taser Zeus]Prefer Baim","Backwards/Forwards","Moving targets","Slow targets","Shooting","x2 HP","<x HP","Big desync","Walking jitter desync","Always on"),
        ["lua_prefer_head"] = ui.new_multiselect("Lua", 'A' , "[Taser Zeus]Prefer Headshot","Sideways targets","Crouching targets","Fast targets","Shooting","Small desync"),
        ["lua_force_baim"] = ui.new_multiselect("Lua", 'A' , "[Taser Zeus]Force Baim", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_force_safe"] = ui.new_multiselect("Lua", 'A' , "[Taser Zeus]Force Safety", "Backwards/Forwards","Sideways targets","Slow targets","Shooting","x1 HP", "x2 HP","<x HP","Walking jitter desync","1 miss","2 miss"),
        ["lua_prediction_baim"] = ui.new_checkbox("Lua", 'A', "[Taser Zeus]Predictive Body Aim"),
        ["lua_desync_limit"] = ui.new_slider("Lua", 'A', "[Taser Zeus]Desync Limit",290,580,290,true,"°",0.1),
        ["lua_range"] = ui.new_slider("Lua", 'A' , "[Taser Zeus]Range",1,70,30,true,"°"),
        ["lua_jitter_sensitivity"] = ui.new_slider("Lua", 'A' , "[Taser Zeus]Jitter Sensitivity",1,10,6,true),
        ["lua_min_hp"] = ui.new_slider("Lua", 'A' , "[Taser Zeus]<X HP",1,100),
    },
}

local config = "Other"
local high_priority_danger = false
local distance_value = 0
local lua_hitchance = 1
local lua_mp_hitbox = "Head"
local lua_hitbox = "Head"
local lua_damage = 1

client.set_event_callback("paint",function()
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(syr_active) then
		return
	end

	local players = entity.get_players(true)
	for i=1, #players do
		enemy_player = players[i]
		if enemy_player == nil then
			return
		end

		local weapon_enemy = entity.get_player_weapon(enemy_player)
		if weapon_enemy == nil then
			return
		end

		local enemy_weapon_id = bit.band(entity.get_prop(weapon_enemy, "m_iItemDefinitionIndex"), 0xFFFF)
		local x1, y1, x2 , y2 , mult = entity.get_bounding_box(enemy_player)

		if x1 ~= nil and mult > 0 then
			y1 = y1 - 17
			x1 = x1 + ((x2 - x1) / 2)
			if high_priority_danger == true then
				renderer.text(x1, y1 - 10, 255, 255, 0, 255, "cb", 0, "High Priority")
			end
		end

		if ui.get(high_priority_dager) and enemy_weapon_id == 9 or weapon_id == 31 then
			plist.set(enemy_player, "High priority", true)
			high_priority_danger = true
		else
			plist.set(enemy_player, "High priority", false)
			high_priority_danger = false
		end
	end
end)

local disabled_de_on_greaner = ui.new_checkbox("Lua", 'A', "Disabled DT On Grenade And Knife And Bomb")
local lua_headbaim_indicator = ui.new_checkbox("Lua", 'A' ,"Prefer HitPriority Indicator")
local head_shoter_label = ui.new_label("Lua", 'A', "Prefer Head Color")
local head_shoter_c = ui.new_color_picker("Lua", 'A', "Head Color c", 0, 50, 255, 255)
local preferbaim_shoter_label = ui.new_label("Lua", 'A', "Prefer Baim Color")
local preferbaim_shoter_c = ui.new_color_picker("Lua", 'A', "Prefer Color c", 0, 255, 0, 255)
local prefer_shoter_label = ui.new_label("Lua", 'A', "Force Baim Color")
local forcebaim_shoter_c = ui.new_color_picker("Lua", 'A', "Force Color c", 0, 255, 125, 255)
local safe_shoter_label = ui.new_label("Lua", 'A', "Force Safety Color")
local forcesafe_shoter_c = ui.new_color_picker("Lua", 'A', "Safety Color c", 0, 180, 255, 255)

local function has_value(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
		return false
end


local function GetDistanceInMeter(a_x, a_y, a_z, b_x, b_y, b_z)
	return math.ceil(math.sqrt(math.pow(a_x - b_x, 2) + math.pow(a_y - b_y, 2) + math.pow(a_z - b_z, 2)) * 0.0254)
end

local function getDistance(from, to, unit)
	local xDist, yDist, zDist = to[1] - from[1], to[2] - from[2], to[3] - from[3]
	local m1, m2 = 0, 0
	if(unit ~= nil and unit == "feet") then
		m1 = 2
		m2 = 30.48
	end
		return math.sqrt( (xDist ^ 2) + (yDist ^ 2) + (zDist ^ 2) ) * m1 / m2
end

local function multiselect_debug(multiselect, string)
	local number = ui.get(multiselect)
	if #number == 0 then
		ui.set(multiselect, string)
	end
end

local function vec_3(_x, _y, _z)
	return {x = _x or 0, y = _y or 0, z = _z or 0}
end

local function ticks_to_time(ticks)
	return globals.tickinterval() * ticks
end

local function vec2_distance(f_x, f_y, t_x, t_y)
	local delta_x, delta_y = f_x - t_x, f_y - t_y
	return math.sqrt(delta_x*delta_x + delta_y*delta_y)
end

local function player_will_peek(e)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(syr_active) or ui.get(quick_stop) then
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

		if damage > ui.get(min_dmg) then
			return true
		end
	end

	return false
end


local function change_speed(newSpeed)
	if client.get_cvar("cl_sidespeed") == 450 and newSpeed == 450 then
		client.set_cvar("cl_sidespeed", 1000)
		client.set_cvar("cl_forwardspeed", 1000)
		client.set_cvar("cl_backspeed", 1000)
		return
	end

	client.set_cvar("cl_sidespeed", newSpeed)
	client.set_cvar("cl_forwardspeed", newSpeed)
	client.set_cvar("cl_backspeed", newSpeed)
end

local function syr_weapons_name(c)
	local active_color = ui.get(syr_active) and ui.get(indicator)
	ui.set(reset_misses,true)
	ui.set_visible(sync_change, ui.get(syr_active))
	ui.set_visible(weapon_indicator, ui.get(syr_active))
	ui.set_visible(global_color_label, ui.get(syr_active))
	ui.set_visible(global_c, ui.get(syr_active))
	ui.set_visible(head_shoter_label,active_color)
	ui.set_visible(head_shoter_c,active_color)
	ui.set_visible(preferbaim_shoter_label,active_color)
	ui.set_visible(preferbaim_shoter_c,active_color)
	ui.set_visible(prefer_shoter_label,active_color)
	ui.set_visible(safe_shoter_label,active_color)
	ui.set_visible(forcebaim_shoter_c,active_color)
	ui.set_visible(forcesafe_shoter_c,active_color)
	ui.set_visible(override_damage_key, ui.get(syr_active))
	ui.set_visible(override_hitbox_key, ui.get(syr_active))
	ui.set_visible(override_hitchance_key, ui.get(syr_active))
	ui.set_visible(weapons_acitve_visible, ui.get(syr_active))
	ui.set_visible(lua_headbaim_indicator, ui.get(syr_active))
	ui.set_visible(disabled_scope_hitchance, ui.get(syr_active))
	ui.set_visible(disabled_de_on_greaner, ui.get(syr_active))
	ui.set_visible(high_priority_dager, ui.get(syr_active))

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "Auto" then
		syr_visible_table(syr_weapons["Auto"], true)
	else
		syr_visible_table(syr_weapons["Auto"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "AWP" then
		syr_visible_table(syr_weapons["AWP"], true)
	else
		syr_visible_table(syr_weapons["AWP"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "Scout" then
		syr_visible_table(syr_weapons["Scout"], true)
	else
		syr_visible_table(syr_weapons["Scout"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "Pistol" then
		syr_visible_table(syr_weapons["Pistol"], true)
	else
		syr_visible_table(syr_weapons["Pistol"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "Rifle" then
		syr_visible_table(syr_weapons["Rifle"], true)
	else
		syr_visible_table(syr_weapons["Rifle"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "SMG" then
		syr_visible_table(syr_weapons["SMG"], true)
	else
		syr_visible_table(syr_weapons["SMG"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "R8 Revolver" then
		syr_visible_table(syr_weapons["R8 Revolver"], true)
	else
		syr_visible_table(syr_weapons["R8 Revolver"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "Eagle" then
		syr_visible_table(syr_weapons["Eagle"], true)
	else
		syr_visible_table(syr_weapons["Eagle"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "Heavy" then
		syr_visible_table(syr_weapons["Heavy"], true)
	else
		syr_visible_table(syr_weapons["Heavy"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "Other" then
		syr_visible_table(syr_weapons["Other"], true)
	else
		syr_visible_table(syr_weapons["Other"], false)
	end

	if ui.get(syr_active) and ui.get(weapons_acitve_visible) == "Taser Zeus" then
		syr_visible_table(syr_weapons["Taser Zeus"], true)
	else
		syr_visible_table(syr_weapons["Taser Zeus"], false)
	end

	local enemy_players = entity.get_players(true)
	for i=1, #enemy_players do
		enemy_player = enemy_players[i]
		local local_player_origin = {x, y, z}
		local enemy_origin = {x, y, z}
		local_player_origin.x, local_player_origin.y, local_player_origin.z = entity.get_prop(entity.get_local_player(), "m_vecOrigin")
		enemy_origin.x, enemy_origin.y, enemy_origin.z = entity.get_prop(enemy_player, "m_vecOrigin")
		distance_value = GetDistanceInMeter(local_player_origin.x, local_player_origin.y, local_player_origin.z, enemy_origin.x, enemy_origin.y, enemy_origin.z)
		if has_value(ui.get(weapon_indicator),"Distance") and entity.is_alive(enemy_player) and enemy_player then
			local get_x, get_y = entity.get_bounding_box(enemy_player)
			local get_x = get_x == nil and 0 or get_x local get_y = get_y == nil and 0 or get_y
			renderer.text(get_x + 45, get_y + 5, 255, 255, 255, entity.is_alive(enemy_player) and 255 or 0, "c", 0, distance_value .. "/M")
		end
	end

	local local_player_origin = {x, y, z}
	local enemy_origin = {x, y, z}
	local inair_flags_override = entity.get_prop(entity.get_local_player(), "m_fFlags") == 256
	local distance_value = distance_value
	enemy_origin.x, enemy_origin.y, enemy_origin.z = enemy_origin.x, enemy_origin.y, enemy_origin.z
	local_player_origin.x, local_player_origin.y, local_player_origin.z = local_player_origin.x, local_player_origin.y, local_player_origin.z
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(syr_active) then
		return
	end

	local scoped_value = entity.get_prop(entity.get_local_player(), "m_bIsScoped" )
	local scoped_hitchance = scoped_value == 0 and true or false
	local active_weapon = entity.get_prop(local_player, "m_hActiveWeapon")
	if active_weapon == nil then
		return
	end

	local weapon_real_active = entity.get_prop(active_weapon, "m_iItemDefinitionIndex")
	if weapon_real_active == nil then
		return
	end

	local active_weapons_coder = bit.band(weapon_real_active, 0xFFFF)
	local no_scope_active_weapon = has_value(ui.get(disabled_scope_hitchance),"Other") and false or true
	local syr_active_weapons = "Other"
	if active_weapons_coder == 11 or active_weapons_coder == 38 then
		syr_active_weapons = "Auto"
		no_scope_active_weapon = auto_no_scope_active_weapon
	elseif active_weapons_coder == 9 then
		syr_active_weapons = "AWP"
		no_scope_active_weapon = awp_no_scope_active_weapon
	elseif active_weapons_coder == 40 then
		syr_active_weapons = "Scout"
		no_scope_active_weapon = scout_no_scope_active_weapon
	elseif active_weapons_coder == 2 or active_weapons_coder == 3 or active_weapons_coder == 4 or active_weapons_coder == 30 or active_weapons_coder == 32 or active_weapons_coder == 36 or active_weapons_coder == 61 or active_weapons_coder == 63 then
		syr_active_weapons = "Pistol"
		no_scope_active_weapon = pistol_no_scope_active_weapon
	elseif active_weapons_coder == 7 or active_weapons_coder == 8  or active_weapons_coder == 10 or active_weapons_coder == 13 or active_weapons_coder == 16 or active_weapons_coder == 39 then
		syr_active_weapons = "Rifle"
		no_scope_active_weapon = rifle_no_scope_active_weapon
	elseif active_weapons_coder == 17 or active_weapons_coder == 19  or active_weapons_coder == 24 or active_weapons_coder == 26 or active_weapons_coder == 33 or active_weapons_coder == 34 then
		syr_active_weapons = "SMG"
		no_scope_active_weapon = smg_no_scope_active_weapon
	elseif active_weapons_coder == 64 then
		syr_active_weapons = "R8 Revolver"
		no_scope_active_weapon = revolver_no_scope_active_weapon
	elseif active_weapons_coder == 1 then
		syr_active_weapons = "Eagle"
		no_scope_active_weapon = eagle_no_scope_active_weapon
	elseif active_weapons_coder == 14 or active_weapons_coder == 28 then
		syr_active_weapons = "Heavy"
		no_scope_active_weapon = heavy_no_scope_active_weapon
	elseif active_weapons_coder == 31 then
		syr_active_weapons = "Taser Zeus"
		no_scope_active_weapon = taser_no_scope_active_weapon
	end

	if ui.get(sync_change) then
		ui.set(weapons_acitve_visible, syr_active_weapons)
	end

	if syr_active_weapons == "Auto" and has_value(ui.get(disabled_scope_hitchance),"Auto") then
		auto_no_scope_active_weapon = false
	elseif syr_active_weapons == "Auto" and not has_value(ui.get(disabled_scope_hitchance),"Auto") then
		auto_no_scope_active_weapon = true
	end

	if syr_active_weapons == "AWP" and has_value(ui.get(disabled_scope_hitchance),"AWP") then
		awp_no_scope_active_weapon = false
	elseif syr_active_weapons == "AWP" and not has_value(ui.get(disabled_scope_hitchance),"AWP") then
		awp_no_scope_active_weapon = true
	end

	if syr_active_weapons == "Scout" and has_value(ui.get(disabled_scope_hitchance),"Scout") then
		scout_no_scope_active_weapon = false
	elseif syr_active_weapons == "Scout" and not has_value(ui.get(disabled_scope_hitchance),"Scout") then
		scout_no_scope_active_weapon = true
	end

	if syr_active_weapons == "Pistol" and has_value(ui.get(disabled_scope_hitchance),"Pistol") then
		pistol_no_scope_active_weapon = false
	elseif syr_active_weapons == "Scout" and not has_value(ui.get(disabled_scope_hitchance),"Pistol") then
		pistol_no_scope_active_weapon = true
	end

	if syr_active_weapons == "Rifle" and has_value(ui.get(disabled_scope_hitchance),"Rifle") then
		rifle_no_scope_active_weapon = false
	elseif syr_active_weapons == "Rifle" and not has_value(ui.get(disabled_scope_hitchance),"Rifle") then
		rifle_no_scope_active_weapon = true
	end

	if syr_active_weapons == "SMG" and has_value(ui.get(disabled_scope_hitchance),"SMG") then
		smg_no_scope_active_weapon = false
	elseif syr_active_weapons == "SMG" and not has_value(ui.get(disabled_scope_hitchance),"SMG") then
		smg_no_scope_active_weapon = true
	end

	if syr_active_weapons == "R8 Revolver" and has_value(ui.get(disabled_scope_hitchance),"R8 Revolver") then
		revolver_no_scope_active_weapon = false
	elseif syr_active_weapons == "R8 Revolver" and not has_value(ui.get(disabled_scope_hitchance),"R8 Revolver") then
		revolver_no_scope_active_weapon = true
	end

	if syr_active_weapons == "Eagle" and has_value(ui.get(disabled_scope_hitchance),"Eagle") then
		eagle_no_scope_active_weapon = false
	elseif syr_active_weapons == "Eagle" and not has_value(ui.get(disabled_scope_hitchance),"Eagle") then
		eagle_no_scope_active_weapon = true
	end

	if syr_active_weapons == "Heavy" and has_value(ui.get(disabled_scope_hitchance),"Heavy") then
		heavy_no_scope_active_weapon = false
	elseif syr_active_weapons == "Heavy" and not has_value(ui.get(disabled_scope_hitchance),"Heavy") then
		heavy_no_scope_active_weapon = true
	end

	if syr_active_weapons == "Taser Zeus" and has_value(ui.get(disabled_scope_hitchance),"Taser Zeus") then
		taser_no_scope_active_weapon = false
	elseif syr_active_weapons == "Taser Zeus" and not has_value(ui.get(disabled_scope_hitchance),"Taser Zeus") then
		taser_no_scope_active_weapon = true
	end

	if syr_active_weapons == "Other" and has_value(ui.get(disabled_scope_hitchance),"Other") then
		other_no_scope_active_weapon = false
	elseif syr_active_weapons == "Other" and not has_value(ui.get(disabled_scope_hitchance),"Other") then
		other_no_scope_active_weapon = true
	end

	local config = syr_weapons[syr_active_weapons]
	local distance_override_status = distance_value <= ui.get(config["enemy_distance"]) and true or false
	local flags_hitchance_open = scoped_hitchance == false or no_scope_active_weapon == false
	if flags_hitchance_open == false then
		lua_hitchance_ref = ui.get(config["hitchance"])
	end

	local lua_hitchance = ui.get(override_hitchance_key) and ui.get(config["override_hitchance"]) or lua_hitchance_ref
	local hitchance_status = ui.get(override_hitchance_key) and "Ove" or "Def"
	if scoped_hitchance == true and no_scope_active_weapon == true then
		lua_hitchance = ui.get(config["noscope_hitchance"])
		hitchance_status = "Nsp"
	end

	local lua_mp_hitbox = ui.get(config["mp_hitbox"])
	local lua_hitbox_ref = ui.get(config["target_hitbox"])
	local lua_hitbox = ui.get(override_hitbox_key) and ui.get(config["hitbox_override"]) or lua_hitbox_ref
	if inair_flags_override == false and distance_override_status == false then
		lua_damage = ui.get(override_damage_key) and ui.get(config["damage_override"]) or syr_weapon_visible == false and ui.get(config["damage_wall"]) or ui.get(config["damage_visible"])
		damage_status = ui.get(override_damage_key) and "Ove" or syr_weapon_visible == false and "Def" or "Vis"
	elseif distance_override_status == true and inair_flags_override == false then
		lua_mp_hitbox = ui.get(config["mp_hitbox_distance"])
		lua_damage = ui.get(override_damage_key) and ui.get(config["damage_override"]) or ui.get(config["damage_distance"])
		damage_status = ui.get(override_damage_key) and "Ove" or "Dis"
		lua_hitbox = ui.get(override_hitbox_key) and ui.get(config["hitbox_override"]) or ui.get(config["target_hitbox_distance"])
		lua_hitchance = ui.get(override_hitchance_key) and ui.get(config["override_hitchance"]) or ui.get(config["hitchance_distance"])
		hitchance_status = ui.get(override_hitchance_key) and "Ove" or "Dis"
	elseif inair_flags_override == true then
		lua_mp_hitbox = ui.get(config["mp_hitbox_air"])
		lua_damage = ui.get(override_damage_key) and ui.get(config["damage_override"]) or ui.get(config["damage_air"])
		damage_status = ui.get(override_damage_key) and "Ove" or "Air"
		lua_hitbox = ui.get(override_hitbox_key) and ui.get(config["hitbox_override"]) or ui.get(config["target_hitbox_air"])
		lua_hitchance = ui.get(override_hitchance_key) and ui.get(config["override_hitchance"]) or ui.get(config["hitchance_air"])
		hitchance_status = ui.get(override_hitchance_key) and "Ove" or "Air"
	end

	local local_player = entity.get_local_player()
	local vx, vy, vz = entity.get_prop(local_player, "m_vecVelocity")
	local local_speed_ref = math.sqrt((vx * vx) + (vy * vy))
	local multi_point_value = local_speed_ref / 250 * 36 >= 36 and 36 or local_speed_ref / 250 * 36
	local lua_multipoint_scale_ref = ui.get(config["dynamic_mp"]) and 91 - multi_point_value or ui.get(config["mp_scale"])
	local lua_multipoint_scale = lua_multipoint_scale_ref <= 24 and 25 or lua_multipoint_scale_ref
	local lua_hitbox = lua_hitbox == nil and "Head" or lua_hitbox
	multiselect_debug(config["target_hitbox_air"], "Head")
	multiselect_debug(config["target_hitbox_distance"], "Head")
	multiselect_debug(config["target_hitbox"], "Head")
	multiselect_debug(config["hitbox_override"], "Head")
	ui.set(target_select,ui.get(config["target_select"]))
	ui.set(target_hitbox_ref,lua_hitbox)
	ui.set(multi_hitbox,lua_mp_hitbox)
	ui.set(multi_modes,ui.get(config["mp_modes"]))
	ui.set(multi_scale,lua_multipoint_scale)
	ui.set(prefer_safe,ui.get(config["prefer_safe"]))
	ui.set(force_safe,ui.get(config["force_safe"]))
	ui.set(force_safe_limbs,ui.get(config["forcesafe_limbs"]))
	ui.set(min_htc,lua_hitchance == nil and ui.get(config["hitchance"]) or lua_hitchance)
	ui.set(min_dmg,lua_damage)
	ui.set(low_fps,ui.get(config["fps_disable"]))
	ui.set(delay_shot,ui.get(config["delay_shot"]))
	ui.set(auto_scope,ui.get(config["auto_scope"]))
	ui.set(accuracy_mode,ui.get(config["accuracy_modes"]))
	ui.set(quick_mode,ui.get(config["stop_select"]))
	ui.set(prefer_baim,ui.get(config["prefer_baim"]))
	ui.set(prefer_baim_disabled,ui.get(config["baim_disable"]))
	ui.set(double_check,ui.get(config["dt_enabled"]))
	ui.set(double_tap_htc,ui.get(config["dt_hitchance"]))
	ui.set(double_tap_stop,ui.get(config["dt_stop"]))
	ui.set(options,ui.get(config["lua_prefer_baim"]))
	ui.set(headaim_options,ui.get(config["lua_prefer_head"]))
	ui.set(force_options,ui.get(config["lua_force_baim"]))
	ui.set(safe_options,ui.get(config["lua_force_safe"]))
	ui.set(indicator,ui.get(lua_headbaim_indicator))
	ui.set(predictive_baim,ui.get(config["lua_prediction_baim"]))
	ui.set(ref_desync,ui.get(config["lua_desync_limit"]))
	ui.set(range_slider,ui.get(config["lua_range"]))
	ui.set(jitter_sensitivity,ui.get(config["lua_jitter_sensitivity"]))
	ui.set(ref_hp_slider,ui.get(config["lua_min_hp"]))
	ui.set(quick_stop,ui.get(config["lua_auto_stop"]) and false or ui.get(config["quick_stop"]))

	local syr_active_weapons = syr_active_weapons
	local hitchance_status = hitchance_status
	local damage_status = damage_status
	local weapons_csgo_coder_name = entity.get_classname(entity.get_player_weapon(entity.get_local_player()))
	if ui.get(disabled_de_on_greaner) and weapons_csgo_coder_name == "CHEGrenade" or weapons_csgo_coder_name == "CSmokeGreade" or weapons_csgo_coder_name == "CIncendiaryGrenade" or weapons_csgo_coder_name == "CFlashbang" or weapons_csgo_coder_name == "CDecoyGrenade" or weapons_csgo_coder_name == "CC4" then
		ui.set(double_check,false)
	elseif ui.get(disabled_de_on_greaner) and weapons_csgo_coder_name == "CKnife" then
		ui.set(double_check,false)
	end

	local final_val = 450
	local stop_check = "On hotkey"
	if not ui.get(quick_stop) and ui.get(config["lua_auto_stop"]) then
		local can_fire = player_will_peek()
		stop_check = can_fire and "Always on" or "On hotkey"
		ui.set(slow_walk, true)
		final_val = can_fire and 250 * ui.get(config["lua_auto_stop_speed"]) / 100 or 450
	end

	change_speed(final_val)
	ui.set(slow_key, stop_check)

	local weapon_r, weapon_g, weapon_b, weapon_a = ui.get(global_c)
	if has_value(ui.get(weapon_indicator),"Damage Override") and ui.get(override_damage_key) then
		client.draw_indicator(ctx, weapon_r, weapon_g, weapon_b, weapon_a,"DMG OVE")
	end

	if has_value(ui.get(weapon_indicator),"Hitbox Override") and ui.get(override_hitbox_key) then
		client.draw_indicator(ctx, weapon_r, weapon_g, weapon_b, weapon_a,"HITBOX OVE")
	end

	if has_value(ui.get(weapon_indicator),"Hitbox Override") and ui.get(override_hitchance_key) then
		client.draw_indicator(ctx, weapon_r, weapon_g, weapon_b, weapon_a,"HTC OVE")
	end

	if has_value(ui.get(weapon_indicator),"Active Weapon") then
		client.draw_indicator(ctx,weapon_r, weapon_g, weapon_b, weapon_a,"Weapon: ".. syr_active_weapons)
	end

	if has_value(ui.get(weapon_indicator),"D & H") then
		client.draw_indicator(ctx,weapon_r, weapon_g, weapon_b, weapon_a,"D: " ..damage_status .. " & H: " ..hitchance_status)
	end

	if not ui.get(override_damage_key) and has_value(ui.get(weapon_indicator),"Min Damage") and ui.get(min_dmg) == ui.get(config["damage_wall"]) then
		client.draw_indicator(ctx, 102, 255, 102, 255,"Min Damage: " .. ui.get(min_dmg))
	elseif not ui.get(override_damage_key) and has_value(ui.get(weapon_indicator),"Min Damage") and ui.get(min_dmg) == ui.get(config["damage_visible"]) then
		client.draw_indicator(ctx, 50, 255, 200, 255,"Min Damage: " .. ui.get(min_dmg))
	elseif ui.get(override_damage_key) and has_value(ui.get(weapon_indicator),"Min Damage") and ui.get(min_dmg) == ui.get(config["damage_override"]) then
		client.draw_indicator(ctx, 255, 155, 255, 255,"Min Damage: " .. ui.get(min_dmg))
	else
		client.draw_indicator(ctx, 100, 200, 100, 255,"Min Damage: " .. ui.get(min_dmg))
	end
end

client.set_event_callback("paint",syr_weapons_name)


local function vec2_distance(f_x, f_y, t_x, t_y)
	local delta_x, delta_y = f_x - t_x, f_y - t_y
	return math.sqrt(delta_x*delta_x + delta_y*delta_y)
end

local function get_all_player_positions(ctx, screen_width, screen_height, enemies_only)
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

local function syr_visible_enemy(ctx)			
	local local_entindex = entity.get_local_player()
	if entity.get_prop(local_entindex, "m_lifeState") ~= 0 then	
		syr_weapon_visible = false
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
		syr_weapon_visible = true
	else
		syr_weapon_visible = false
	end

	stored_target = enemy_entindex
	local enemy_player_number = entity.get_players(true)
end

client.set_event_callback("paint",syr_visible_enemy)

local missLogs = {}
local simTimes = {}
local oldSimTimes = {}
local chokes = {}
local cached_plist
for i=1, 64 do
	missLogs[i] = 0
end

local function extrapolate_position(xpos,ypos,zpos,ticks,ent)
	x,y,z = entity.get_prop(ent, "m_vecVelocity")
	for i=0, ticks do
		xpos =  xpos + (x*globals.tickinterval())
		ypos =  ypos + (y*globals.tickinterval())
		zpos =  zpos + (z*globals.tickinterval()  + (9.81 * ((globals.tickinterval())* (globals.tickinterval()) / 2)))
	end
	return xpos,ypos,zpos
end

local function vector_angles(x1, y1, z1, x2, y2, z2)
    local origin_x, origin_y, origin_z
    local target_x, target_y, target_z
    if x2 == nil then
        target_x, target_y, target_z = x1, y1, z1
        origin_x, origin_y, origin_z = client.eye_position()
        if origin_x == nil then
            return
        end
    else
        origin_x, origin_y, origin_z = x1, y1, z1
        target_x, target_y, target_z = x2, y2, z2
    end
 
    local delta_x, delta_y, delta_z = target_x-origin_x, target_y-origin_y, target_z-origin_z
 
    if delta_x == 0 and delta_y == 0 then
        return (delta_z > 0 and 270 or 90), 0
    else

        local yaw = math.deg(math.atan2(delta_y, delta_x))
        local hyp = math.sqrt(delta_x*delta_x + delta_y*delta_y)
        local pitch = math.deg(math.atan2(-delta_z, hyp))
        return pitch, yaw
    end
end

local function normalise_angle(angle)
	angle =  angle % 360 
	angle = (angle + 360) % 360
	if (angle > 180)  then
		angle = angle - 360
	end
	return angle
end

local function is_moving(index)
	local x,y,z = entity.get_prop(index, "m_vecVelocity")
	return math.sqrt(x * x + y * y + z * z) > 1.0
end

local function ent_speed(index)
	local x,y,z = entity.get_prop(index, "m_vecVelocity")
	return math.sqrt(x * x + y * y + z * z)
end

local function ent_speed_2d(index)
	local x,y,z = entity.get_prop(index, "m_vecVelocity")
	return math.sqrt(x * x + y * y)
end


local function body_yaw(entityindex)
	bodyyaw = entity.get_prop(entityindex, "m_flPoseParameter", 11)
	if bodyyaw ~= nil then
		bodyyaw = bodyyaw * 120 - 60
	else
		return nil
	end
	return bodyyaw
end

local function get_body_yaw(entityindex)
	_, model_yaw = entity.get_prop(entityindex, "m_angAbsRotation")
	_, eye_yaw = entity.get_prop(entityindex, "m_angEyeAngles")
	return normalise_angle(model_yaw - eye_yaw)
end

local function max_desync(entityindex)
	local spd = math.min(260, ent_speed_2d(entityindex))
	local walkfrac = math.max(0, math.min(1, spd / 135))
	local mult = 1 - 0.5*walkfrac
	local duckamnt = entity.get_prop(entityindex, "m_flDuckAmount")
	
	if duckamnt > 0 then
		local duckfrac = math.max(0, math.min(1, spd / 88))
		mult = mult + ((duckamnt * duckfrac) * (0.5 - mult))
	end
	
	return(58 * mult)
end

local function vec3_normalize(x, y, z)
	local len = math.sqrt(x * x + y * y + z * z)
	if len == 0 then
		return 0, 0, 0
	end
	local r = 1 / len
	return x*r, y*r, z*r
end

local function vec3_dot(ax, ay, az, bx, by, bz)
	return ax*bx + ay*by + az*bz
end

local function angle_to_vec(pitch, yaw)
	local p, y = math.rad(pitch), math.rad(yaw)
	local sp, cp, sy, cy = math.sin(p), math.cos(p), math.sin(y), math.cos(y)
	return cp*cy, cp*sy, -sp
end

local function ent_speed(index)
	local x,y,z = entity.get_prop(index, "m_vecVelocity")
	if x == nil then
		return 0
	end

	return math.sqrt(x * x + y * y + z * z)
end


local function get_fov_cos(ent, vx,vy,vz, lx,ly,lz)
	local ox,oy,oz = entity.get_prop(ent, "m_vecOrigin")
	if ox == nil then
		return -1
	end

	local dx,dy,dz = vec3_normalize(ox-lx, oy-ly, oz-lz)
	return vec3_dot(dx,dy,dz, vx,vy,vz)
end
local function vec_length(x,y,z)
	temp = x*x + y*y + z*z 
	if temp < 0 then 
		return 0
	else
		return math.sqrt(temp)
	end
end

local closest_player = 0

local function vec3_normalize(x, y, z)
	local len = math.sqrt(x * x + y * y + z * z)
	if len == 0 then
		return 0, 0, 0
	end
	local r = 1 / len
	return x*r, y*r, z*r
end

local function vec3_dot(ax, ay, az, bx, by, bz)
	return ax*bx + ay*by + az*bz
end

local function angle_to_vec(pitch, yaw)
	local p, y = math.rad(pitch), math.rad(yaw)
	local sp, cp, sy, cy = math.sin(p), math.cos(p), math.sin(y), math.cos(y)
	return cp*cy, cp*sy, -sp
end

local function ent_speed(index)
	local x,y,z = entity.get_prop(index, "m_vecVelocity")
	if x == nil then
		return 0
	end
	return math.sqrt(x * x + y * y + z * z)
end

-- ent: entity index of target player
-- vx,vy,vz: local player view direction
-- lx,ly,lz: local player origin
local function get_fov_cos(ent, vx,vy,vz, lx,ly,lz)
	local ox,oy,oz = entity.get_prop(ent, "m_vecOrigin")
	if ox == nil then
		return -1
	end

	-- get direction to player
	local dx,dy,dz = vec3_normalize(ox-lx, oy-ly, oz-lz)
	return vec3_dot(dx,dy,dz, vx,vy,vz)
end
local function vec_length(x,y,z)
	temp = x*x + y*y + z*z 
	if temp < 0 then 
		return 0
	else
		return math.sqrt(temp)
	end
end

local function comp_angle(sx,sy,sz,dsx,dsy,dsz)
	local dx,dy,dz = sx-dsx,sy-dsy,sz-dsz
	local rx,ry,rz = math.asin((dz / vec_length(dx,dy,dz)) * radpi), (math.atan(dy / dx) * radpi) , 0
	if dx > 0.0 then
		ry = ry + 180.0
	end
	return ry
end

local function is_x_shots(local_player,target,shots)
	local px, py, pz = entity.hitbox_position(target, 6) -- middle chest
	local px1, py1, pz1 = entity.hitbox_position(target, 4) -- upper chest
	local px2, py2, pz2 = entity.hitbox_position(target, 2) -- pelvis
	local lx,ly,lz = client.eye_position()
	if is_moving(local_player) and ui.get(predictive_baim) then
		lx,ly,lz = extrapolate_position(lx,ly,lz,20,local_player)
	end
	
	for i=0, 2 do
	
		if i==0 then
			entindex,dmg = client.trace_bullet(local_player,lx,ly,lz,px,py,pz)
		else 
			if i==1 then
				entindex,dmg = client.trace_bullet(local_player,lx,ly,lz,px1,py1,pz1)
			else
				entindex,dmg = client.trace_bullet(local_player,lx,ly,lz,px2,py2,pz2)
			end
		end
		
		
		if entindex == nil then
			return false
		end
		
		if entindex == local_player then
			return false
		end
		
		if not entity.is_enemy(entindex) then
			return false
		end
		
		if dmg >= (entity.get_prop(target, "m_iHealth") / shots) then
			return true
		end
	end
	return false
end

local function is_auto_vis(local_player,lx,ly,lz,px,py,pz)

	entindex,dmg = client.trace_bullet(local_player,lx,ly,lz,px,py,pz)
	
	if entindex == nil then
		return false
	end
	
	if entindex == local_player then
		return false
	end
	
	if not entity.is_enemy(entindex) then
		return false
	end
	
	if dmg >=  5 then
		return true
	else
		return false
	end
end

local function is_damage_vis(local_player,lx,ly,lz,px,py,pz)
	entindex,dmg = client.trace_bullet(local_player,lx,ly,lz,px,py,pz)
	if entindex == nil then
		return false
	end
	
	if entindex == local_player then
		return false
	end
	
	if not entity.is_enemy(entindex) then
		return false
	end
	
	if dmg >=  ui.get(min_dmg) then
		return true
	else
		return false
	end
end

local function trace_positions(local_player,px,py,pz,px1,py1,pz1,lx2,ly2,lz2)
	if is_auto_vis(local_player,lx2,ly2,lz2,px,py,pz) then
		return true
	end
	if is_auto_vis(local_player,lx2,ly2,lz2,px1,py1,pz1) then
		return true
	end
	return false
end

local function is_auto_vis_enemy(enemy,lx,ly,lz,px,py,pz)

	entindex,dmg = client.trace_bullet(enemy,lx,ly,lz,px,py,pz)
	
	if entindex == nil then
		return false
	end
	if dmg >= 1 then
		return true
	end
	
	return false
end

local function trace_positions_enemy(eyeposx,eyeposy,eyeposz,lpx, lpy, lpz, lpx1, lpy1, lpz1 , lpx2, lpy2, lpz2,enemy_index)

	if is_auto_vis_enemy(enemy_index,eyeposx,eyeposy,eyeposz,lpx,lpy,lpz) then
		return true
	end
	if is_auto_vis_enemy(enemy_index,eyeposx,eyeposy,eyeposz,lpx1,lpy1,lpz1) then
		return true
	end
	if is_auto_vis_enemy(enemy_index,eyeposx,eyeposy,eyeposz,lpx2,lpy2,lpz2) then
		return true
	end
	
	return false
end

local history = {}
local jitter_delta = 15

local function detect_jitter(i)
	local length = #history[i]
	if length == nil then 
		return 
	end
	
	if length < 65 then
		return 
	end

	local count = 0
	
	for j=(length - 64), length do
		if history[i][j] ~= nil and history[i][j - 1] ~= nil then
			if (history[i][j] > 0 and history[i][j - 1] > 0) or (history[i][j] < 0 and history[i][j - 1] < 0) then
				if math.abs((history[i][j] - history[i][j - 1])) > jitter_delta then
					count = count + 1
				end
			else
				--if xor, then we add
				if (history[i][j] > 0 and history[i][j - 1] < 0) or (history[i][j] < 0 and history[i][j - 1] > 0)  then 
					if math.abs((history[i][j] + history[i][j - 1])) > jitter_delta then
						count = count + 1
					end
				end
			end	
		end
	end
	
	if count >= (10 - ui.get(jitter_sensitivity)) then 
		return true
	else
		return false
	end
end

local player_preference = {}
local player_safe = {}

local function on_paint(c)
	if not ui.get(syr_active) then
		return
	end

	if has_value(ui.get(headaim_options),"Sideways targets") or has_value(ui.get(options),"Backwards/Forwards") or has_value(ui.get(force_options),"Backwards/Forwards") 
	or has_value(ui.get(force_options),"Sideways targets")  then
		ui.set_visible(range_slider,false)
	else
		ui.set_visible(range_slider,false)
	end

	if has_value(ui.get(options),"Big desync") or has_value(ui.get(headaim_options),"Small desync") then
		ui.set_visible(ref_desync,false)
	else
		ui.set_visible(ref_desync,false)
	end
	
	if has_value(ui.get(options),"Walking jitter desync") or has_value(ui.get(force_options),"Walking jitter desync") then
		ui.set_visible(jitter_sensitivity,false)
	else
		ui.set_visible(jitter_sensitivity,false)
	end
	
	if has_value(ui.get(options),"<x HP") or has_value(ui.get(force_options),"<x HP")  then
		ui.set_visible(ref_hp_slider,false)
	else
		ui.set_visible(ref_hp_slider,false)
	end
	
	local entindex = entity.get_local_player()
	if entindex == nil then
		return
	end
	
	local lx,ly,lz = entity.get_prop(entindex, "m_vecOrigin")
	if lx == nil then return end
	local players = entity.get_players(true)
	local pitch, yaw = client.camera_angles()
	local vx, vy, vz = angle_to_vec(pitch, yaw)
	local closest_fov_cos = -1
	for i=1, #players do
		entindex = players[i]

		local fov_cos = get_fov_cos(entindex, vx,vy,vz, lx,ly,lz)
		if fov_cos > closest_fov_cos then
			closest_fov_cos = fov_cos
			closest_player = entindex
		end
	end


	if not ui.get(indicator) then
		return
	end
	
	local local_player = entity.get_local_player()
	
	if local_player == nil then
		return
	end
	
	if not entity.is_alive(local_player) then
		return
	end

	local players = entity.get_players(true)
	
	if players == nil then
		return
	end
	local lx,ly,lz = client.eye_position()
	
	if lx == nil then
		return
	end
	
	
	for i=1, #players do
		local player_index = players[i]
		if not entity.is_enemy(player_index) then
			return
		end
		
		local pos_x, pos_y, pos_z = entity.get_prop(player_index, "m_vecAbsOrigin")
		if pos_x == nil then
			return
		end

		local safety_point_ove = player_safe[player_index]
		local selected = player_preference[player_index]
		local r,g,b = 0
		if selected == "-" or selected == "Off" and not safety_point_ove == 2 then
			text_selected = "HEAD"
			r,g,b = ui.get(head_shoter_c)
			else if selected == "On" and not safety_point_ove == 2 then
				text_selected = "PREFER"
				r,g,b = ui.get(preferbaim_shoter_c)
				else if selected == "Force" and not safety_point_ove == 2 then
					text_selected = "FORCE"
					r,g,b = ui.get(forcebaim_shoter_c)
				end
			end
		end
					local safety_r,safety_g,safety_b = ui.get(forcesafe_shoter_c)
		local x1, y1, x2 , y2 , mult = entity.get_bounding_box(player_index)
		if x1 ~= nil and mult > 0 then
			y1 = y1 - 17
			x1 = x1 + ((x2 - x1) / 2)
			if  y1 ~= nil then
				renderer.text(x1, y1, safety_point_ove == 2 and safety_r or r, safety_point_ove == 2 and safety_g or g, safety_point_ove == 2 and safety_b or b, 255, "cb", 0, safety_point_ove == 2 and "SAFETY" or text_selected)
			end
		end
	end
	
	if ui.get(reset_hotkey) then
		if closest_player ~= 0 then
			missLogs[closest_player] = 0
		end
	end
end

client.set_event_callback('paint', on_paint)

local headaim_delay = {}
local function run_command(cmd)
	local local_player = entity.get_local_player()
	if not entity.is_alive(local_player) or not ui.get(syr_active) then
		return
	end

	local players = entity.get_players(true)
	if players == nil then
		return
	end

	local lx,ly,lz = client.eye_position()
	
	if lx == nil then
		return
	end
	
	local lpx, lpy, lpz = entity.hitbox_position(local_player, 0)
	local lpx1, lpy1, lpz1 = entity.hitbox_position(local_player, 4)
	local lpx2, lpy2, lpz2 = entity.hitbox_position(local_player, 2)
	
    cached_plist = ui.get(ref_plist)
	
	
	local active_weapon = entity.get_prop(local_player, "m_hActiveWeapon")
		
	if active_weapon == nil then
		return
	end
		
	local idx = entity.get_prop(active_weapon, "m_iItemDefinitionIndex")
		
	if idx == nil then 
		return
	end
		
	local item = bit.band(idx, 0xFFFF)
		
	if item == nil then
		return
	end
	
	for i=1, #players do
		local player_index = players[i]
		local pos_x, pos_y, pos_z = entity.get_prop(player_index, "m_vecAbsOrigin")
		
		if pos_x ~= nil then
			local t = body_yaw(player_index)
			
			if t ~= nil then
				if history[player_index] == nil then
					history[player_index] = {}
				end
				list_len = #history[player_index]
				history[player_index][list_len+ 1] = t
			end
			
			if not entity.is_dormant(player_index) and entity.is_alive(player_index) then
			
				ui.set(ref_plist, player_index)
				ui.set(ref_pref_baim, "-")
				ui.set(ref_pref_safe, "-")

				local selected_options = ui.get(options)
				local forced = false
				local prefer = false
				local head = false
				local safety = false
				
				if item == 31 then
					ui.set(ref_pref_baim, "Force")
					forced = true
				end

				if not forced then
					if ui.get(ref_pref_baim) ~= "On" then
						if has_value(selected_options,"Backwards/Forwards") then
							local pitch, yaw = vector_angles(pos_x, pos_y, pos_z, lx,ly,lz)
							local _,model_yaw = entity.get_prop(player_index, "m_angEyeAngles")
							local delta = math.abs(normalise_angle(yaw - model_yaw))
							if delta > 90 + ui.get(range_slider) or delta < 90 - ui.get(range_slider) then
								ui.set(ref_pref_baim, "On")
								prefer = true
							end
						end
						if has_value(selected_options,"Moving targets") and not prefer then
							if is_moving(player_index) then
								ui.set(ref_pref_baim, "On")
								prefer = true
							end
						end
						if has_value(selected_options,"Slow targets") and not prefer then
							if ent_speed(player_index) > 1.0 and ent_speed(player_index) < 80 then
								ui.set(ref_pref_baim, "On")
								prefer = true
							end
						end
						if has_value(selected_options,"x2 HP") and not prefer then
							if  is_x_shots(local_player,player_index,2) then
								ui.set(ref_pref_baim, "On")
								prefer = true
							end
						end
						if has_value(selected_options,"<x HP") and not prefer then
							if entity.get_prop(player_index,"m_iHealth") <= ui.get(ref_hp_slider) then
								ui.set(ref_pref_baim, "On")
								prefer = true
							end
						end
						if has_value(selected_options,"Shooting") and not prefer then
							local wep = entity.get_player_weapon(player_index)
							if wep ~= nil then
								local last_shot = entity.get_prop(wep,"m_fLastShotTime")
								if (last_shot + 0.500) > globals.curtime() then
									ui.set(ref_pref_baim, "On")
									prefer = true
								end
							end
						end
						if has_value(selected_options,"Big desync") and not prefer then
							local t = max_desync(player_index)
							if t > ui.get(ref_desync) / 10 then
								ui.set(ref_pref_baim, "On")
								prefer = true
							end
						end
						if has_value(selected_options,"Walking jitter desync") and not prefer then
							if ent_speed(player_index) > 2.0 and ent_speed(player_index) < 100 then
								if detect_jitter(player_index) then
									ui.set(ref_pref_baim, "On")
									prefer = true
								end
							end
						end
						if has_value(selected_options,"Always on") and not prefer then
							ui.set(ref_pref_baim, "On")
							prefer = true
						end
					end

					local selected_options = ui.get(headaim_options)
					if ui.get(ref_pref_baim) ~= "Off" then
						if has_value(selected_options,"Sideways targets") then
							local pitch, yaw = vector_angles(pos_x, pos_y, pos_z, lx,ly,lz)
							local _,model_yaw = entity.get_prop(player_index, "m_angEyeAngles")
							local delta = math.abs(normalise_angle(yaw - model_yaw))
							if delta < 90 + ui.get(range_slider) and delta > 90 - ui.get(range_slider) then
								ui.set(ref_pref_baim, "Off")
								head = true
							end
						end
						if has_value(selected_options,"Crouching targets") and not head then
							local duck_ammount = entity.get_prop(player_index, "m_flDuckAmount")
							if duck_ammount >= 0.7 then
								ui.set(ref_pref_baim, "Off")
								head = true
							end
						end
						if has_value(selected_options,"Fast targets") and not head then
							if ent_speed(player_index) > 170 then
								ui.set(ref_pref_baim, "Off")
								head = true
							end
						end
						if has_value(selected_options,"Small desync") and not head  then
							local t = max_desync(player_index)
							if t <= ui.get(ref_desync) / 10 then
								ui.set(ref_pref_baim, "Off")
								head = true
							end
						end
						if has_value(selected_options,"Shooting") and not head then
							local wep = entity.get_player_weapon(player_index)
							if wep ~= nil then
								local last_shot = entity.get_prop(wep,"m_fLastShotTime")
								if (last_shot + 0.500) > globals.curtime() then
									ui.set(ref_pref_baim, "Off")
									head = true
								end
							end
						end
					end
				
					local selected_options = ui.get(force_options)
					if ui.get(ref_pref_baim) ~= "Force" then
						if has_value(selected_options,"Backwards/Forwards") then
							local pitch, yaw = vector_angles(pos_x, pos_y, pos_z, lx,ly,lz)
							local _,model_yaw = entity.get_prop(player_index, "m_angEyeAngles")
							local delta = math.abs(normalise_angle(yaw - model_yaw))
							if delta > 90 + ui.get(range_slider) or delta < 90 - ui.get(range_slider) then
									ui.set(ref_pref_baim, "Force")
									forced = true
							end
						end
						if has_value(selected_options,"Sideways targets") and not forced then
							local pitch, yaw = vector_angles(pos_x, pos_y, pos_z, lx,ly,lz)
							local _,model_yaw = entity.get_prop(player_index, "m_angEyeAngles")
							local delta = math.abs(normalise_angle(yaw - model_yaw))
							if delta < 90 + ui.get(range_slider) and delta > 90 - ui.get(range_slider) then
								if ent_speed(player_index) > 10 then
									ui.set(ref_pref_baim, "Force")
									forced = true
								end
							end
						end
						if has_value(selected_options,"Slow targets") and not forced then
							if ent_speed(player_index) > 1.0 and ent_speed(player_index) < 80 then
								ui.set(ref_pref_baim, "Force")
								forced = true
							end
						end
						if has_value(selected_options,"x1 HP") and not forced then
							if is_x_shots(local_player,player_index,1) then
								ui.set(ref_pref_baim, "Force")
								forced = true
							end
						end
						if has_value(selected_options,"<x HP") and not forced then
							if entity.get_prop(player_index,"m_iHealth") <= ui.get(ref_hp_slider) then
								ui.set(ref_pref_baim, "Force")
								forced = true
							end
						end
						if has_value(selected_options,"1 miss") and not forced then
							if missLogs[player_index] >= 1 then
								ui.set(ref_pref_baim, "Force")
								forced = true
							end
						end
						if has_value(selected_options,"2 miss") and not forced then
							if missLogs[player_index] >= 2 then
								ui.set(ref_pref_baim, "Force")
								forced = true
							end
						end
						if has_value(selected_options,"x2 HP")  and not forced then
							if is_x_shots(local_player,player_index,2) then
								ui.set(ref_pref_baim, "Force")
								forced = true
							end
						end
						if has_value(selected_options,"Shooting") and not forced then
							local wep = entity.get_player_weapon(player_index)
							if wep ~= nil then
								local last_shot = entity.get_prop(wep,"m_fLastShotTime")
								if (last_shot + 0.500) > globals.curtime() then
									ui.set(ref_pref_baim, "Force")
									forced = true
								end
							end
						end
						if has_value(selected_options,"Walking jitter desync") then
							if ent_speed(player_index) > 1.0 and ent_speed(player_index) < 100 then
								if detect_jitter(player_index) then
									ui.set(ref_pref_baim, "Force")
									forced = true
								end
							end
						end
					end


					local selected_options = ui.get(safe_options)
					if ui.get(ref_pref_safe) ~= "On" then
						if has_value(selected_options,"Backwards/Forwards") then
							local pitch, yaw = vector_angles(pos_x, pos_y, pos_z, lx,ly,lz)
							local _,model_yaw = entity.get_prop(player_index, "m_angEyeAngles")
							local delta = math.abs(normalise_angle(yaw - model_yaw))
							if delta > 90 + ui.get(range_slider) or delta < 90 - ui.get(range_slider) then
									ui.set(ref_pref_safe, "On")
									safety = true
							end
						end
						if has_value(selected_options,"Sideways targets") and not safety then
							local pitch, yaw = vector_angles(pos_x, pos_y, pos_z, lx,ly,lz)
							local _,model_yaw = entity.get_prop(player_index, "m_angEyeAngles")
							local delta = math.abs(normalise_angle(yaw - model_yaw))
							if delta < 90 + ui.get(range_slider) and delta > 90 - ui.get(range_slider) then
								if ent_speed(player_index) > 10 then
									ui.set(ref_pref_safe, "On")
									safety = true
								end
							end
						end
						if has_value(selected_options,"Slow targets") and not safety then
							if ent_speed(player_index) > 1.0 and ent_speed(player_index) < 80 then
								ui.set(ref_pref_safe, "On")
								safety = true
							end
						end
						if has_value(selected_options,"x1 HP") and not safety then
							if is_x_shots(local_player,player_index,1) then
								ui.set(ref_pref_safe, "On")
								safety = true
							end
						end
						if has_value(selected_options,"<x HP") and not safety then
							if entity.get_prop(player_index,"m_iHealth") <= ui.get(ref_hp_slider) then
								ui.set(ref_pref_safe, "On")
								safety = true
							end
						end
						if has_value(selected_options,"1 miss") and not safety then
							if missLogs[player_index] >= 1 then
								ui.set(ref_pref_safe, "On")
								safety = true
							end
						end
						if has_value(selected_options,"2 miss") and not safety then
							if missLogs[player_index] >= 2 then
								ui.set(ref_pref_safe, "On")
								safety = true
							end
						end
						if has_value(selected_options,"x2 HP")  and not safety then
							if is_x_shots(local_player,player_index,2) then
								ui.set(ref_pref_safe, "On")
								safety = true
							end
						end
						if has_value(selected_options,"Shooting") and not safety then
							local wep = entity.get_player_weapon(player_index)
							if wep ~= nil then
								local last_shot = entity.get_prop(wep,"m_fLastShotTime")
								if (last_shot + 0.500) > globals.curtime() then
									ui.set(ref_pref_safe, "On")
									safety = true
								end
							end
						end
						if has_value(selected_options,"Walking jitter desync") then
							if ent_speed(player_index) > 1.0 and ent_speed(player_index) < 100 then
								if detect_jitter(player_index) then
									ui.set(ref_pref_safe, "On")
									safety = true
								end
							end
						end
					end
				end

				ui.set(safety_condition, safety and 2 or 1)

				--	local can1shot = is_x_shots(local_player,player_index,1)
				--	local trace1x,trace1y,trace1z = entity.hitbox_position(player_index, 0) -- head
				--	local can_hit_head = is_damage_vis(local_player,lx,ly,lz,trace1x,trace1y,trace1z)
					
				--		client.log(string.format('head:%s body:%s',can_hit_head,can1shot))
						--client.log(stomach_is_visible[player_index])
				--		if can_hit_head and not can1shot then
				--			--client.log("forced")
				--			ui.set(ref_pref_baim, "Force")
				--			forced = true
				--end

					-- force stomach aim if their foot is stomach is visble soon, but their feet are visible now
					-- prevents shooting toes on fast peekers, lets you shoot toes everywhere else normally
				--	if ui.get(smart_footaim) then
						-- tracing from their foot instead of eyeposition
				--		local trace1x,trace1y,trace1z = entity.hitbox_position(player_index, 11) -- left ankle
				--		local trace2x,trace2y,trace2z = entity.hitbox_position(player_index, 12) -- right ankle
				--		
				--		local can_hit_current = trace_positions(local_player,trace1x,trace1y,trace1z,trace2x,trace2y,trace2z,lx,ly,lz)

				--		if is_moving(player_index) then
				--			--extrapolate them if they're moving
				--			trace1x,trace1y,trace1z = extrapolate_position(trace1x,trace1y,trace1z,10,player_index)
				--			trace2x,trace2y,trace2z = extrapolate_position(trace2x,trace2y,trace2z,10,player_index)
				--		end
				--		
				--		if (trace_positions_enemy(trace1x,trace1y,trace1z,lpx, lpy, lpz, lpx1, lpy1, lpz1 , lpx2, lpy2, lpz2, player_index) or
				--		trace_positions_enemy(trace2x,trace2y,trace2z,lpx, lpy, lpz, lpx1, lpy1, lpz1 , lpx2, lpy2, lpz2, player_index)) and not can_hit_current then
				--			ui.set(ref_pref_baim, "Force")
				--		end
				--	end
				
					player_preference[player_index] = ui.get(ref_pref_baim)
					player_safe[player_index] = ui.get(safety_condition)

					if not forced then
						local entindex = entity.get_local_player()
						if entindex == nil then
							return
						end
						
						local lx,ly,lz = entity.get_prop(entindex, "m_vecOrigin")
						if lx == nil then return end
						local players = entity.get_players(true)
						local pitch, yaw = client.camera_angles()
						local vx, vy, vz = angle_to_vec(pitch, yaw)
						
						-- start out with 180 degrees as the closest
						-- cos(deg2rad(180)) is -1
						local closest_fov_cos = -1

						for i=1, #players do
							entindex = players[i]

							local fov_cos = get_fov_cos(entindex, vx,vy,vz, lx,ly,lz)
							if fov_cos > closest_fov_cos then
								-- this player is closer to our crosshair
								closest_fov_cos = fov_cos
								closest_player = entindex
							end
						end
						
				
						
						if ui.get(force_hotkey) then
							if closest_player ~= 0 then
								if closest_player == player_index then
									ui.set(ref_plist, closest_player)
									ui.set(ref_pref_baim, "Force")
									player_preference[closest_player] = "Force"
									forced = true
								end
							end
						end
					end
			end
		end
	end
	
	if cached_plist ~= nil then -- restore plist so people can click
		ui.set(ref_plist,cached_plist)
	end
	
end

local function clear_misses(index)
	missLogs[index] = 0
end

client.set_event_callback("aim_miss", function(c)
	local options = ui.get(force_options)
	if c.reason ~= "spread" then
		local t = c.target
		if missLogs[t] == nil then
			missLogs[t] = 1
			if ui.get(reset_misses) then
				if has_value(options,"1 miss") then
					client.delay_call(5,clear_misses,t)
				end
			end
		else
			missLogs[t] = missLogs[t] + 1
			if ui.get(reset_misses) then
				if has_value(options,"2 miss") or has_value(options,"1 miss") then
					client.delay_call(5,clear_misses,t)
				end
			end
		end
	end

	local options_2 = ui.get(safe_options)
	if c.reason ~= "spread" then
		local t = c.target
		if missLogs[t] == nil then
			missLogs[t] = 1
			if ui.get(reset_misses) then
				if has_value(options_2,"1 miss") then
					client.delay_call(5,clear_misses,t)
				end
			end
		else
			missLogs[t] = missLogs[t] + 1
			if ui.get(reset_misses) then
				if has_value(options_2,"2 miss") or has_value(options_2,"1 miss") then
					client.delay_call(5,clear_misses,t)
				end
			end
		end
	end
end)

client.set_event_callback("player_hurt", function(c)
	local i = client.userid_to_entindex(c.userid)
	if c.health == 0 then
		missLogs[i] = 0
	end
end)

client.set_event_callback("round_end", function(c)
	for i=1, 64 do
		missLogs[i] = 0
		player_preference[i] = ""
		cached_plist = nil
		closest_player = 0
	end
end)

client.set_event_callback("cs_game_disconnected", function(c) 
	ui.set(ui.reference("PLAYERS", "Players", "Reset all"), true)
	
	for i=1, 64 do
		missLogs[i] = 0
		player_preference[i] = ""
		cached_plist = nil
		closest_player = 0
	end
	
end)

client.set_event_callback("game_newmap", function(c) 
	ui.set(ui.reference("PLAYERS", "Players", "Reset all"), true)
	
	for i=1, 64 do
		missLogs[i] = 0
		player_preference[i] = ""
		cached_plist = nil
		closest_player = 0
	end
	
end)

client.set_event_callback("player_team", function(c)
	client.update_player_list()
end)

client.set_event_callback("round_prestart", function(c)
	client.update_player_list()
end)

client.set_event_callback('run_command', run_command)