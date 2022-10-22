local localfile = readfile("csgo/package.YDL")
if localfile == "1124 Done Fixed" then
local player_models = {
    ["T"] = "models/player/custom_player/legacy/tm_phoenix.mdl",
	["CT"] = "models/player/custom_player/legacy/ctm_sas.mdl",
	["Barbara"] = "models/player/custom_player/toppiofficial/genshin/barbara.mdl",
	["Lumine"] = "models/player/custom_player/toppiofficial/genshin/lumine.mdl",
	['Kokoro'] = 'models/player/custom_player/toppiofficial/touhou/kokoro.mdl',
	['Prinz Eugen Azur Lane'] = 'models/player/custom_player/ventoz/azur_lane/prinz_eugen.mdl',
	['Vigna'] = 'models/player/custom_player/arcaea/sourxuan/vigna.mdl',
	['Aika'] = 'models/player/custom_player/arcaea/takuto/aika_aikawa.mdl',
	['Bismarck'] = 'models/player/custom_player/arcaea/azurelane/bismarck.mdl',
	['Lucoa'] = 'models/player/custom_player/owston/anime/lucoa.mdl',
	['ZeroTwo'] = 'models/player/custom_player/owston/darlinginthefranxx/zerotwo.mdl',
	['Felix'] = 'models/player/custom_player/owston/rezero/felixtrap3.mdl',
	['Emilia'] = 'models/player/custom_player/maoling/re0/emilia_v2/emilia.mdl',
	['GA'] = "models/player/custom_player/bbs_93x_net_2015/girl_ia/update_2015_11_05/ia.mdl",
	['Kurumi Tokisaki'] = 'models/player/custom_player/bbs_93x_net_2015/kuangsan/update_2015_11_05/kuangsan.mdl',
	['Coconut'] = 'models/player/custom_player/bbs_93x_net_2016/coconut/update_2016_12_30/coconut.mdl',
	['Megurine Luka'] = 'models/player/custom_player/bbs_93x_net_2016/kimono_luka/update_2016_08_05/kimono_luka.mdl',
	['Rem'] = 'models/player/custom_player/maoling/re0/rem/rem.mdl',
	['Ram'] = 'models/player/custom_player/maoling/re0/ram/ram.mdl',
	["Zombie"] = "models/player/napas/stalker/zombie_custom.mdl"
}
local ffi = require("ffi")
ffi.cdef[[
    typedef struct 
    {
    	void*   fnHandle;        
    	char    szName[260];     
    	int     nLoadFlags;      
    	int     nServerCount;    
    	int     type;            
    	int     flags;           
    	float  vecMins[3];       
    	float  vecMaxs[3];       
    	float   radius;          
    	char    pad[0x1C];       
    }model_t;
    
    typedef int(__thiscall* get_model_index_t)(void*, const char*);
    typedef const model_t(__thiscall* find_or_load_model_t)(void*, const char*);
    typedef int(__thiscall* add_string_t)(void*, bool, const char*, int, const void*);
    typedef void*(__thiscall* find_table_t)(void*, const char*);
    typedef void(__thiscall* set_model_index_t)(void*, int);
    typedef int(__thiscall* precache_model_t)(void*, const char*, bool);
    typedef void*(__thiscall* get_client_entity_t)(void*, int);
]]
local class_ptr = ffi.typeof("void***")
local rawientitylist = client.create_interface("client_panorama.dll", "VClientEntityList003") or error("VClientEntityList003 wasnt found", 2)
local ientitylist = ffi.cast(class_ptr, rawientitylist) or error("rawientitylist is nil", 2)
local get_client_entity = ffi.cast("get_client_entity_t", ientitylist[0][3]) or error("get_client_entity is nil", 2)
local rawivmodelinfo = client.create_interface("engine.dll", "VModelInfoClient004") or error("VModelInfoClient004 wasnt found", 2)
local ivmodelinfo = ffi.cast(class_ptr, rawivmodelinfo) or error("rawivmodelinfo is nil", 2)
local get_model_index = ffi.cast("get_model_index_t", ivmodelinfo[0][2]) or error("get_model_info is nil", 2)
local find_or_load_model = ffi.cast("find_or_load_model_t", ivmodelinfo[0][39]) or error("find_or_load_model is nil", 2)
local rawnetworkstringtablecontainer = client.create_interface("engine.dll", "VEngineClientStringTable001") or error("VEngineClientStringTable001 wasnt found", 2)
local networkstringtablecontainer = ffi.cast(class_ptr, rawnetworkstringtablecontainer) or error("rawnetworkstringtablecontainer is nil", 2)
local find_table = ffi.cast("find_table_t", networkstringtablecontainer[0][3]) or error("find_table is nil", 2)
local cl_fullupdate = cvar.cl_fullupdate
local model_names = {}
for k,v in pairs(player_models) do
    table.insert(model_names, k)
end
ui.new_label("Skins", "Knife Options","-----YuDi.Lua Model Changer-----")
local replace_localplayer_model = ui.new_checkbox("Skins", "Knife Options", "Change Local Player Model")
local text = ui.new_label("Skins", "Knife Options","Choose Model")
local localplayer_model = ui.new_combobox("Skins", "Knife Options", "\nmodel", model_names)
ui.new_label("Skins", "Knife Options","-----------------------------------------")
ui.set_visible(text,false)
ui.set_visible(localplayer_model,false)
local function precache_model(modelname)
    local rawprecache_table = find_table(networkstringtablecontainer, "modelprecache") or error("couldnt find modelprecache", 2)
    if rawprecache_table then 
        local precache_table = ffi.cast(class_ptr, rawprecache_table) or error("couldnt cast precache_table", 2)
        if precache_table then 
            local add_string = ffi.cast("add_string_t", precache_table[0][8]) or error("add_string is nil", 2)

            find_or_load_model(ivmodelinfo, modelname)
            local idx = add_string(precache_table, false, modelname, -1, nil)
            if idx == -1 then 
                return false
            end
        end
    end
    return true
end
local function set_model_index(entity, idx)
    local raw_entity = get_client_entity(ientitylist, entity)
    if raw_entity then 
        local gce_entity = ffi.cast(class_ptr, raw_entity)
        local a_set_model_index = ffi.cast("set_model_index_t", gce_entity[0][75])
        if a_set_model_index == nil then 
            error("set_model_index is nil")
        end
        a_set_model_index(gce_entity, idx)
    end
end
local function change_model(ent, model)
    if model:len() > 5 then 
        if precache_model(model) == false then 
            error("invalid model", 2)
        end
        local idx = get_model_index(ivmodelinfo, model)
        if idx == -1 then 
            return
        end
        set_model_index(ent, idx)
    end
end
client.set_event_callback("paint_ui",function()
	if ui.get(replace_localplayer_model) then 
		ui.set_visible(text,true)
		ui.set_visible(localplayer_model,true)
	else
		ui.set_visible(text,false)
		ui.set_visible(localplayer_model,false)
	end
end)
client.set_event_callback("net_update_start", function()
    local me = entity.get_local_player()
	if me == nil then return end
	if ui.get(replace_localplayer_model) then 
		change_model(me, player_models[ui.get(localplayer_model)])
	end
end)
else
	print("Please install the newest Model Pack and try again")
end