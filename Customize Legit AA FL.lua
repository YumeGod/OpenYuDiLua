local duck_peek = ui.reference("RAGE", "Other", "Duck peek assist")
local yaw_target_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base")
local bodyyaw, bodyyaw_val = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local low_body = ui.reference("AA", "Anti-aimbot angles", "Lower body yaw target")
local fake_yaw = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local fakelag_value_limit = ui.reference("AA", "Fake lag", "Limit")
local slow_enabled, slowwalk_key = ui.reference("AA", "Other", "Slow motion")
local double_tap, double_tap_hotkey = ui.reference("RAGE", "Other", "Double tap")
local on_shot, on_shot_hotkey = ui.reference("AA", "Other", "On shot anti-aim")

local legit_antiaim_label = ui.new_label("AA", "Anti-aimbot angles", "--------- Legit AntiAim ---------")
local enabled_aa = ui.new_checkbox("AA", "Anti-aimbot angles", "Enabled YuDi.Lua Custom Legit Anti-Aim")
local while_condition = ui.new_combobox("AA", "Anti-aimbot angles", "While Condition","While Weapons","While Status","While Status On Weapons","While Weapons On Status")
local status_acitve_visible = ui.new_combobox("AA", "Anti-aimbot angles", "Status Selection","Standing","Moving", "Slow Motion","In Air","Crouching","Shooting")
local weapons_acitve_visible = ui.new_combobox("AA", "Anti-aimbot angles", "Weapons Selection","Auto","AWP", "Scout", "Pistol", "Rifle", "SMG", "Heavy", "R8 Revolver", "Eagle")
local invert_hotkey = ui.new_hotkey("AA", "Anti-aimbot angles", "Invert AntiAim")
local while_status_on_weapons_status = ui.new_combobox("AA", "Anti-aimbot angles", "While Status On Weapon[Status]","Standing","Moving", "Slow Motion","In Air","Crouching","Shooting")
local while_status_on_weapons_weapons = ui.new_combobox("AA", "Anti-aimbot angles", "While Status On Weapon[Weapons]","Auto","AWP", "Scout", "Pistol", "Rifle", "SMG", "Heavy", "R8 Revolver", "Eagle")
local while_weapons_on_status_weapons = ui.new_combobox("AA", "Anti-aimbot angles", "While Weapons On Status[Weapons]","Auto","AWP", "Scout", "Pistol", "Rifle", "SMG", "Heavy", "R8 Revolver", "Eagle")
local while_weapons_on_status_status = ui.new_combobox("AA", "Anti-aimbot angles", "While Weapons On Status[Status]","Standing","Moving", "Slow Motion","In Air","Crouching","Shooting")
local indicator_status = ui.new_combobox("AA", "Anti-aimbot angles", "Indicator Types","Circle","Arrows")
local arrows_types = ui.new_multiselect("AA", "Anti-aimbot angles", "Arrows Select","Draw Fake Arrows","Draw Real Arrows")
local arrows_status = ui.new_combobox("AA", "Anti-aimbot angles", "Arrows Types", "Default", "Triangle", "Circle Arrows", "Fish Spear", "Pair Arrows", "Pair Arrows 2", "Barroom", "Classic", "OneTap V2", "TranSparent", "Round", "Dick", "Square", "Stars", "Caresses", "Carabiner", "Special", "Crooked Arrow", "Circle", "Ribbon 1", "Ribbon 2", "Ribbon 3", "Ribbon 4", "Shadows", "Double Arrows", "Misc", "Mathematical Arrow", "Cross Arrowhead", "Triangles Arrows", "Triangles Arrows 2")
local arrow_distance = ui.new_slider("AA", "Anti-aimbot angles", "Arrow distance", 0, 100, 10 ,true, "%")
local arrows_rgb = ui.new_multiselect("AA", "Anti-aimbot angles", "RGB Arrows Types", "Fake Arrows", "Real Arrows")
local real_arrows_label = ui.new_label("AA", "Anti-aimbot angles", "Real Arrows Color")
local real_arrows_p = ui.new_color_picker("AA", "Anti-aimbot angles", "Real Color_S", 255, 255, 255, 255)
local fake_arrows_label = ui.new_label("AA", "Anti-aimbot angles", "Fake Arrows Color")
local fake_arrows_p = ui.new_color_picker("AA", "Anti-aimbot angles", "Fake Color_S", 0, 255, 255, 255)
local circle_color_label = ui.new_label("AA", "Anti-aimbot angles", "Circle Color")
local circle_color_p = ui.new_color_picker("AA", "Anti-aimbot angles", "Circle Color_S", 0, 115, 255, 255)
local fakelag_resert = ui.new_checkbox("AA", "Anti-aimbot angles", "Fakelag Cohke Cycle Resert")
local lby_status_ref = ui.new_combobox("AA", "Anti-aimbot angles", "Lua-Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break")
local lby_break_speed_ref = ui.new_slider("AA", "Anti-aimbot angles", "Lua-Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1)
local jitter_min_ref = ui.new_slider("AA", "Anti-aimbot angles", "Jitter Minimum FakeYaw", 0, 60, 60, true,"°", 1)
local jitter_max_ref = ui.new_slider("AA", "Anti-aimbot angles", "Jitter Maximum FakeYaw", 0, 60, 60, true,"°", 1)
local enabled_swap_aa = ui.new_checkbox("AA", "Anti-aimbot angles", "Enabled Legit AntiAim Swap")
local swap_status = ui.new_combobox("AA", "Anti-aimbot angles", "AntiAim Swap Types","Coincide Swap","UnCoincide Swap")
local coincide_swap = ui.new_combobox("AA", "Anti-aimbot angles", "Coincide Swap Types","Half-Standing Swap","Full-Standing Swap")
local swap_hotkey = ui.new_hotkey("AA", "Anti-aimbot angles", "Swap AntiAim Coder")
local unhide_debug_menu = ui.new_checkbox("AA", "Anti-aimbot angles", "UnHide Debug Menu")
local antibrute_select = ui.new_multiselect("AA", "Anti-aimbot angles", "Anti Brute Force", "On Hurt", "On Miss")
local enabled_legit_fakelag = ui.new_checkbox("AA", "Fake lag", "Enabled YuDi.Lua Legit Fakelag")
local fakelag_typs = ui.new_combobox("AA", "Fake lag", "Legit Fakelag","YDL Condiction","On Peek Lag")
local fakelag_send_packet_trigger = ui.new_multiselect("AA", "Fake lag", "Fakelag Triggers Settings", {"On Standing", "While Moving", "On Duck", "On High Speed", "On Jump", "On Exploit", "On Use", "On Freezetime", "Weapon Switch", "Weapon Reload", "Weapon Fired", "On Land", "While Climbing Ladder"})
local alter_fakelag_typs = ui.new_combobox("AA", "Fake lag", "YDL Fakelag","Adaptive","Factor","Fluctuate","Maximum")
local alter_normal_lag = ui.new_slider("AA", "Fake lag", "Normal Limit", 1, 14, 5 ,true)
local alter_send_lag = ui.new_slider("AA", "Fake lag", "Send Limit", 1, 14, 1 ,true)
local alter_maximum_lag = ui.new_slider("AA", "Fake lag", "Maximum Limit", 1, 14, 6 ,true)
local peek_fakelag_limit = ui.new_slider("AA", "Fake lag", "On Peek Limit", 1, 14, 6, true)
local enabled_fluctuate_shooting = ui.new_checkbox("AA", "Fake lag", "Enabled Fired Fakelag Limit")
local fluctuate_shooting_limit = ui.new_slider("AA", "Fake lag", "While Fired Fakelag Limit", 1, 14, 1 ,true)
ui.set_visible(jitter_min_ref,false)
ui.set_visible(jitter_max_ref,false)
ui.set_visible(lby_break_speed_ref,false)
ui.set_visible(lby_status_ref,false)
ui.set_visible(fakelag_resert,false)
ui.set(invert_hotkey,"Toggle")
ui.set(yaw_target_base,"Local view")
require("bit")

local shot_circle, rv_circle = 0, 0
local fix_out, fix_in, time_fix = -0.42, 0, 0

local player_active_weapons = {
    ["AWP"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },

    ["Auto"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },


    ["Scout"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },


    ["Rifle"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },


    ["SMG"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },


    ["Heavy"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },


    ["Pistol"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },


    ["R8 Revolver"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },


    ["Eagle"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },
}

local player_status_cond = {
    ["Standing"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },

    ["Moving"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },



    ["Slow Motion"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },


    ["In Air"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },

    ["Crouching"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },

    ["Shooting"] = {
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]Body Yaw","Static","Jitter","Opposite"),
        ["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
    },
}


local on_status_weapons = {
    ["Standing"] = {
	["AWP"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-AWP]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-AWP]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-AWP]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-AWP]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-AWP]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-AWP]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Auto"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Auto]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Auto]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Auto]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Auto]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Auto]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Auto]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Scout"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Scout]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Scout]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Scout]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Scout]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Scout]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Scout]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Rifle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Rifle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Rifle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Rifle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Rifle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Rifle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Rifle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["SMG"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-SMG]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-SMG]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-SMG]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-SMG]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-SMG]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-SMG]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Heavy"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Heavy]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Heavy]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Heavy]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Heavy]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Heavy]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Heavy]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Pistol"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Pistol]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Pistol]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Pistol]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Pistol]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Pistol]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Pistol]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["R8 Revolver"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-R8 Revolver]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-R8 Revolver]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-R8 Revolver]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-R8 Revolver]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-R8 Revolver]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-R8 Revolver]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Eagle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Eagle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Eagle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing-Eagle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Eagle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Eagle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Eagle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["Moving"] = {
	["AWP"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-AWP]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-AWP]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-AWP]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-AWP]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-AWP]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-AWP]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Auto"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Auto]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Auto]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Auto]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing-Auto]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Auto]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Auto]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Scout"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Scout]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Scout]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Scout]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Scout]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Scout]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Scout]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Rifle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Rifle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Rifle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Rifle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Rifle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Rifle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Rifle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["SMG"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-SMG]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-SMG]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-SMG]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-SMG]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-SMG]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-SMG]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Heavy"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Heavy]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Heavy]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Heavy]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Heavy]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Heavy]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Heavy]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Pistol"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Pistol]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Pistol]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Pistol]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Pistol]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Pistol]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Pistol]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["R8 Revolver"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-R8 Revolver]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-R8 Revolver]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-R8 Revolver]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-R8 Revolver]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-R8 Revolver]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-R8 Revolver]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Eagle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Eagle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Eagle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving-Eagle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Eagle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Eagle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving-Eagle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["Slow Motion"] = {
	["AWP"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-AWP]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-AWP]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-AWP]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-AWP]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-AWP]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-AWP]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Auto"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Auto]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Auto]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Auto]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Auto]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Auto]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Auto]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Scout"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Scout]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Scout]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Scout]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Scout]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Scout]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Scout]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Rifle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Rifle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Rifle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Rifle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Rifle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Rifle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Rifle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["SMG"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-SMG]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-SMG]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-SMG]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-SMG]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-SMG]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-SMG]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Heavy"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Heavy]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Heavy]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Heavy]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Heavy]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Heavy]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Heavy]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Pistol"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Pistol]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Pistol]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Pistol]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Pistol]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Pistol]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Pistol]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["R8 Revolver"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-R8 Revolver]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-R8 Revolver]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-R8 Revolver]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-R8 Revolver]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-R8 Revolver]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-R8 Revolver]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Eagle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Eagle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Eagle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion-Eagle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Eagle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Eagle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion-Eagle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["In Air"] = {
	["AWP"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-AWP]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-AWP]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-AWP]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-AWP]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-AWP]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-AWP]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Auto"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Auto]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Auto]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Auto]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Auto]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Auto]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Auto]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Scout"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Scout]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Scout]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Scout]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Scout]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Scout]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Scout]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Rifle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Rifle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Rifle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Rifle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Rifle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Rifle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Rifle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["SMG"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-SMG]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-SMG]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-SMG]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-SMG]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-SMG]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-SMG]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Heavy"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Heavy]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Heavy]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Heavy]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Heavy]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Heavy]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Heavy]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Pistol"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Pistol]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Pistol]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Pistol]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Pistol]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Pistol]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Pistol]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["R8 Revolver"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-R8 Revolver]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-R8 Revolver]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-R8 Revolver]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-R8 Revolver]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-R8 Revolver]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-R8 Revolver]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Eagle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Eagle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Eagle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air-Eagle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Eagle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Eagle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air-Eagle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },

    ["Crouching"] = {
	["AWP"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-AWP]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-AWP]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-AWP]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-AWP]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-AWP]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-AWP]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Auto"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Auto]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Auto]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Auto]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Auto]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Auto]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Auto]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Scout"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Scout]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Scout]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Scout]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Scout]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Scout]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Scout]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Rifle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Rifle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Rifle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Rifle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Rifle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Rifle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Rifle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["SMG"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-SMG]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-SMG]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-SMG]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-SMG]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-SMG]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-SMG]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Heavy"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Heavy]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Heavy]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Heavy]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Heavy]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Heavy]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Heavy]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Pistol"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Pistol]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Pistol]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Pistol]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Pistol]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Pistol]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Pistol]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["R8 Revolver"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-R8 Revolver]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-R8 Revolver]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-R8 Revolver]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-R8 Revolver]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-R8 Revolver]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-R8 Revolver]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Eagle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Eagle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Eagle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching-Eagle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Eagle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Eagle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching-Eagle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },

    ["Shooting"] = {
	["AWP"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-AWP]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-AWP]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-AWP]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-AWP]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-AWP]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-AWP]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Auto"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Auto]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Auto]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Auto]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Auto]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Auto]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Auto]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Scout"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Scout]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Scout]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Scout]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Scout]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Scout]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Scout]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Rifle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Rifle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Rifle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Rifle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Rifle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Rifle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Rifle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["SMG"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-SMG]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-SMG]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-SMG]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-SMG]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-SMG]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-SMG]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Heavy"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Heavy]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Heavy]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Heavy]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Heavy]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Heavy]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Heavy]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Pistol"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Pistol]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Pistol]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Pistol]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Pistol]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Pistol]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Pistol]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["R8 Revolver"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-R8 Revolver]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-R8 Revolver]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-R8 Revolver]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-R8 Revolver]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-R8 Revolver]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-R8 Revolver]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Eagle"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Eagle]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Eagle]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting-Eagle]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Eagle]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Eagle]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting-Eagle]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
        },
}



local on_weapon_status = {
    ["AWP"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[AWP-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[AWP-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["Auto"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Auto-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Auto-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["Scout"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Scout-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Scout-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["Rifle"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Rifle-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Rifle-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["SMG"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[SMG-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[SMG-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["Heavy"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Heavy-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Heavy-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["Pistol"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Pistol-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Pistol-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["R8 Revolver"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[R8 Revolver-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[R8 Revolver-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
    },


    ["Eagle"] = {
	["Standing"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Standing]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Standing]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Standing]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Standing]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Standing]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Standing]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Moving"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Moving]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Moving]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Moving]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Moving]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Moving]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Moving]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["Slow Motion"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Slow Motion]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Slow Motion]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Slow Motion]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Slow Motion]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
 		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Slow Motion]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Slow Motion]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},


	["In Air"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-In Air]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-In Air]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-In Air]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-In Air]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-In Air]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-In Air]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Crouching"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Crouching]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Crouching]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Crouching]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
 		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Crouching]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Crouching]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Crouching]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},

	["Shooting"] = {
		["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Shooting]Body Yaw","Static","Jitter","Opposite"),
		["bodyyaw"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Shooting]Body Yaw Slider", -180, 180, 90, true,"°", 1),
		["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Eagle-Shooting]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
		["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Shooting]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
		["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Shooting]Fake Limit Min", 0, 60, 60, true,"°", 1),
		["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[Eagle-Shooting]Fake Limit Max", 0, 60, 60, true,"°", 1),
	},
       },
}


local player_brute_cond = {
    ["On Miss"] = {
        ["first_label"] = ui.new_label("AA", "Anti-aimbot angles", "----------------- Anti Brute Force ----------------"),
        ["first_label_2"] = ui.new_label("AA", "Anti-aimbot angles", "----------------- On Miss ----------------"),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Miss]Body Yaw","Static","Jitter","Opposite"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Miss]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Miss]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Miss]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Miss]Fake Limit Max", 0, 60, 60, true,"°", 1),
        ["delay_return"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Miss]X/M Return Normal", 1, 5, 1, true,"m", 1),
        ["first_label_3"] = ui.new_label("AA", "Anti-aimbot angles", "----------------- Anti Brute Force ----------------"),
    },

    ["On Hurt"] = {
        ["first_label_3"] = ui.new_label("AA", "Anti-aimbot angles", "----------------- Anti Brute Force ----------------"),
        ["first_label_2"] = ui.new_label("AA", "Anti-aimbot angles", "----------------- On Hurt ----------------"),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Hurt]Body Yaw","Static","Jitter","Opposite"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Hurt]Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite","Lua-Half Sway","Lua-Full Sway","Lua-Break"),
        ["lby_break_speed"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Hurt]Lower Body Yaw Break Speed", 0, 100, 50, true,"°", 1),
        ["jitter_min"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Hurt]Fake Limit Min", 0, 60, 60, true,"°", 1),
        ["jitter_max"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Hurt]Fake Limit Max", 0, 60, 60, true,"°", 1),
        ["delay_return"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Hurt]X/M Return Normal", 1, 5, 1, true,"m", 1),
        ["first_label"] = ui.new_label("AA", "Anti-aimbot angles", "----------------- Anti Brute Force ----------------"),
    }
}

local function table_contains(search_table, search_value)
	for _, table_value in pairs(search_table) do
		if (search_value == table_value) then
			return true
		end
	end

	return false
end

local function hsv_to_rgb(h, s, v, a)
    local r, g, b

    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);

    i = i % 6

    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end
  
    return r * 255, g * 255, b * 255, a * 255
end

local function func_rgb_rainbowize(frequency, rgb_split_ratio)
    local r, g, b, a = hsv_to_rgb(globals.realtime() * frequency, 1, 1, 1)

    r = r * rgb_split_ratio
    g = g * rgb_split_ratio
    b = b * rgb_split_ratio

    return r, g, b
end

local function visible_table(val, bool)
	for key, v in pairs(val) do
		ui.set_visible(v, bool)
	end
end

local lag_info = {
    current_phase = 1,
    prev_choked = 15
}


local resert_shift ={{
	lag_break_cycle = true
},
{
	lag_break_cycle = false
}
}

client.set_event_callback("setup_command", function(cmd)
	if not ui.get(enabled_aa) then
		return
	end

	local localplayer = entity.get_local_player()
	local _vx, _vy = entity.get_prop(localplayer, "m_vecVelocity")
	local velocity = math.sqrt(_vx^2 + _vy^2) 

	if cmd.chokedcommands < lag_info.prev_choked then
		lag_info.current_phase = lag_info.current_phase + 1
		if lag_info.current_phase > #resert_shift then
			lag_info.current_phase = 1
		end
	end

	ui.set(fakelag_resert, resert_shift[lag_info.current_phase].lag_break_cycle)
	lag_info.prev_choked = cmd.chokedcommands

	if ui.get(duck_peek) then
		cmd.allow_send_packet = false
		return
	end
end)

local player_hurt = false
local player_miss = false
local it = 0
local alter_lag_pack = 1

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

local function syr_visible_enemy(ctx)
	local local_entindex = entity.get_local_player()
	if entity.get_prop(local_entindex, "m_lifeState") ~= 0 then	
		syr_weapon_visible = false
		return
	end
	
	local enemy_visible, enemy_entindex = check_fov(ctx)
	if enemy_entindex == nil or not ui.get(enabled_legit_fakelag) or ui.get(fakelag_typs) == "YDL Condiction" then
		return
	end
	
	if enemy_visible and enemy_entindex ~= nil and stored_target ~= enemy_entindex then
		stored_target = enemy_entindex
	end

	local enemy_player_number = entity.get_players(true)
	local enemy_visible = true
	if entity.get_prop(enemy_player_number, "m_lifeState") == 0 then	
		enemy_visible = false
	end

	local visible = can_see(enemy_entindex)
	if enemy_visible then
		syr_weapon_visible = visible and true or false
	else
		syr_weapon_visible = false
	end

	stored_target = enemy_entindex
	local x, y = client.screen_size()
	renderer.text(x / 2 + 100 , y / 2 + 40, 147, 122, 220, ui.get(enabled_aa) and ui.get(fakelag_value_limit) == ui.get(peek_fakelag_limit) and 255 or 0 or 0, "c", 0, ui.get(duck_peek) and "Fake Duck" or "On Peeking")
end

client.set_event_callback("paint",syr_visible_enemy)

client.set_event_callback("player_hurt", function(e)
	if not entity.is_alive(entity.get_local_player()) then
		return
	end

	local attacker_name = client.userid_to_entindex(e.attacker)
	local attacker_user = client.userid_to_entindex(e.userid)
	return_delay_time_2 = player_brute_cond["On Hurt"]

	if attacker_user == entity.get_local_player() and entity.is_enemy(attacker_name) then
		player_hurt = true
		client.delay_call(ui.get(return_delay_time_2["delay_return"]), function(c)
			player_hurt = false
		end)
	end
end)

local get_closeset_point = function(a, b, p)
	local a_to_p = { p[1] - a[1], p[2] - a[2] }
	local a_to_b = { b[1] - a[1], b[2] - a[2] }
	local atb2 = a_to_b[1]^2 + a_to_b[2]^2
	local atp_dot_atb = a_to_p[1]*a_to_b[1] + a_to_p[2]*a_to_b[2]
	local t = atp_dot_atb / atb2
	return { a[1] + a_to_b[1]*t, a[2] + a_to_b[2]*t }
end

local on_bullet_impact = function(c)
	if not entity.is_alive(entity.get_local_player()) then
		return
	end

	local ent = client.userid_to_entindex(c.userid)
	if not entity.is_dormant(ent) and entity.is_enemy(ent) then
		local ent_shoot = { entity.get_prop(ent, "m_vecOrigin") }
		ent_shoot[3] = ent_shoot[3] + entity.get_prop(ent, "m_vecViewOffset[2]")
		local player_head = { entity.hitbox_position(entity.get_local_player(), 0) }
		local closest = get_closeset_point(ent_shoot, { c.x, c.y, c.z }, player_head)
		local delta = { player_head[1]-closest[1], player_head[2]-closest[2] }
		local delta_2d = math.sqrt(delta[1]^2+delta[2]^2)
        
		if math.abs(delta_2d) < 125 then
			it = it + 1

			if player_miss == true then
				player_miss = false
			else
				player_miss = true
			end
		end
	end
end

client.set_event_callback("bullet_impact", on_bullet_impact)

client.set_event_callback("paint", function(c)
	if player_miss == true then
		return_delay_time = player_brute_cond["On Miss"]
		client.delay_call(ui.get(return_delay_time["delay_return"]), function(e)
			player_miss = false
		end)
	end

	if player_hurt == true or player_miss == true then
		anti_brute_swap = true
	else
		anti_brute_swap = false
	end


	if anti_brute_swap == true and player_hurt == true and player_miss == false then
		antibrute_cond = "Player Hurt"
		antibrute_cond_menu = "On Hurt"
	elseif anti_brute_swap == true and player_miss == true and player_hurt == false then
		antibrute_cond = "Player Miss"
		antibrute_cond_menu = "On Miss"
	end
end)

local function player_weapons(c)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(enabled_aa) or anti_brute_swap == true then
		return
	end

	local active_weapon = entity.get_prop(local_player, "m_hActiveWeapon")
	if active_weapon == nil then
		return
	end

	local weapon_real_active = entity.get_prop(active_weapon, "m_iItemDefinitionIndex")
	if weapon_real_active == nil then
		return
	end

	local active_weapons_coder = bit.band(weapon_real_active, 0xFFFF)
	if active_weapons_coder == 11 or active_weapons_coder == 38 then
		real_active_weapons = "Auto"
	elseif active_weapons_coder == 9 then
		real_active_weapons = "AWP"
	elseif active_weapons_coder == 40 then
		real_active_weapons = "Scout"
	elseif active_weapons_coder == 2 or active_weapons_coder == 3 or active_weapons_coder == 4 or active_weapons_coder == 30 or active_weapons_coder == 32 or active_weapons_coder == 36 or active_weapons_coder == 61 or active_weapons_coder == 63 then
		real_active_weapons = "Pistol"
	elseif active_weapons_coder == 7 or active_weapons_coder == 8  or active_weapons_coder == 10 or active_weapons_coder == 13 or active_weapons_coder == 16 or active_weapons_coder == 39 then
		real_active_weapons = "Rifle"
	elseif active_weapons_coder == 17 or active_weapons_coder == 19  or active_weapons_coder == 24 or active_weapons_coder == 26 or active_weapons_coder == 33 or active_weapons_coder == 34 then
		real_active_weapons = "SMG"
	elseif active_weapons_coder == 64 then
		real_active_weapons = "R8 Revolver"
	elseif active_weapons_coder == 1 then
		real_active_weapons = "Eagle"
	elseif active_weapons_coder == 14 or active_weapons_coder == 28 then
		real_active_weapons = "Heavy"
	end
end

client.set_event_callback("paint", player_weapons)

local function player_condition(c)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(enabled_aa) or anti_brute_swap == true then
		return
	end

	local active_weapon = entity.get_prop(local_player, "m_hActiveWeapon")
	if active_weapon == nil then
		return
	end

	local weapon_real_active = entity.get_prop(active_weapon, "m_iItemDefinitionIndex")
	if weapon_real_active == nil then
		return
	end

	local real_active_weapons = "Auto"
	local active_weapons_coder = bit.band(weapon_real_active, 0xFFFF)
	if active_weapons_coder == 11 or active_weapons_coder == 38 then
		real_active_weapons = "Auto"
	elseif active_weapons_coder == 9 then
		real_active_weapons = "AWP"
	elseif active_weapons_coder == 40 then
		real_active_weapons = "Scout"
	elseif active_weapons_coder == 2 or active_weapons_coder == 3 or active_weapons_coder == 4 or active_weapons_coder == 30 or active_weapons_coder == 32 or active_weapons_coder == 36 or active_weapons_coder == 61 or active_weapons_coder == 63 then
		real_active_weapons = "Pistol"
	elseif active_weapons_coder == 7 or active_weapons_coder == 8  or active_weapons_coder == 10 or active_weapons_coder == 13 or active_weapons_coder == 16 or active_weapons_coder == 39 then
		real_active_weapons = "Rifle"
	elseif active_weapons_coder == 17 or active_weapons_coder == 19  or active_weapons_coder == 24 or active_weapons_coder == 26 or active_weapons_coder == 33 or active_weapons_coder == 34 then
		real_active_weapons = "SMG"
	elseif active_weapons_coder == 64 then
		real_active_weapons = "R8 Revolver"
	elseif active_weapons_coder == 1 then
		real_active_weapons = "Eagle"
	elseif active_weapons_coder == 14 or active_weapons_coder == 28 then
		real_active_weapons = "Heavy"
	end

	local vx, vy, vz = entity.get_prop(local_player, "m_vecVelocity")
	local fl_speed = math.sqrt((vx * vx) + (vy * vy))
	local onground = (bit.band(entity.get_prop(local_player, "m_fFlags"), 1) == 1)
	local infiniteduck = (bit.band(entity.get_prop(local_player, "m_fFlags"), 2) == 2)
	local weapon = entity.get_player_weapon(local_player)
	local m_next_attack = entity.get_prop(weapon, "m_flNextPrimaryAttack")
	local m_tickbase = entity.get_prop(local_player, "m_nTickBase")
	local shooting_ready = (m_next_attack <= m_tickbase * globals.tickinterval() - 0.12)
	local slowwalking = ui.get(slow_enabled) and ui.get(slowwalk_key)

	if fl_speed < 5 and not slowwalking and onground and not infiniteduck and shooting_ready == true then 
		Player_State = "Standing"
		adaptive_lag = 3
	elseif fl_speed > 2 and not slowwalking and onground and not infiniteduck and shooting_ready == true then
		Player_State = "Moving"
		adaptive_lag = 6
	elseif fl_speed > 2 and slowwalking and onground and not infiniteduck and shooting_ready == true then
		Player_State = "Slow Motion"
		adaptive_lag = 5
	elseif not onground then
		Player_State = "In Air"
		adaptive_lag = 6
	elseif infiniteduck and onground and shooting_ready == true then
		Player_State = "Crouching"
		adaptive_lag = 6
	elseif shooting_ready == false and onground then
		Player_State = "Shooting"
		adaptive_lag = 3
	end

	if ui.get(while_condition) == "While Weapons" then
		active_selection = player_active_weapons[real_active_weapons]
	elseif ui.get(while_condition) == "While Status" then
		active_selection = player_status_cond[Player_State]
	elseif ui.get(while_condition) == "While Status On Weapons" then
		active_selection = on_status_weapons[Player_State][real_active_weapons]
	elseif ui.get(while_condition) == "While Weapons On Status" then
		active_selection = on_weapon_status[real_active_weapons][Player_State]
	end

	if ui.get(bodyyaw_val) == "Opposite" then
		local body_pos = entity.get_prop(local_player, "m_flPoseParameter", 11)
		local body_yaw = math.max(-60, math.min(60, body_pos*120-60+0.5))
		local realbody_yaw = body_yaw / 60 * 100
		body_yaw_target = Player_State == "Shooting" and -realbody_yaw or realbody_yaw
	else
		body_yaw_target = ui.get(bodyyaw_val)
	end

	ui.set(lby_status_ref,ui.get(active_selection["lby_status"]))
	ui.set(lby_break_speed_ref,ui.get(active_selection["lby_break_speed"]))
	ui.set(jitter_min_ref,ui.get(active_selection["jitter_min"]))
	ui.set(jitter_max_ref,ui.get(active_selection["jitter_max"]))

	if ui.get(enabled_swap_aa) and ui.get(swap_hotkey) and Player_State == "Standing" and ui.get(swap_status) == "Coincide Swap" then
		local coincide_lby = globals.tickcount() % 100 > 1 and globals.tickcount() % 100 < 50 and "Eye yaw" or "Opposite"
		swap_lby_coincide = ui.get(coincide_swap) == "Half-Standing Swap" and coincide_lby or "Sway"
		ui.set(low_body,swap_lby_coincide)
		return
	end

	if ui.get(lby_status_ref) == "Lua-Half Sway" then
		ui.set(low_body,globals.tickcount() % 100 > 1 and globals.tickcount() % 100 < ui.get(lby_break_speed_ref) and "Eye yaw" or "Opposite")
	elseif ui.get(lby_status_ref) == "Lua-Full Sway" then
		ui.set(low_body,globals.tickcount() % 100 > 1 and globals.tickcount() % 100 < ui.get(lby_break_speed_ref) and "Sway" or "Opposite")
	elseif ui.get(lby_status_ref) == "Lua-Break" then
		ui.set(low_body,globals.tickcount() % 100 > 1 and globals.tickcount() % 100 < ui.get(lby_break_speed_ref) and "Eye yaw" or "Opposite")
	elseif ui.get(lby_status_ref) == "Off" then
		ui.set(low_body,"Off")
	elseif ui.get(lby_status_ref) == "Sway" then
		ui.set(low_body,"Sway")
	elseif ui.get(lby_status_ref) == "Eye yaw" then
		ui.set(low_body,"Eye yaw")
	elseif ui.get(lby_status_ref) == "Opposite" then
		ui.set(low_body,"Opposite")
	end
end

client.set_event_callback("paint", player_condition)

client.set_event_callback("predict_command", function()
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(enabled_aa) then
		return
	end

	if ui.get(lby_status_ref) == "Lua-Break" then
    		entity.set_prop(local_player, "m_flPoseParameter", body_yaw_target >= 1 and -100 or 100, 11)
	end
end)

local function legitaa_subject(c)
	ui.set_visible(enabled_fluctuate_shooting, ui.get(enabled_aa) and ui.get(enabled_legit_fakelag))
	ui.set_visible(fluctuate_shooting_limit, ui.get(enabled_aa) and ui.get(enabled_legit_fakelag) and ui.get(enabled_fluctuate_shooting))

	if not ui.get(enabled_aa) then
		ui.set(yaw_target_base,"Local view")
		ui.set(bodyyaw,"Off")
		ui.set(bodyyaw_val,0)
		ui.set(low_body,"Off")
		ui.set(fake_yaw,0)
		ui.set_visible(yaw_target_base,true)
		ui.set_visible(bodyyaw,true)
		ui.set_visible(bodyyaw_val,true)
		ui.set_visible(low_body,true)
		ui.set_visible(fake_yaw,true)
		ui.set_visible(arrows_rgb,false)
		ui.set_visible(legit_antiaim_label,false)
		ui.set_visible(alter_fakelag_typs, false)
		ui.set_visible(alter_normal_lag, false)
		ui.set_visible(alter_send_lag, false)
		ui.set_visible(alter_maximum_lag, false)
		ui.set_visible(invert_hotkey,false)
		ui.set_visible(indicator_status,false)
		ui.set_visible(arrows_status,false)
		ui.set_visible(circle_color_label,false)
		ui.set_visible(circle_color_p,false)
		ui.set_visible(arrow_distance,false)
		ui.set_visible(real_arrows_label,false)
		ui.set_visible(real_arrows_p,false)
		ui.set_visible(fake_arrows_label,false)
		ui.set_visible(fake_arrows_p,false)
		ui.set_visible(while_condition,false)
		ui.set_visible(weapons_acitve_visible,false)
		ui.set_visible(status_acitve_visible,false)
		ui.set_visible(swap_hotkey,false)
		ui.set_visible(enabled_swap_aa,false)
		ui.set_visible(swap_status,false)
		ui.set_visible(unhide_debug_menu,false)
		ui.set_visible(enabled_legit_fakelag,false)
		ui.set_visible(fakelag_send_packet_trigger,false)
		ui.set_visible(fakelag_typs,false)
		ui.set_visible(coincide_swap,false)
		ui.set_visible(arrows_types,false)
		ui.set_visible(antibrute_select,false)
		ui.set_visible(peek_fakelag_limit,false)
		ui.set_visible(fakelag_send_packet_trigger, false)
		ui.set_visible(while_status_on_weapons_status,false)
		ui.set_visible(while_status_on_weapons_weapons,false)
		ui.set_visible(while_weapons_on_status_weapons,false)
		ui.set_visible(while_weapons_on_status_status,false)
		visible_table(player_active_weapons["Auto"], false)
		visible_table(player_active_weapons["AWP"], false)
		visible_table(player_active_weapons["Scout"], false)
		visible_table(player_active_weapons["Pistol"], false)
		visible_table(player_active_weapons["Rifle"], false)
		visible_table(player_active_weapons["SMG"], false)
		visible_table(player_active_weapons["Heavy"], false)
		visible_table(player_active_weapons["R8 Revolver"], false)
		visible_table(player_active_weapons["Eagle"], false)
		visible_table(player_status_cond["Standing"], false)
		visible_table(player_status_cond["Moving"], false)
		visible_table(player_status_cond["Crouching"], false)
		visible_table(player_status_cond["In Air"], false)
		visible_table(player_status_cond["Slow Motion"], false)
		visible_table(player_status_cond["Shooting"], false)
		visible_table(on_weapon_status["AWP"]["Standing"], false)
		visible_table(on_weapon_status["Auto"]["Standing"], false)
		visible_table(on_weapon_status["Scout"]["Standing"], false)
		visible_table(on_weapon_status["Rifle"]["Standing"], false)
		visible_table(on_weapon_status["SMG"]["Standing"], false)
		visible_table(on_weapon_status["Heavy"]["Standing"], false)
		visible_table(on_weapon_status["Pistol"]["Standing"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Standing"], false)
		visible_table(on_weapon_status["Eagle"]["Standing"], false)
		visible_table(on_weapon_status["AWP"]["Moving"], false)
		visible_table(on_weapon_status["Auto"]["Moving"], false)
		visible_table(on_weapon_status["Scout"]["Moving"], false)
		visible_table(on_weapon_status["Rifle"]["Moving"], false)
		visible_table(on_weapon_status["SMG"]["Moving"], false)
		visible_table(on_weapon_status["Heavy"]["Moving"], false)
		visible_table(on_weapon_status["Pistol"]["Moving"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Moving"], false)
		visible_table(on_weapon_status["Eagle"]["Moving"], false)
		visible_table(on_weapon_status["AWP"]["Slow Motion"], false)
		visible_table(on_weapon_status["Auto"]["Slow Motion"], false)
		visible_table(on_weapon_status["Scout"]["Slow Motion"], false)
		visible_table(on_weapon_status["Rifle"]["Slow Motion"], false)
		visible_table(on_weapon_status["SMG"]["Slow Motion"], false)
		visible_table(on_weapon_status["Heavy"]["Slow Motion"], false)
		visible_table(on_weapon_status["Pistol"]["Slow Motion"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Slow Motion"], false)
		visible_table(on_weapon_status["Eagle"]["Slow Motion"], false)
		visible_table(on_weapon_status["AWP"]["In Air"], false)
		visible_table(on_weapon_status["Auto"]["In Air"], false)
		visible_table(on_weapon_status["Scout"]["In Air"], false)
		visible_table(on_weapon_status["Rifle"]["In Air"], false)
		visible_table(on_weapon_status["SMG"]["In Air"], false)
		visible_table(on_weapon_status["Heavy"]["In Air"], false)
		visible_table(on_weapon_status["Pistol"]["In Air"], false)
		visible_table(on_weapon_status["R8 Revolver"]["In Air"], false)
		visible_table(on_weapon_status["Eagle"]["In Air"], false)
		visible_table(on_weapon_status["AWP"]["Crouching"], false)
		visible_table(on_weapon_status["Auto"]["Crouching"], false)
		visible_table(on_weapon_status["Scout"]["Crouching"], false)
		visible_table(on_weapon_status["Rifle"]["Crouching"], false)
		visible_table(on_weapon_status["SMG"]["Crouching"], false)
		visible_table(on_weapon_status["Heavy"]["Crouching"], false)
		visible_table(on_weapon_status["Pistol"]["Crouching"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Crouching"], false)
		visible_table(on_weapon_status["Eagle"]["Crouching"], false)
		visible_table(on_weapon_status["AWP"]["Shooting"], false)
		visible_table(on_weapon_status["Auto"]["Shooting"], false)
		visible_table(on_weapon_status["Scout"]["Shooting"], false)
		visible_table(on_weapon_status["Rifle"]["Shooting"], false)
		visible_table(on_weapon_status["SMG"]["Shooting"], false)
		visible_table(on_weapon_status["Heavy"]["Shooting"], false)
		visible_table(on_weapon_status["Pistol"]["Shooting"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Shooting"], false)
		visible_table(on_weapon_status["Eagle"]["Shooting"], false)
		visible_table(on_status_weapons["Standing"]["AWP"], false)
		visible_table(on_status_weapons["Standing"]["Auto"], false)
		visible_table(on_status_weapons["Standing"]["Scout"], false)
		visible_table(on_status_weapons["Standing"]["Rifle"], false)
		visible_table(on_status_weapons["Standing"]["SMG"], false)
		visible_table(on_status_weapons["Standing"]["Heavy"], false)
		visible_table(on_status_weapons["Standing"]["Pistol"], false)
		visible_table(on_status_weapons["Standing"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Standing"]["Eagle"], false)
		visible_table(on_status_weapons["Moving"]["AWP"], false)
		visible_table(on_status_weapons["Moving"]["Auto"], false)
		visible_table(on_status_weapons["Moving"]["Scout"], false)
		visible_table(on_status_weapons["Moving"]["Rifle"], false)
		visible_table(on_status_weapons["Moving"]["SMG"], false)
		visible_table(on_status_weapons["Moving"]["Heavy"], false)
		visible_table(on_status_weapons["Moving"]["Pistol"], false)
		visible_table(on_status_weapons["Moving"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Moving"]["Eagle"], false)
		visible_table(on_status_weapons["Slow Motion"]["AWP"], false)
		visible_table(on_status_weapons["Slow Motion"]["Auto"], false)
		visible_table(on_status_weapons["Slow Motion"]["Scout"], false)
		visible_table(on_status_weapons["Slow Motion"]["Rifle"], false)
		visible_table(on_status_weapons["Slow Motion"]["SMG"], false)
		visible_table(on_status_weapons["Slow Motion"]["Heavy"], false)
		visible_table(on_status_weapons["Slow Motion"]["Pistol"], false)
		visible_table(on_status_weapons["Slow Motion"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Slow Motion"]["Eagle"], false)
		visible_table(on_status_weapons["In Air"]["AWP"], false)
		visible_table(on_status_weapons["In Air"]["Auto"], false)
		visible_table(on_status_weapons["In Air"]["Scout"], false)
		visible_table(on_status_weapons["In Air"]["Rifle"], false)
		visible_table(on_status_weapons["In Air"]["SMG"], false)
		visible_table(on_status_weapons["In Air"]["Heavy"], false)
		visible_table(on_status_weapons["In Air"]["Pistol"], false)
		visible_table(on_status_weapons["In Air"]["R8 Revolver"], false)
		visible_table(on_status_weapons["In Air"]["Eagle"], false)
		visible_table(on_status_weapons["Crouching"]["AWP"], false)
		visible_table(on_status_weapons["Crouching"]["Auto"], false)
		visible_table(on_status_weapons["Crouching"]["Scout"], false)
		visible_table(on_status_weapons["Crouching"]["Rifle"], false)
		visible_table(on_status_weapons["Crouching"]["SMG"], false)
		visible_table(on_status_weapons["Crouching"]["Heavy"], false)
		visible_table(on_status_weapons["Crouching"]["Pistol"], false)
		visible_table(on_status_weapons["Crouching"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Crouching"]["Eagle"], false)
		visible_table(on_status_weapons["Shooting"]["AWP"], false)
		visible_table(on_status_weapons["Shooting"]["Auto"], false)
		visible_table(on_status_weapons["Shooting"]["Scout"], false)
		visible_table(on_status_weapons["Shooting"]["Rifle"], false)
		visible_table(on_status_weapons["Shooting"]["SMG"], false)
		visible_table(on_status_weapons["Shooting"]["Heavy"], false)
		visible_table(on_status_weapons["Shooting"]["Pistol"], false)
		visible_table(on_status_weapons["Shooting"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Shooting"]["Eagle"], false)
		visible_table(player_brute_cond["On Hurt"], false)
		visible_table(player_brute_cond["On Miss"], false)
		return
	end

	if not ui.get(enabled_aa) then
		return
	end

	if ui.get(enabled_aa) and not ui.get(unhide_debug_menu) then
		ui.set_visible(yaw_target_base,false)
		ui.set_visible(bodyyaw,false)
		ui.set_visible(bodyyaw_val,false)
		ui.set_visible(low_body,false)
		ui.set_visible(fake_yaw,false)
	elseif ui.get(enabled_aa) and ui.get(unhide_debug_menu) then
		ui.set_visible(yaw_target_base,true)
		ui.set_visible(bodyyaw,true)
		ui.set_visible(bodyyaw_val,true)
		ui.set_visible(low_body,true)
		ui.set_visible(fake_yaw,true)
	end

		if ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "Auto" then
			visible_table(player_active_weapons["Auto"], true)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_active_weapons["Pistol"], false)
		elseif ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "AWP" then
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], true)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_active_weapons["Pistol"], false)
		elseif ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "Scout" then
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], true)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_active_weapons["Pistol"], false)
		elseif ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "Pistol" then
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_active_weapons["Pistol"], true)
		elseif ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "Rifle" then
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Rifle"], true)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_active_weapons["Pistol"], false)
		elseif ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "SMG" then
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], true)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_active_weapons["Pistol"], false)
		elseif ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "Heavy" then
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], true)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_active_weapons["Pistol"], false)
		elseif ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "R8 Revolver" then
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], true)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_active_weapons["Pistol"], false)
		elseif ui.get(while_condition) == "While Weapons" and ui.get(weapons_acitve_visible) == "Eagle" then
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], true)
			visible_table(player_active_weapons["Pistol"], false)
		elseif ui.get(while_condition) == "While Status" and ui.get(status_acitve_visible) == "Standing" then
			visible_table(player_status_cond["Standing"], true)
			visible_table(player_status_cond["Moving"], false)
			visible_table(player_status_cond["Slow Motion"], false)
			visible_table(player_status_cond["In Air"], false)
			visible_table(player_status_cond["Crouching"], false)
			visible_table(player_status_cond["Shooting"], false)
		elseif ui.get(while_condition) == "While Status" and ui.get(status_acitve_visible) == "Moving" then
			visible_table(player_status_cond["Standing"], false)
			visible_table(player_status_cond["Moving"], true)
			visible_table(player_status_cond["Slow Motion"], false)
			visible_table(player_status_cond["In Air"], false)
			visible_table(player_status_cond["Crouching"], false)
			visible_table(player_status_cond["Shooting"], false)
		elseif ui.get(while_condition) == "While Status" and ui.get(status_acitve_visible) == "Crouching" then
			visible_table(player_status_cond["Standing"], false)
			visible_table(player_status_cond["Moving"], false)
			visible_table(player_status_cond["Slow Motion"], false)
			visible_table(player_status_cond["In Air"], false)
			visible_table(player_status_cond["Crouching"], true)
			visible_table(player_status_cond["Shooting"], false)
		elseif ui.get(while_condition) == "While Status" and ui.get(status_acitve_visible) == "In Air" then
			visible_table(player_status_cond["Standing"], false)
			visible_table(player_status_cond["Moving"], false)
			visible_table(player_status_cond["Slow Motion"], false)
			visible_table(player_status_cond["In Air"], true)
			visible_table(player_status_cond["Crouching"], false)
			visible_table(player_status_cond["Shooting"], false)
		elseif ui.get(while_condition) == "While Status" and ui.get(status_acitve_visible) == "Slow Motion" then
			visible_table(player_status_cond["Standing"], false)
			visible_table(player_status_cond["Moving"], false)
			visible_table(player_status_cond["Slow Motion"], true)
			visible_table(player_status_cond["In Air"], false)
			visible_table(player_status_cond["Crouching"], false)
			visible_table(player_status_cond["Shooting"], false)
		elseif ui.get(while_condition) == "While Status" and ui.get(status_acitve_visible) == "Shooting" then
			visible_table(player_status_cond["Standing"], false)
			visible_table(player_status_cond["Moving"], false)
			visible_table(player_status_cond["Slow Motion"], false)
			visible_table(player_status_cond["In Air"], false)
			visible_table(player_status_cond["Crouching"], false)
			visible_table(player_status_cond["Shooting"], true)
		elseif ui.get(while_condition) == "While Status On Weapons" or ui.get(while_condition) == "While Weapons On Status" then
			ui.set_visible(weapons_acitve_visible,false)
			ui.set_visible(status_acitve_visible,false)
			visible_table(player_active_weapons["Auto"], false)
			visible_table(player_active_weapons["AWP"], false)
			visible_table(player_active_weapons["Scout"], false)
			visible_table(player_active_weapons["Pistol"], false)
			visible_table(player_active_weapons["Rifle"], false)
			visible_table(player_active_weapons["SMG"], false)
			visible_table(player_active_weapons["Heavy"], false)
			visible_table(player_active_weapons["R8 Revolver"], false)
			visible_table(player_active_weapons["Eagle"], false)
			visible_table(player_status_cond["Standing"], false)
			visible_table(player_status_cond["Moving"], false)
			visible_table(player_status_cond["Crouching"], false)
			visible_table(player_status_cond["In Air"], false)
			visible_table(player_status_cond["Slow Motion"], false)
			visible_table(player_status_cond["Shooting"], false)
		end


	if ui.get(while_condition) == "While Status On Weapons" or ui.get(while_condition) == "While Weapons On Status" then
		visible_table(on_weapon_status["AWP"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "AWP" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["Auto"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Auto" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["Scout"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Scout" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["Rifle"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Rifle" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["SMG"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "SMG" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["Heavy"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Heavy" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["Pistol"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Pistol" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["R8 Revolver"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "R8 Revolver" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["Eagle"]["Standing"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Eagle" and ui.get(while_weapons_on_status_status) == "Standing")
		visible_table(on_weapon_status["AWP"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "AWP" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["Auto"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Auto" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["Scout"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Scout" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["Rifle"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Rifle" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["SMG"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "SMG" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["Heavy"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Heavy" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["Pistol"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Pistol" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["R8 Revolver"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "R8 Revolver" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["Eagle"]["Moving"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Eagle" and ui.get(while_weapons_on_status_status) == "Moving")
		visible_table(on_weapon_status["AWP"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "AWP" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["Auto"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Auto" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["Scout"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Scout" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["Rifle"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Rifle" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["SMG"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "SMG" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["Heavy"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Heavy" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["Pistol"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Pistol" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["R8 Revolver"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "R8 Revolver" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["Eagle"]["Slow Motion"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Eagle" and ui.get(while_weapons_on_status_status) == "Slow Motion")
		visible_table(on_weapon_status["AWP"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "AWP" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["Auto"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Auto" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["Scout"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Scout" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["Rifle"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Rifle" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["SMG"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "SMG" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["Heavy"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Heavy" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["Pistol"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Pistol" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["R8 Revolver"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "R8 Revolver" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["Eagle"]["In Air"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Eagle" and ui.get(while_weapons_on_status_status) == "In Air")
		visible_table(on_weapon_status["AWP"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "AWP" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["Auto"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Auto" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["Scout"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Scout" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["Rifle"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Rifle" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["SMG"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "SMG" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["Heavy"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Heavy" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["Pistol"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Pistol" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["R8 Revolver"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "R8 Revolver" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["Eagle"]["Crouching"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Eagle" and ui.get(while_weapons_on_status_status) == "Crouching")
		visible_table(on_weapon_status["AWP"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "AWP" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_weapon_status["Auto"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Auto" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_weapon_status["Scout"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Scout" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_weapon_status["Rifle"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Rifle" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_weapon_status["SMG"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "SMG" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_weapon_status["Heavy"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Heavy" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_weapon_status["Pistol"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Pistol" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_weapon_status["R8 Revolver"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "R8 Revolver" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_weapon_status["Eagle"]["Shooting"], ui.get(enabled_aa) and ui.get(while_condition) == "While Weapons On Status" and ui.get(while_weapons_on_status_weapons) == "Eagle" and ui.get(while_weapons_on_status_status) == "Shooting")
		visible_table(on_status_weapons["Shooting"]["AWP"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "AWP")
		visible_table(on_status_weapons["Shooting"]["Auto"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "Auto")
		visible_table(on_status_weapons["Shooting"]["Scout"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "Scout")
		visible_table(on_status_weapons["Shooting"]["Rifle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "Rifle")
		visible_table(on_status_weapons["Shooting"]["SMG"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "SMG")
		visible_table(on_status_weapons["Shooting"]["Heavy"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "Heavy")
		visible_table(on_status_weapons["Shooting"]["Pistol"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "Pistol")
		visible_table(on_status_weapons["Shooting"]["R8 Revolver"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "R8 Revolver")
		visible_table(on_status_weapons["Shooting"]["Eagle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Shooting" and ui.get(while_status_on_weapons_weapons) == "Eagle")
		visible_table(on_status_weapons["Crouching"]["AWP"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "AWP")
		visible_table(on_status_weapons["Crouching"]["Auto"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "Auto")
		visible_table(on_status_weapons["Crouching"]["Scout"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "Scout")
		visible_table(on_status_weapons["Crouching"]["Rifle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "Rifle")
		visible_table(on_status_weapons["Crouching"]["SMG"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "SMG")
		visible_table(on_status_weapons["Crouching"]["Heavy"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "Heavy")
		visible_table(on_status_weapons["Crouching"]["Pistol"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "Pistol")
		visible_table(on_status_weapons["Crouching"]["R8 Revolver"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "R8 Revolver")
		visible_table(on_status_weapons["Crouching"]["Eagle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Crouching" and ui.get(while_status_on_weapons_weapons) == "Eagle")
		visible_table(on_status_weapons["In Air"]["AWP"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "AWP")
		visible_table(on_status_weapons["In Air"]["Auto"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "Auto")
		visible_table(on_status_weapons["In Air"]["Scout"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "Scout")
		visible_table(on_status_weapons["In Air"]["Rifle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "Rifle")
		visible_table(on_status_weapons["In Air"]["SMG"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "SMG")
		visible_table(on_status_weapons["In Air"]["Heavy"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "Heavy")
		visible_table(on_status_weapons["In Air"]["Pistol"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "Pistol")
		visible_table(on_status_weapons["In Air"]["R8 Revolver"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "R8 Revolver")
		visible_table(on_status_weapons["In Air"]["Eagle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "In Air" and ui.get(while_status_on_weapons_weapons) == "Eagle")
		visible_table(on_status_weapons["Slow Motion"]["AWP"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "AWP")
		visible_table(on_status_weapons["Slow Motion"]["Auto"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "Auto")
		visible_table(on_status_weapons["Slow Motion"]["Scout"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "Scout")
		visible_table(on_status_weapons["Slow Motion"]["Rifle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "Rifle")
		visible_table(on_status_weapons["Slow Motion"]["SMG"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "SMG")
		visible_table(on_status_weapons["Slow Motion"]["Heavy"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "Heavy")
		visible_table(on_status_weapons["Slow Motion"]["Pistol"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "Pistol")
		visible_table(on_status_weapons["Slow Motion"]["R8 Revolver"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "R8 Revolver")
		visible_table(on_status_weapons["Slow Motion"]["Eagle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Slow Motion" and ui.get(while_status_on_weapons_weapons) == "Eagle")
		visible_table(on_status_weapons["Moving"]["AWP"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "AWP")
		visible_table(on_status_weapons["Moving"]["Auto"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "Auto")
		visible_table(on_status_weapons["Moving"]["Scout"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "Scout")
		visible_table(on_status_weapons["Moving"]["Rifle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "Rifle")
		visible_table(on_status_weapons["Moving"]["SMG"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "SMG")
		visible_table(on_status_weapons["Moving"]["Heavy"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "Heavy")
		visible_table(on_status_weapons["Moving"]["Pistol"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "Pistol")
		visible_table(on_status_weapons["Moving"]["R8 Revolver"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "R8 Revolver")
		visible_table(on_status_weapons["Moving"]["Eagle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Moving" and ui.get(while_status_on_weapons_weapons) == "Eagle")
		visible_table(on_status_weapons["Standing"]["AWP"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "AWP")
		visible_table(on_status_weapons["Standing"]["Auto"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "Auto")
		visible_table(on_status_weapons["Standing"]["Scout"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "Scout")
		visible_table(on_status_weapons["Standing"]["Rifle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "Rifle")
		visible_table(on_status_weapons["Standing"]["SMG"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "SMG")
		visible_table(on_status_weapons["Standing"]["Heavy"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "Heavy")
		visible_table(on_status_weapons["Standing"]["Pistol"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "Pistol")
		visible_table(on_status_weapons["Standing"]["R8 Revolver"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "R8 Revolver")
		visible_table(on_status_weapons["Standing"]["Eagle"], ui.get(enabled_aa) and ui.get(while_condition) == "While Status On Weapons" and ui.get(while_status_on_weapons_status) == "Standing" and ui.get(while_status_on_weapons_weapons) == "Eagle")
	end

	if ui.get(while_condition) == "While Status" or ui.get(while_condition) == "While Weapons" then
		visible_table(on_weapon_status["AWP"]["Standing"], false)
		visible_table(on_weapon_status["Auto"]["Standing"], false)
		visible_table(on_weapon_status["Scout"]["Standing"], false)
		visible_table(on_weapon_status["Rifle"]["Standing"], false)
		visible_table(on_weapon_status["SMG"]["Standing"], false)
		visible_table(on_weapon_status["Heavy"]["Standing"], false)
		visible_table(on_weapon_status["Pistol"]["Standing"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Standing"], false)
		visible_table(on_weapon_status["Eagle"]["Standing"], false)
		visible_table(on_weapon_status["AWP"]["Moving"], false)
		visible_table(on_weapon_status["Auto"]["Moving"], false)
		visible_table(on_weapon_status["Scout"]["Moving"], false)
		visible_table(on_weapon_status["Rifle"]["Moving"], false)
		visible_table(on_weapon_status["SMG"]["Moving"], false)
		visible_table(on_weapon_status["Heavy"]["Moving"], false)
		visible_table(on_weapon_status["Pistol"]["Moving"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Moving"], false)
		visible_table(on_weapon_status["Eagle"]["Moving"], false)
		visible_table(on_weapon_status["AWP"]["Slow Motion"], false)
		visible_table(on_weapon_status["Auto"]["Slow Motion"], false)
		visible_table(on_weapon_status["Scout"]["Slow Motion"], false)
		visible_table(on_weapon_status["Rifle"]["Slow Motion"], false)
		visible_table(on_weapon_status["SMG"]["Slow Motion"], false)
		visible_table(on_weapon_status["Heavy"]["Slow Motion"], false)
		visible_table(on_weapon_status["Pistol"]["Slow Motion"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Slow Motion"], false)
		visible_table(on_weapon_status["Eagle"]["Slow Motion"], false)
		visible_table(on_weapon_status["AWP"]["In Air"], false)
		visible_table(on_weapon_status["Auto"]["In Air"], false)
		visible_table(on_weapon_status["Scout"]["In Air"], false)
		visible_table(on_weapon_status["Rifle"]["In Air"], false)
		visible_table(on_weapon_status["SMG"]["In Air"], false)
		visible_table(on_weapon_status["Heavy"]["In Air"], false)
		visible_table(on_weapon_status["Pistol"]["In Air"], false)
		visible_table(on_weapon_status["R8 Revolver"]["In Air"], false)
		visible_table(on_weapon_status["Eagle"]["In Air"], false)
		visible_table(on_weapon_status["AWP"]["Crouching"], false)
		visible_table(on_weapon_status["Auto"]["Crouching"], false)
		visible_table(on_weapon_status["Scout"]["Crouching"], false)
		visible_table(on_weapon_status["Rifle"]["Crouching"], false)
		visible_table(on_weapon_status["SMG"]["Crouching"], false)
		visible_table(on_weapon_status["Heavy"]["Crouching"], false)
		visible_table(on_weapon_status["Pistol"]["Crouching"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Crouching"], false)
		visible_table(on_weapon_status["Eagle"]["Crouching"], false)
		visible_table(on_weapon_status["AWP"]["Shooting"], false)
		visible_table(on_weapon_status["Auto"]["Shooting"], false)
		visible_table(on_weapon_status["Scout"]["Shooting"], false)
		visible_table(on_weapon_status["Rifle"]["Shooting"], false)
		visible_table(on_weapon_status["SMG"]["Shooting"], false)
		visible_table(on_weapon_status["Heavy"]["Shooting"], false)
		visible_table(on_weapon_status["Pistol"]["Shooting"], false)
		visible_table(on_weapon_status["R8 Revolver"]["Shooting"], false)
		visible_table(on_weapon_status["Eagle"]["Shooting"], false)
		visible_table(on_status_weapons["Standing"]["AWP"], false)
		visible_table(on_status_weapons["Standing"]["Auto"], false)
		visible_table(on_status_weapons["Standing"]["Scout"], false)
		visible_table(on_status_weapons["Standing"]["Rifle"], false)
		visible_table(on_status_weapons["Standing"]["SMG"], false)
		visible_table(on_status_weapons["Standing"]["Heavy"], false)
		visible_table(on_status_weapons["Standing"]["Pistol"], false)
		visible_table(on_status_weapons["Standing"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Standing"]["Eagle"], false)
		visible_table(on_status_weapons["Moving"]["AWP"], false)
		visible_table(on_status_weapons["Moving"]["Auto"], false)
		visible_table(on_status_weapons["Moving"]["Scout"], false)
		visible_table(on_status_weapons["Moving"]["Rifle"], false)
		visible_table(on_status_weapons["Moving"]["SMG"], false)
		visible_table(on_status_weapons["Moving"]["Heavy"], false)
		visible_table(on_status_weapons["Moving"]["Pistol"], false)
		visible_table(on_status_weapons["Moving"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Moving"]["Eagle"], false)
		visible_table(on_status_weapons["Slow Motion"]["AWP"], false)
		visible_table(on_status_weapons["Slow Motion"]["Auto"], false)
		visible_table(on_status_weapons["Slow Motion"]["Scout"], false)
		visible_table(on_status_weapons["Slow Motion"]["Rifle"], false)
		visible_table(on_status_weapons["Slow Motion"]["SMG"], false)
		visible_table(on_status_weapons["Slow Motion"]["Heavy"], false)
		visible_table(on_status_weapons["Slow Motion"]["Pistol"], false)
		visible_table(on_status_weapons["Slow Motion"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Slow Motion"]["Eagle"], false)
		visible_table(on_status_weapons["In Air"]["AWP"], false)
		visible_table(on_status_weapons["In Air"]["Auto"], false)
		visible_table(on_status_weapons["In Air"]["Scout"], false)
		visible_table(on_status_weapons["In Air"]["Rifle"], false)
		visible_table(on_status_weapons["In Air"]["SMG"], false)
		visible_table(on_status_weapons["In Air"]["Heavy"], false)
		visible_table(on_status_weapons["In Air"]["Pistol"], false)
		visible_table(on_status_weapons["In Air"]["R8 Revolver"], false)
		visible_table(on_status_weapons["In Air"]["Eagle"], false)
		visible_table(on_status_weapons["Crouching"]["AWP"], false)
		visible_table(on_status_weapons["Crouching"]["Auto"], false)
		visible_table(on_status_weapons["Crouching"]["Scout"], false)
		visible_table(on_status_weapons["Crouching"]["Rifle"], false)
		visible_table(on_status_weapons["Crouching"]["SMG"], false)
		visible_table(on_status_weapons["Crouching"]["Heavy"], false)
		visible_table(on_status_weapons["Crouching"]["Pistol"], false)
		visible_table(on_status_weapons["Crouching"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Crouching"]["Eagle"], false)
		visible_table(on_status_weapons["Shooting"]["AWP"], false)
		visible_table(on_status_weapons["Shooting"]["Auto"], false)
		visible_table(on_status_weapons["Shooting"]["Scout"], false)
		visible_table(on_status_weapons["Shooting"]["Rifle"], false)
		visible_table(on_status_weapons["Shooting"]["SMG"], false)
		visible_table(on_status_weapons["Shooting"]["Heavy"], false)
		visible_table(on_status_weapons["Shooting"]["Pistol"], false)
		visible_table(on_status_weapons["Shooting"]["R8 Revolver"], false)
		visible_table(on_status_weapons["Shooting"]["Eagle"], false)
	end

		ui.set_visible(antibrute_select,true)
		ui.set_visible(arrows_types,ui.get(indicator_status) == "Arrows" and true or false)
		ui.set_visible(arrows_rgb,ui.get(indicator_status) == "Arrows" and true or false)
		ui.set_visible(arrow_distance,ui.get(indicator_status) == "Arrows" and true or false)
		ui.set_visible(legit_antiaim_label,true)
		ui.set_visible(unhide_debug_menu,true)
		ui.set_visible(enabled_legit_fakelag,true)
		ui.set_visible(while_condition,true)
		ui.set_visible(enabled_swap_aa,true)
		ui.set_visible(invert_hotkey,true)
		ui.set_visible(indicator_status,true)
		ui.set_visible(swap_status,ui.get(enabled_swap_aa) and true or false)
		ui.set_visible(swap_hotkey,ui.get(enabled_swap_aa) and true or false)
		ui.set_visible(coincide_swap,ui.get(swap_status) == "Coincide Swap" and true or false)
		ui.set_visible(arrows_status,ui.get(indicator_status) == "Arrows" and true or false)
		ui.set_visible(real_arrows_label,ui.get(indicator_status) == "Arrows" and true or false)
		ui.set_visible(real_arrows_p,ui.get(indicator_status) == "Arrows" and true or false)
		ui.set_visible(fake_arrows_label,ui.get(indicator_status) == "Arrows" and true or false)
		ui.set_visible(fake_arrows_p,ui.get(indicator_status) == "Arrows" and true or false)
		ui.set_visible(circle_color_label,ui.get(indicator_status) == "Circle" and true or false)
		ui.set_visible(circle_color_p,ui.get(indicator_status) == "Circle" and true or false)
		ui.set_visible(while_weapons_on_status_weapons,ui.get(while_condition) == "While Weapons On Status" and true or false)
		ui.set_visible(while_weapons_on_status_status,ui.get(while_condition) == "While Weapons On Status" and true or false)
		ui.set_visible(while_status_on_weapons_status,ui.get(while_condition) == "While Status On Weapons" and true or false)
		ui.set_visible(while_status_on_weapons_weapons,ui.get(while_condition) == "While Status On Weapons" and true or false)
		visible_table(player_brute_cond["On Hurt"], table_contains(ui.get(antibrute_select),"On Hurt"))
		visible_table(player_brute_cond["On Miss"], table_contains(ui.get(antibrute_select),"On Miss"))

	if ui.get(while_condition) == "While Weapons" then
		ui.set_visible(weapons_acitve_visible,true)
		ui.set_visible(status_acitve_visible,false)
		visible_table(player_status_cond["Standing"], false)
		visible_table(player_status_cond["Moving"], false)
		visible_table(player_status_cond["Crouching"], false)
		visible_table(player_status_cond["Slow Motion"], false)
		visible_table(player_status_cond["Shooting"], false)
	elseif ui.get(while_condition) == "While Status" then
		ui.set_visible(status_acitve_visible,true)
		ui.set_visible(weapons_acitve_visible,false)
		visible_table(player_active_weapons["Auto"], false)
		visible_table(player_active_weapons["AWP"], false)
		visible_table(player_active_weapons["Scout"], false)
		visible_table(player_active_weapons["Pistol"], false)
		visible_table(player_active_weapons["Rifle"], false)
		visible_table(player_active_weapons["SMG"], false)
		visible_table(player_active_weapons["Heavy"], false)
		visible_table(player_active_weapons["R8 Revolver"], false)
		visible_table(player_active_weapons["Eagle"], false)
	end

	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or anti_brute_swap == true or not ui.get(enabled_aa) then
		return
	end

	ui.set(bodyyaw,ui.get(active_selection["body_status"]))
	if ui.get(bodyyaw_val) >= 1 then
		body_swap_return = -60
	elseif ui.get(bodyyaw_val) <= -1 then
		body_swap_return = 60
	end

		local swap_lby_enabled_cond = "false"
	if ui.get(lby_status_ref) == "Lua-Half Sway" and ui.get(swap_status) == "UnCoincide Swap" and Player_State == "Crouching" then
		lby_swap_val = ui.get(low_body) == "Eye yaw" and body_swap_return or -body_swap_return
		swap_lby_enabled_cond = "true"
	elseif ui.get(lby_status_ref) == "Lua-Full Sway" and ui.get(swap_status) == "UnCoincide Swap" and Player_State == "Crouching" then 
		lby_swap_val = ui.get(low_body) == "Sway" and body_swap_return or -body_swap_return
		swap_lby_enabled_cond = "true"
	end

	if ui.get(enabled_swap_aa) and ui.get(swap_hotkey) and Player_State == "Crouching" and ui.get(swap_status) == "UnCoincide Swap" and swap_lby_enabled_cond == "true" then
		ui.set(bodyyaw_val,ui.get(invert_hotkey) and lby_swap_val or - lby_swap_val)
		ui.set(fake_yaw,ui.get(fakelag_resert) and ui.get(jitter_min_ref) or ui.get(jitter_max_ref))
	elseif ui.get(enabled_swap_aa) and ui.get(swap_hotkey) and Player_State == "Crouching" and ui.get(swap_status) == "Coincide Swap" then
	 	swap_body_pospar = entity.get_prop(local_player, "m_flPoseParameter", 11)
	 	swap_break_yaw = math.floor(entity.get_prop(local_player, "m_flPoseParameter", 11) * 120 - 60 )
	 	swap_body_yaw = math.max(-60, math.min(60, swap_body_pospar*120-60+0.5))
		ui.set(fake_yaw,60)

	 	if ui.get(coincide_swap) == "Half-Standing Swap" and swap_break_yaw == -58 and ui.get(bodyyaw_val) <= -1 then
	 	 	ui.set(bodyyaw_val,60)
	 	elseif ui.get(coincide_swap) == "Half-Standing Swap" and swap_break_yaw == 57 and ui.get(bodyyaw_val) >= 1 then
	 	 	ui.set(bodyyaw_val,-60)
		end

	 	if ui.get(coincide_swap) == "Full-Standing Swap" and swap_break_yaw == -60 and ui.get(bodyyaw_val) <= -1 then
	 	 	ui.set(bodyyaw_val,60)
	 	elseif ui.get(coincide_swap) == "Full-Standing Swap" and swap_break_yaw == 59 and ui.get(bodyyaw_val) >= 1 then
	 	 	ui.set(bodyyaw_val,-60)
	 	end
	else
		ui.set(bodyyaw_val,ui.get(invert_hotkey) and ui.get(active_selection["bodyyaw"]) or - ui.get(active_selection["bodyyaw"]))
		ui.set(fake_yaw,ui.get(fakelag_resert) and ui.get(jitter_min_ref) or ui.get(jitter_max_ref))
	end


	ui.set_visible(fakelag_send_packet_trigger, ui.get(enabled_legit_fakelag))
	ui.set_visible(fakelag_send_packet_trigger,ui.get(enabled_legit_fakelag))
	ui.set_visible(alter_fakelag_typs, ui.get(enabled_legit_fakelag))
	ui.set_visible(fakelag_typs,ui.get(enabled_legit_fakelag))
	ui.set_visible(alter_normal_lag, ui.get(enabled_legit_fakelag) and ui.get(fakelag_typs) == "YDL Condiction" and visible_adaptive)
	ui.set_visible(alter_send_lag, ui.get(enabled_legit_fakelag) and ui.get(fakelag_typs) == "YDL Condiction" and ui.get(alter_fakelag_typs) == "Fluctuate")
	ui.set_visible(alter_maximum_lag, ui.get(enabled_legit_fakelag) and ui.get(fakelag_typs) == "YDL Condiction" and ui.get(alter_fakelag_typs) == "Factor")

	if ui.get(enabled_legit_fakelag) then
		local visible_adaptive = true
		local wall_peek = player_will_peek()
		local visible_peek = syr_weapon_visible
		local global_peek = syr_weapon_visible == true or wall_peek == true
		ui.set_visible(peek_fakelag_limit,ui.get(fakelag_typs) == "On Peek Lag")

			if ui.get(alter_fakelag_typs) == "Adaptive" then
				YDL_limit = adaptive_lag
				isible_adaptive = false
			elseif ui.get(alter_fakelag_typs) == "Factor" then
				YDL_limit = ui.get(fakelag_resert) and ui.get(alter_normal_lag) or ui.get(alter_maximum_lag)
			elseif ui.get(alter_fakelag_typs) == "Fluctuate" then
				YDL_limit = ui.get(fakelag_resert) and ui.get(alter_normal_lag) or ui.get(alter_send_lag) - 1 >= 1 and ui.get(alter_send_lag) - 1 or ui.get(alter_normal_lag)
			elseif ui.get(alter_fakelag_typs) == "Maximum" then
				YDL_limit = ui.get(alter_normal_lag)
			end

		if ui.get(fakelag_typs) == "YDL Condiction" then
			ui.set(fakelag_value_limit, ui.get(duck_peek) and 6 or YDL_limit)
		else
			ui.set(fakelag_value_limit, ui.get(duck_peek) and 6 or global_peek and ui.get(peek_fakelag_limit) or 1)
		end

	elseif not ui.get(enabled_legit_fakelag) then
		ui.set_visible(peek_fakelag_limit,false)
	end
end

client.set_event_callback("paint", legitaa_subject)

client.set_event_callback("setup_command", function(cmd)
	local localplayer = entity.get_local_player()
	if ui.get(duck_peek) then
		cmd.allow_send_packet = false
		ui.set(fakelag_value_limit, 6)
	end

	if not localplayer or not entity.is_alive(localplayer) or not ui.get(enabled_legit_fakelag) or not ui.get(enabled_aa) then
		return
	end

	local flags_weapon_switch = cmd.weaponselect
	local flags_on_use = cmd.in_use
	local trigger_choked = cmd.chokedcommands
	local vx, vy, vz = entity.get_prop(localplayer, "m_vecVelocity")
	local velocity_speed = math.sqrt((vx * vx) + (vy * vy))
	local onground = (bit.band(entity.get_prop(localplayer, "m_fFlags"), 1) == 1)
	local infiniteduck = (bit.band(entity.get_prop(localplayer, "m_fFlags"), 2) == 2)
	local slowwalking = ui.get(slow_enabled) and ui.get(slowwalk_key)
	local exploit = ui.get(on_shot) and ui.get(on_shot_hotkey) or ui.get(double_tap) and ui.get(double_tap_hotkey) or ui.get(duck_peek)
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
		SYR_State = "SYR-Default"
	elseif velocity_speed > 2 and not slowwalking and onground and not infiniteduck and velocity_speed < 190 and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		SYR_State = "SYR-Running"
	elseif velocity_speed > 2 and slowwalking and onground and not infiniteduck and velocity_speed < 190 and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		SYR_State = "SYR-Slow Motion"
	elseif velocity_speed > 190 and onground and not infiniteduck and not exploit and fired_shoot == true and flags_on_use == 0 and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		SYR_State = "SYR-High Speed"
	elseif not onground and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		SYR_State = "SYR-Air"
	elseif infiniteduck and velocity_speed < 190 and not exploit and fired_shoot == true and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and flags_on_land == false and not flags_climbing_adder then
		SYR_State = "SYR-Crouching"
	elseif exploit and flags_on_use == 0 and not in_freeze_time and flags_weapon_switch <= 0 and not flags_climbing_adder then
		SYR_State = "SYR-Exploit"
	elseif flags_on_use == 1 and fired_shoot == true and not in_freeze_time and flags_weapon_switch <= 0 and not flags_climbing_adder then
		SYR_State = "SYR-In Use"
	elseif fired_shoot == false and not in_freeze_time and flags_weapon_switch <= 0 and flags_weapon_reload == true and not flags_climbing_adder then
		SYR_State = "SYR-Fired"
	elseif flags_weapon_switch >= 0.001 and not in_freeze_time and onground and flags_on_land == false and not flags_climbing_adder then
		SYR_State = "SYR-Weapon Switch"
	elseif fired_shoot == false and flags_weapon_reload == false and onground and not in_freeze_time and flags_on_land == false and flags_weapon_switch <= 0 and not flags_climbing_adder then
		SYR_State = "SYR-Weapon Reload"
	elseif flags_on_land == true and flags_weapon_switch <= 0 and not in_freeze_time and fired_shoot == false and not flags_climbing_adder then
		SYR_State = "SYR-On Land"
	elseif flags_climbing_adder and not in_freeze_time then
		SYR_State = "SYR-Climbing Ldder"
	elseif in_freeze_time then
		SYR_State = "SYR-Freeze Time"
	end

	local trigger_always_packet = true
	local trigger_send_packet = true
	if table_contains(ui.get(fakelag_send_packet_trigger), "On Standing") and SYR_State == "SYR-Default" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "While Moving") and SYR_State == "SYR-Running" or table_contains(ui.get(fakelag_send_packet_trigger), "While Moving") and SYR_State == "SYR-Slow Motion" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "On Duck") and SYR_State == "SYR-Crouching" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "On High Speed") and SYR_State == "SYR-High Speed" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "On Jump") and SYR_State == "SYR-Air" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "On Exploit") and SYR_State == "SYR-Exploit" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "Weapon Fired") and SYR_State == "SYR-Fired" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "On Use") and SYR_State == "SYR-In Use" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "On Freezetime") and SYR_State == "SYR-Freeze Time" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "Weapon Switch") and SYR_State == "SYR-Weapon Switch" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "Weapon Reload") and SYR_State == "SYR-Weapon Reload" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "On Land") and SYR_State == "SYR-On Land" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	if table_contains(ui.get(fakelag_send_packet_trigger), "While Climbing Ladder") and SYR_State == "SYR-Climbing Ldder" then
		trigger_send_packet = trigger_choked >= ui.get(fakelag_value_limit)
		trigger_always_packet = false
	end

	cmd.allow_send_packet = ui.get(fakelag_typs) == "YDL Condiction" and trigger_always_packet or trigger_send_packet
end)


client.set_event_callback("paint", function(c)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(enabled_aa) or anti_brute_swap == false then
		return
	end

	brute_selection = player_brute_cond[antibrute_cond_menu]
	ui.set(lby_break_speed_ref,ui.get(brute_selection["lby_break_speed"]))
	ui.set(lby_status_ref,ui.get(brute_selection["lby_status"]))
	ui.set(lby_break_speed_ref,ui.get(brute_selection["lby_break_speed"]))
	ui.set(jitter_min_ref,ui.get(brute_selection["jitter_min"]))
	ui.set(jitter_max_ref,ui.get(brute_selection["jitter_max"]))
	ui.set(bodyyaw_val, - ui.get(bodyyaw_val))
	ui.set(fake_yaw,ui.get(fakelag_resert) and ui.get(jitter_min_ref) or ui.get(jitter_max_ref))

	if ui.get(lby_status_ref) == "Lua-Half Sway" then
		ui.set(low_body,globals.tickcount() % 100 > 1 and globals.tickcount() % 100 < ui.get(lby_break_speed_ref) and "Eye yaw" or "Opposite")
	elseif ui.get(lby_status_ref) == "Lua-Full Sway" then
		ui.set(low_body,globals.tickcount() % 100 > 1 and globals.tickcount() % 100 < ui.get(lby_break_speed_ref) and "Sway" or "Opposite")
	elseif ui.get(lby_status_ref) == "Lua-Break" then
		ui.set(low_body,globals.tickcount() % 100 > 1 and globals.tickcount() % 100 < ui.get(lby_break_speed_ref) and "Sway" or "Opposite")
	elseif ui.get(lby_status_ref) == "Off" then
		ui.set(low_body,"Off")
	elseif ui.get(lby_status_ref) == "Sway" then
		ui.set(low_body,"Sway")
	elseif ui.get(lby_status_ref) == "Eye yaw" then
		ui.set(low_body,"Eye yaw")
	elseif ui.get(lby_status_ref) == "Opposite" then
		ui.set(low_body,"Opposite")
	end
end)

local function tablecont(table, item)
    for i=1, #table do
        if table[i] == item then
            return true
        end
    end
    return false
end

local weapons_ignored = {
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

local set_cache = function(self)
    local process = function(name, condition, should_call, VAR)
        local hotkey_modes = {
            [0] = "always on",
            [1] = "on hotkey",
            [2] = "toggle",
            [3] = "off hotkey"
        }
    
    if not ui.get(enabled_aa) or not ui.get(enabled_legit_fakelag) or not ui.get(enabled_fluctuate_shooting) or ui.get(duck_peek) then
            return
    end

        local _cond = ui.get(condition)
        local _type = type(_cond)
    
        local value, mode = ui.get(condition)
        local finder = mode ~= nil and mode or (_type == "boolean" and tostring(_cond) or _cond)
        cache[name] = cache[name] ~= nil and cache[name] or finder
    
        if should_call then ui.set(condition, mode ~= nil and hotkey_modes[VAR] or VAR) else
            if cache[name] ~= nil then
                local _cache = cache[name]
                
                if _type == "boolean" then
                    if _cache == "true" then _cache = true end
                    if _cache == "false" then _cache = false end
                end
    
                ui.set(condition, mode ~= nil and hotkey_modes[_cache] or _cache)
                cache[name] = nil
            end
        end
    end

    process("fakelag_value_limit", fakelag_value_limit, (self == nil and false or self), ui.get(fluctuate_shooting_limit))
end

client.set_event_callback("shutdown", set_cache)

client.set_event_callback("setup_command", function(cmd)
    if not ui.get(enabled_aa) or not ui.get(enabled_legit_fakelag) or not ui.get(enabled_fluctuate_shooting) or ui.get(duck_peek) then
            return
    end

    local me = entity.get_local_player()
    local weapon = entity.get_player_weapon(me)
    local last_shot_time = entity.get_prop(weapon, "m_fLastShotTime")
    local m_iItem = bit.band(entity.get_prop(weapon, "m_iItemDefinitionIndex"), 0xFFFF)
    if weapon == nil or tablecont(weapons_ignored, entity.get_classname(weapon)) then
        return
    end

    local limitation = function(cmd)
        local in_accel = function()
            local me = entity.get_local_player()
            local x, y = entity.get_prop(me, "m_vecVelocity")
        
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


client.set_event_callback("weapon_fire", function(e)
    local localplayer_shot = client.userid_to_entindex(e.userid)
    if localplayer_shot ~= entity.get_local_player() then return end
    if -fix_out < globals.realtime() * time_fix then fix_in = globals.realtime() + fix_out end 
end)

local function setMath(int, max, declspec)
    local int = (int > max and max or int)
    local tmp = max / int;
    local i = (declspec / tmp)
    i = (i >= 0 and math.floor(i + 0.5) or math.ceil(i - 0.5))
    return i
end

local function aa_indicator(c)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(enabled_aa) then
		return
	end

	_x, _y = client.screen_size()
	y = _y / 2
	x = _x / 2

	if ui.get(arrows_status) == "Default" then
		arrows_left = "⮜"
		arrows_right = "⮞"
	elseif ui.get(arrows_status) == "Triangle" then
		arrows_left = "⭠"
		arrows_right = "⭢"
	elseif ui.get(arrows_status) == "Circle Arrows" then
		arrows_left = "⮈"
		arrows_right = "⮊"
	elseif ui.get(arrows_status) == "Fish Spear" then
		arrows_left = "↼"
		arrows_right = "⇀"
	elseif ui.get(arrows_status) == "Pair Arrows" then
		arrows_left = "⮄"
		arrows_right = "⮆"
	elseif ui.get(arrows_status) == "Pair Arrows 2" then
		arrows_left = "⇚"
		arrows_right = "⇛"
	elseif ui.get(arrows_status) == "Barroom" then
		arrows_left = "⭰"
		arrows_right = "⭲"
	elseif ui.get(arrows_status) == "Classic" then
		arrows_left = "<"
		arrows_right = ">"
	elseif ui.get(arrows_status) == "OneTap V2" then
		arrows_left = "◁"
		arrows_right = "▷"
	elseif ui.get(arrows_status) == "TranSparent" then
		arrows_left = "⮘"
		arrows_right = "⮚"
	elseif ui.get(arrows_status) == "Round" then
		arrows_left = "("
		arrows_right = ")"
	elseif ui.get(arrows_status) == "Dick" then
		arrows_left = "ꓷ"
		arrows_right = "D"
	elseif ui.get(arrows_status) == "Square" then
		arrows_left = "⍃"
		arrows_right = "⍄"
	elseif ui.get(arrows_status) == "Stars" then
		arrows_left = "★"
		arrows_right = "★"
	elseif ui.get(arrows_status) == "Caresses" then
		arrows_left = "⇷"
		arrows_right = "⇸"
	elseif ui.get(arrows_status) == "Carabiner" then
		arrows_left = "↩"
		arrows_right = "↪"
	elseif ui.get(arrows_status) == "Special" then
		arrows_left = "⤙"
		arrows_right = "⤚"
	elseif ui.get(arrows_status) == "Crooked Arrow" then
		arrows_left = "⭜"
		arrows_right = "⭝"
	elseif ui.get(arrows_status) == "Circle" then
		arrows_left = "↶"
		arrows_right = "↷"
	elseif ui.get(arrows_status) == "Ribbon 1" then
		arrows_left = "⮰"
		arrows_right = "⮱"
	elseif ui.get(arrows_status) == "Ribbon 2" then
		arrows_left = "⮲"
		arrows_right = "⮳"
	elseif ui.get(arrows_status) == "Ribbon 3" then
		arrows_left = "⮴"
		arrows_right = "⮵"
	elseif ui.get(arrows_status) == "Ribbon 4" then
		arrows_left = "⮶"
		arrows_right = "⮷"
	elseif ui.get(arrows_status) == "Shadows" then
		arrows_left = "◄"
		arrows_right = "►"
	elseif ui.get(arrows_status) == "Double Arrows" then
		arrows_left = "↞"
		arrows_right = "↠"
	elseif ui.get(arrows_status) == "Misc" then
		arrows_left = "◅"
		arrows_right = "▻"
	elseif ui.get(arrows_status) == "Mathematical Arrow" then
		arrows_left = "⥷"
		arrows_right = "⭃"
	elseif ui.get(arrows_status) == "Cross Arrowhead" then
		arrows_left = "⤪"
		arrows_right = "⤨"
	elseif ui.get(arrows_status) == "Triangles Arrows" then
		arrows_left = "◀"
		arrows_right = "▶"
	elseif ui.get(arrows_status) == "Triangles Arrows 2" then
		arrows_left = "⯇"
		arrows_right = "⯈"
	end

	fix_out = 0.32
	if fix_in > globals.realtime() then 
		shot_circle = (setMath(fix_in - globals.realtime(), fix_out , 40) * 0.004) 
	else 
		shot_circle = 0 
	end

	local h, w = 34, 200
	local alpha = 1 + math.sin(math.abs(-math.pi + (globals.realtime() * (1 / 0.5)) % (math.pi * 2))) * 219
	local circle_r, circle_g, circle_b, circle_a = ui.get(circle_color_p)
	local white_anim = shot_circle * 620
	local ind_r, ind_g, ind_b, ind_a = math.min(255, circle_r + white_anim), math.min(255, circle_g + white_anim),math.min(255, circle_b + white_anim), math.min(255, circle_a + white_anim)
	local scrsize_x, scrsize_y = client.screen_size()
	local cen_x, cen_y = (scrsize_x * 0.5), (scrsize_y * 0.5)
	time_fix = 255 * 0.04 * globals.frametime()

	local real_r,real_g,real_b,real_a = ui.get(fake_arrows_p)
	local fake_r,fake_g,fake_b,fake_a = ui.get(real_arrows_p)

	if table_contains(ui.get(arrows_rgb), "Fake Arrows") then
		fake_r,fake_g,fake_b = func_rgb_rainbowize(0.1, 1)
	end

	if table_contains(ui.get(arrows_rgb), "Real Arrows") then
		real_r,real_g,real_b = func_rgb_rainbowize(0.1, 1)
	end

	if body_yaw_target >= 1 and ui.get(indicator_status) == "Circle" then
		renderer.circle_outline(cen_x, cen_y + ui.get(arrow_distance), ind_r, ind_g, ind_b, alpha, 40, 295 - shot_circle * 362, 0.35 + shot_circle , 6)
	elseif body_yaw_target <= -1 and ui.get(indicator_status) == "Circle" then
		renderer.circle_outline(cen_x, cen_y - ui.get(arrow_distance), ind_r, ind_g, ind_b, alpha, 40, 120, 0.35 + shot_circle, 6)
	end

	if body_yaw_target >= 1 and ui.get(indicator_status) == "Arrows" then
		renderer.text(x - 35 - ui.get(arrow_distance), y, real_r,real_g,real_b,table_contains(ui.get(arrows_types), "Draw Fake Arrows") and real_a or 0, "c+", 0, arrows_left)
		renderer.text(x + 35 + ui.get(arrow_distance), y, fake_r,fake_g,fake_b,table_contains(ui.get(arrows_types), "Draw Real Arrows") and fake_a or 0, "c+", 0, arrows_right)
	elseif body_yaw_target <= -1 and ui.get(indicator_status) == "Arrows" then
		renderer.text(x - 35 - ui.get(arrow_distance), y, fake_r,fake_g,fake_b,table_contains(ui.get(arrows_types), "Draw Real Arrows") and fake_a or 0, "c+", 0, arrows_left)
		renderer.text(x + 35 + ui.get(arrow_distance), y, real_r,real_g,real_b,table_contains(ui.get(arrows_types), "Draw Fake Arrows") and real_a or 0, "c+", 0, arrows_right)
	end
end

client.set_event_callback("paint", aa_indicator)
