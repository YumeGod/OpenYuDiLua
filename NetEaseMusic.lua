--Credits
--[[
	Panorama-based HTTP library: https://gamesense.pub/forums/viewtopic.php?id=20765
	Panorama-based Sound library: https://gamesense.pub/forums/viewtopic.php?id=24003
	sapphyrus for surface renderer library
]]--
--region dependencies
--region surface
local function getsurface()
	local a={}local b=require"ffi"local c=require"bit"local d=c.bor;local e=b.string;local f=b.cast;local function g(h,i,type)return b.cast(type,b.cast("void***",h)[0][i])end;local function j(k,l,i,m)local h=client.create_interface(k,l)or error("invalid interface")local n,o=pcall(b.typeof,m)if not n then error(o,2)end;local p=g(h,i,o)or error("invalid vtable")return function(...)return p(h,...)end end;local function q(i,m)local r=b.typeof(m)return function(h,...)assert(h~=nil)if h then return g(h,i,r)(h,...)end end end;local s=b.typeof("char[?]")local t=b.typeof("int[1]")local u=b.typeof("wchar_t[?]")local v=j("localize.dll","Localize_001",15,"int(__thiscall*)(void*, const char*, wchar_t*, int)")local w=j("localize.dll","Localize_001",16,"int(__thiscall*)(void*, wchar_t*, char*, int)")local x=j("localize.dll","Localize_001",12,"wchar_t*(__thiscall*)(void*, const char*)")local y=j("vguimatsurface.dll","VGUI_Surface031",15,"void(__thiscall*)(void*, int, int, int, int)")local z=j("vguimatsurface.dll","VGUI_Surface031",16,"void(__thiscall*)(void*, int, int, int, int)")local A=j("vguimatsurface.dll","VGUI_Surface031",18,"void(__thiscall*)(void*, int, int, int, int)")local B=j("vguimatsurface.dll","VGUI_Surface031",19,"void(__thiscall*)(void*, int, int, int, int)")local C=j("vguimatsurface.dll","VGUI_Surface031",20,"void(__thiscall*)(void*, int*, int*, int)")local D=j("vguimatsurface.dll","VGUI_Surface031",23,"void(__thiscall*)(void*, unsigned long)")local E=j("vguimatsurface.dll","VGUI_Surface031",25,"void(__thiscall*)(void*, int, int, int, int)")local F=j("vguimatsurface.dll","VGUI_Surface031",26,"void(__thiscall*)(void*, int, int)")local G=j("vguimatsurface.dll","VGUI_Surface031",28,"void(__thiscall*)(void*, const wchar_t*, int, int)")local H=j("vguimatsurface.dll","VGUI_Surface031",34,"int(__thiscall*)(void*, const char*)")local I=j("vguimatsurface.dll","VGUI_Surface031",35,"bool(__thiscall*)(void*, int, char*, int)")local J=j("vguimatsurface.dll","VGUI_Surface031",36,"void(__thiscall*)(void*, int, const char*, int, bool)")local K=j("vguimatsurface.dll","VGUI_Surface031",37,"void(__thiscall*)(void*, int, const wchar_t*, int, int)")local L=j("vguimatsurface.dll","VGUI_Surface031",38,"void(__thiscall*)(void*, int)")local M=j("vguimatsurface.dll","VGUI_Surface031",39,"void(__thiscall*)(void*, int)")local N=j("vguimatsurface.dll","VGUI_Surface031",40,"void(__thiscall*)(void*, int, int&, int&)")local O=j("vguimatsurface.dll","VGUI_Surface031",41,"void(__thiscall*)(void*, int, int, int, int)")local P=j("vguimatsurface.dll","VGUI_Surface031",42,"bool(__thiscall*)(void*, int)")local Q=j("vguimatsurface.dll","VGUI_Surface031",43,"int(__thiscall*)(void*, bool)")local R=j("vguimatsurface.dll","VGUI_Surface031",66,"void(__thiscall*)(void*)")local S=j("vguimatsurface.dll","VGUI_Surface031",67,"void(__thiscall*)(void*)")local T=j("vguimatsurface.dll","VGUI_Surface031",71,"unsigned int(__thiscall*)(void*)")local U=j("vguimatsurface.dll","VGUI_Surface031",72,"void(__thiscall*)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int)")local V=j("vguimatsurface.dll","VGUI_Surface031",79,"void(__thiscall*)(void*, unsigned long, const wchar_t*, int&, int&)")local W=j("vguimatsurface.dll","VGUI_Surface031",100,"unsigned int(__thiscall*)(void*, int*, int*)")local X=j("vguimatsurface.dll","VGUI_Surface031",101,"unsigned int(__thiscall*)(void*, int, int)")local Y=j("vguimatsurface.dll","VGUI_Surface031",103,"void(__thiscall*)(void*, int, int, int, int)")local Z=j("vguimatsurface.dll","VGUI_Surface031",123,"void(__thiscall*)(void*, int, int, int, int, unsigned int, unsigned int, bool)")local function _(a0,a1)if a1 then local a2=1024;local a3=s(a2)w(a0,a3,a2)local a4=e(a3)return G(a0,a4:len(),0)else local a5=1024;local a6=u(a5)v(a0,a6,a5)return G(a6,a0:len(),0)end end;local function a7(a8,a0)local a6=u(1024)local a9=t()local aa=t()v(a0,a6,1024)V(a8,a6,a9,aa)local ab=tonumber(a9[0])local ac=tonumber(aa[0])return ab,ac end;local ad={}function a.create_font(ae,af,ag,ah)local ai=0;local r=type(ah)if r=="number"then ai=ah elseif r=="table"then for aj=1,#ah do ai=ai+ah[aj]end else error("invalid flags type, has to be number or table")end;local ak=string.format("%s\0%d\0%d\0%d",ae,af,ag,ai)if ad[ak]==nil then ad[ak]=T()U(ad[ak],ae,af,ag,0,0,d(ai),0,0)end;return ad[ak]end;function a.localize_string(al,am)local an=x(al)local ao=s(am or 1024)w(an,ao,am or 1024)return ao and e(ao)or nil end;function a.draw_text(ap,aq,ar,as,at,au,a8,a0)F(ap,aq)D(a8)E(ar,as,at,au)return _(a0,false)end;function a.draw_localized_text(ap,aq,ar,as,at,au,a8,a0)F(ap,aq)D(a8)E(ar,as,at,au)local av=x(a0)return _(av,true)end;function a.draw_line(aw,ax,ay,az,ar,as,at,au)y(ar,as,at,au)return B(aw,ax,ay,az)end;function a.draw_filled_rect(ap,aq,ab,ac,ar,as,at,au)y(ar,as,at,au)return z(ap,aq,ap+ab,aq+ac)end;function a.draw_outlined_rect(ap,aq,ab,ac,ar,as,at,au)y(ar,as,at,au)return A(ap,aq,ap+ab,aq+ac)end;function a.draw_filled_outlined_rect(ap,aq,ab,ac,aA,aB,aC,aD,aE,aF,aG,aH)y(aA,aB,aC,aD)z(ap,aq,ap+ab,aq+ac)y(aE,aF,aG,aH)return A(ap,aq,ap+ab,aq+ac)end;function a.draw_filled_gradient_rect(ap,aq,ab,ac,aA,aB,aC,aD,aE,aF,aG,aH,aI)y(aA,aB,aC,aD)Z(ap,aq,ap+ab,aq+ac,255,255,aI)y(aE,aF,aG,aH)return Z(ap,aq,ap+ab,aq+ac,0,255,aI)end;function a.draw_outlined_circle(ap,aq,ar,as,at,au,aJ,aK)y(ar,as,at,au)return Y(ap,aq,aJ,aK)end;function a.draw_poly_line(ap,aq,ar,as,at,au,aL)y(ar,as,at,au)return C(t(ap),t(aq),aL)end;function a.test_font(ap,aq,ar,as,at,au,a8)local aM,aN=a7(a8,"a b c d e f g h i j k l m n o p q r s t u v w x y z")a.draw_text(ap,aq,ar,as,at,au,a8,"a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 ß + # ä ö ü , . -")a.draw_text(ap,aq+aN,ar,as,at,au,a8,"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z = ! \" § $ % & / ( ) = ? { [ ] } \\ * ' _ : ; ~ ")end;function a.get_text_size(a8,a0)return a7(a8,a0)end;function a.set_mouse_pos(ap,aq)return X(ap,aq)end;function a.get_mouse_pos()local aO=t()local aP=t()W(aO,aP)local ap=tonumber(aO[0])local aq=tonumber(aP[0])return ap,aq end;function a.unlock_cursor()return R()end;function a.lock_cursor()return S()end;function a.load_texture(aQ)local aR=Q(false)J(aR,aQ,true,true)local aS=t()local aT=t()N(aR,aS,aT)local ab=tonumber(aS[0])local ac=tonumber(aT[0])return aR,ab,ac end;setmetatable(a,{__index=renderer})return a
end
package.loaded["surface"] = getsurface()
--endregion

--region lrc_parser_js
local lrc_parser = panorama.loadstring([[
	const EOL="\n";extractInfo=function(a){const b=a.trim().slice(1,-1);return b.split(": ")},lrcParser=function(a){if("string"!=typeof a)return null;let b=a.split(EOL);const c=/\[(\d*\:\d*\.?\d*)\]/,d=c,e=new RegExp(c.source+/(.+)/.source),f=[],g=[],h={};for(let c=0;!1===e.test(b[c]);c++)f.push(b[c]);f.reduce((a,b)=>{const[c,d]=extractInfo(b);return a[c]=d,a},h),b.splice(0,f.length);const i=new RegExp(e.source+"|"+d.source);b=b.filter(a=>i.test(a));for(let c=0,f=b.length;c<f;c++){const a=e.exec(b[c]),f=d.exec(b[c+1]);if(a&&f){const[,b,c]=a,[,d]=f;g.push({start:convertTime(b),text:c,end:convertTime(d)})}}return h.scripts=g,h},convertTime=function(a){a=a.split(":");const b=parseInt(a[0],10),c=parseFloat(a[1]);if(0<b){return parseFloat((60*b+c).toFixed(2))}return c};
return lrcParser
]])()
--endregion

--region HashMap
panorama.loadstring([[
	HashMap=function(){var a=0,b={};this.isEmpty=function(){return 0==a},this.containsKey=function(a){return a in b},this.containsValue=function(a){for(var c in b)if(b[c]==a)return!0;return!1},this.put=function(c,d){this.containsKey(c)||a++,b[c]=d},this.get=function(a){return this.containsKey(a)?b[a]:null},this.remove=function(c){this.containsKey(c)&&delete b[c]&&a--},this.values=function(){var a=[];for(var c in b)a.push(b[c]);return a},this.keySet=function(){var a=[];for(var c in b)a.push(c);return a},this.size=function(){return a},this.clear=function(){a=0,b={}}};  
]])()
--endregion

--region SoundLib
local function load_lib()
	local function a(b)local c,b="",b or 24;for d=1,b do c=c..string.char(client.random_int(97,122))end;return c end;local function e(f,g)for h,i in pairs(f)do if g==i[2]then return i[1]end end;return false end;local j={{'popup_accept_match_beep','Beep'},{'UIPanorama.generic_button_press','Generic Button'},{'mainmenu_press_home','Home Button'},{'tab_mainmenu_inventory','Inventory Tab'},{'tab_settings_settings','Settings Tab'},{'UIPanorama.mainmenu_press_quit','Quit Button'},{'sticker_applySticker','Sticker Apply'},{'sticker_nextPosition','Sticker Next Position'},{'container_sticker_ticker','Container Sticker Ticker'},{'container_weapon_ticker','Container Weapon Ticker'},{'container_countdown','Container Countdown'},{'inventory_inspect_sellOnMarket','Sell on Market'},{'UIPanorama.sidemenu_select','Sidemenu Select'},{'inventory_item_popupSelect','Item Popup'},{'UIPanorama.stats_reveal','Stats Reveal'},{'ItemRevealSingleLocalPlayer','Reveal Singleplayer'},{'ItemDropCommon','Item Drop (Common)'},{'ItemDropUncommon','Item Drop (Uncommon)'},{'ItemDropMythical','Item Drop (Mythical)'},{'ItemDropLegendary','Item Drop (Legendary)'},{'ItemDropAncient','Item Drop (Ancient)'},{'UIPanorama.XP.Ticker','XP Ticker'},{'UIPanorama.XP.BarFull','XP Bar Full'},{'UIPanorama.XP.NewRank','XP New Rank'},{'UIPanorama.XP.NewSkillGroup','New Skill Group'},{'UIPanorama.submenu_leveloptions_slidein','Map Vote SlideIn'},{'UIPanorama.submenu_leveloptions_select','Map Vote Select'},{'mainmenu_press_GO','Matchmaking Search'},{'buymenu_select','Buy Select'},{'UIPanorama.gameover_show','Gameover'},{'PanoramaUI.Lobby.Joined','Lobby Joined'},{'PanoramaUI.Lobby.Left','Lobby Left'},{'inventory_item_select','Inventory Select'},{'UIPanorama.inventory_new_item_accept','Inventory New Item'},{'sidemenu_slidein','Sidemenu Slidein'},{'sidemenu_slideout','Sidemenu Slideout'},{'UIPanorama.inventory_new_item','Inventory New Item'},{'inventory_inspect_weapon','Inventory Inspect Weapon'},{'inventory_inspect_knife','Inventory Inspect Knife'},{'inventory_inspect_sticker','Inventory Inspect Sticker'},{'inventory_inspect_graffiti','Inventory Inspect Graffiti'},{'inventory_inspect_musicKit','Inventory Inspect Music Kit'},{'inventory_inspect_coin','Inventory Inspect Coin'},{'inventory_inspect_gloves','Inventory Inspect Gloves'},{'inventory_inspect_close','Inventory Inspect Close'},{'popup_accept_match_waitquiet','Match Accept Tick'},{'popup_accept_match_person','Match Accept Person'},{'popup_accept_match_confirmed','Match Confirmed'},{'XrayStart','XRay Start'},{'rename_purchaseSuccess','Nametag Success'},{'rename_select','Nametag Select'},{'rename_teletype','Nametag Teletype'},{'weapon_selectReplace','Weapon Select Replace'},{'UIPanorama.popup_newweapon','New Weapon Popup'}}local k=panorama.loadstring([[
		return function(sound){$.DispatchEvent( 'PlaySoundEffect', sound, 'MOUSE');}
	]])()local function l(m)local n=e(j,m)if n then k(n)return true end;local o={}for p,q in pairs(j)do table.insert(o,q[2])end;return o end;local r=panorama.loadstring([[
		var _Create=function(a,b,c){var d,e,f=$.GetContextPanel();if(d=$.CreatePanel("Panel",f,b),!!d)return d.BLoadLayoutFromString(a,!1,!1)?(e=d.FindChildTraverse("CustomHTML"),e.msg="loading",e.finishRequest=!1,e.loadingJSArg=function(){e.RunJavascript("var player = document.querySelector('video');"+c)},$.RegisterEventHandler("HTMLJSAlert",e,function(a,b){a==e.id&&(e.msg=b)}),$.RegisterEventHandler("HTMLFinishRequest",e,function(a){a==e.id&&(e.finishRequest=!0,e.loadingJSArg())}),{panel:d,html:e}):void 0},_Destroy=function(a){null!=a&&(a.RemoveAndDeleteChildren(),a.DeleteAsync(0),a=null)},_ChromeFuncs=function(a,b){null!=b&&b.RunJavascript("var player = document.querySelector('video');"+a)};
		return {
			create: _Create,
			destroy: _Destroy,
			chromeFuncs: _ChromeFuncs,
		}
	]])()local s=[[
	<root>
		<styles>
			<include src="file://{resources}/styles/csgostyles.css" />
		</styles>
		<Panel>
		<HTML class="hide" id="CustomHTML" acceptsinput="false" acceptsfocus="false" focusonhover="false" mousetracking="false" url="about:blank" visible="false" />
		</Panel>
	</root>
	]]local function t(u)return[[
			<root>
				<styles>
					<include src="file://{resources}/styles/csgostyles.css" />
				</styles>
				<Panel>
				<Movie class="hide" id="CustomHTML" src="]]..u..[[" controls="none" visible="false" />
				</Panel>
			</root>]]end;local v={panel_name="",src="",instance=nil,panel=nil}v.__index=v;v.new=function(u,w)local self={}setmetatable(self,v)self.panel_name=w or a()self.src=u;local x=r.create(t(u),self.panel_name)self.instance,self.panel=x.html,x.panel;return self end;v.unload=function(self)r.destroy(self.panel)end;local y={panel_name="",panel_uri="",panel=nil,html=nil,ready=function(self)if not self.loaded and not self.html then return false end;return self.html.finishRequest end,state=function(self)if not self.loaded and not self.html then return false end;return self.html.state end,loaded=false}y.__index=y;y.new=function(z,w,A)local self={}setmetatable(self,y)self.panel_name=w or a()self.panel_uri=z or"about:blank"local B=r.create(s,self.panel_name,A)self.panel=B.panel;self.html=B.html;return self end;y.load=function(self)if not self.html then return false end;self.html.SetURL(self.panel_uri)self.loaded=true;return true end;y.state=function(self)return self.html.msg end;y.executeJS=function(self,C)if self:ready()then r.chromeFuncs(C,self.html)return true else return false end end;y.unload=function(self,C)r.chromeFuncs(C,self.html)r.destroy(self.panel)end;local D=[[
		player.pause();
		player.autoplay = false;
		player.addEventListener("canplay", function() { alert("loaded"+"|"+player.duration); }, true);
		player.addEventListener("playing", function() { alert("playing"); }, true);
		player.addEventListener("pause", function() { alert("paused"); }, true);
		player.addEventListener("ended", function() { alert("ended"); }, true);
		player.addEventListener("abort", function() { alert("abort"); }, true);
		player.addEventListener("timeupdate", function() { alert("playing"+"|"+player.currentTime); }, true);
	]]local E={sound_uri="",instance=nil}E.__index=E;E.new=function(F,G,H)local self={}setmetatable(self,E)self.sound_uri=F or""if G==true then self:load(H)end;return self end;E.load=function(self,I)if I then I=D..I end;self.instance=y.new(self.sound_uri,nil,I or D)return self.instance:load()end;E.switch=function(self,J)J=J or self.sound_uri;return self.instance:executeJS("player.pause();alert(\"switching\");player.autoplay = false;player.src = \""..J.."\"")end;E.play=function(self)return self.instance:executeJS("player.play()")end;E.pause=function(self)return self.instance:executeJS("player.pause()")end;E.volume=function(self,K)K=K/100;return self.instance:executeJS("player.volume = "..K)end;E.progress=function(self,L)return self.instance:executeJS("player.currentTime = "..L)end;E.unload=function(self)self.instance:unload("player.pause();alert(\"unloaded\")")end;E.reload=function(self)return self.instance:executeJS("player.load();player.pause();")end;E.alert=function(self,M)return self.instance:executeJS("alert(\""..M.."\");")end;E.state=function(self)return self.instance:state()end;return{newSound=E.new,newHTML=y.new,PlaySoundEffect=l,newMovie=v.new}
end
package.loaded["SoundLib"] = load_lib()
--endregion

--region extended string
function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c)
		fields[#fields + 1] = c
	end)
	return fields
end
--endregion

--region http_panorama
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
	var _create_http_req=function(a,b,c,d){http_lut.put(d,"requesting");$.AsyncWebRequest(b,{type:a,data:c,complete:function(a){http_lut.put(d,a.responseText)},timeout:6e4})};
	return _create_http_req
]])()
function http.get(type, URI, req_data, callback)
	local obj = {["type"] = type, ["handle"] = URI, ["data"] = req_data or {}, ["callback"] = callback, ["reqNum"] = uuid()}
	table.insert(data, obj)
end
function http.callback()
	for k, v in pairs(data) do
		local type = v["type"]
		local URI = v["handle"]
		local req_data = v["data"]
		local callback = v["callback"]
		local reqNum = v["reqNum"]
		local body = http_lut.get(reqNum)
		if body then
			if body ~= "requesting" then
				http_lut.remove(reqNum)
				table.remove(data, k)
				callback(body)
			end
		else
			netFunc(type, URI, req_data, reqNum)
		end
	end
	client.delay_call(.5, http.callback)
end
client.delay_call(.5, http.callback)
--endregion

--region netease_api
local gen_netease_apis = {
	search = function(arg, page)
		arg = tostring(arg)
		page = page <= 0 and 0 or page - 1
		return string.format("https://v1.hitokoto.cn/nm/search/%s?type=SONG&offset=%d&limit=30", arg, page)
	end,
	playlist = function(arg)
		arg = tostring(arg)
		return string.format("https://v1.hitokoto.cn/nm/playlist/%s", arg)
	end,
	artist = function(arg)
		arg = tostring(arg)
		return string.format("https://v1.hitokoto.cn/nm/artist/%s", arg)
	end,
	album = function(arg)
		arg = tostring(arg)
		return string.format("https://v1.hitokoto.cn/nm/album/%s", arg)
	end,
	music = function(arg)
		arg = tostring(arg)
		return string.format("https://v1.hitokoto.cn/nm/redirect/music/%s", arg)
	end,
	lrc = function(arg)
		arg = tostring(arg)
		return string.format("https://v1.hitokoto.cn/nm/lyric/%s", arg)
	end,
	vipcheck = function(arg)
		arg = tostring(arg)
		return string.format("https://v1.hitokoto.cn/nm/summary/%s", arg)
	end
}
--endregion
--endregion

--region cache global constants
local sound_name, search_cache, soundPlayer, player_auto_play, player_rpt, player_auto_next, mplayer_init, cur_lrc, cur_lrc_translated, search_box, result_label
--endregion

local soundlib = require("SoundLib")
local surface = require("surface")
ui.new_label("MISC", "Miscellaneous", "--------------------------------------------------")
sound_name = ui.new_label("MISC", "Miscellaneous", "Name")
ui.new_label("MISC", "Miscellaneous", "--------------------------------------------------")
search_cache = {}
soundPlayer = nil
local progress_manual = false
local snd1_label = ui.new_label("MISC", "Miscellaneous", "soundPlayerstate")
local player_progress = ui.new_slider("MISC", "Miscellaneous", "Progress", 0, 100, 0, false)
local player_volume = ui.new_slider("MISC", "Miscellaneous", "Volume", 0, 100, 100, true, '%')
ui.new_label("MISC", "Movement", "--------------------------------------------------")
ui.new_label("MISC", "Movement", "Playback Controls")
local player_play = ui.new_button("MISC", "Movement", "▶ Play", function()
	if soundPlayer then
		soundPlayer:play()
	end
end)
local player_pause = ui.new_button("MISC", "Movement", "❙❙ Pause", function()
	if soundPlayer then
		soundPlayer:pause()
	end
end)
local player_reload = ui.new_button("MISC", "Movement", "■ Stop", function()
	if soundPlayer then
		soundPlayer:reload()
	end
	if ui.get(player_auto_play) then
		ui.set(player_auto_play, false)
	end
end)
local player_previous = ui.new_button("MISC", "Movement", "⟲ Prev", function()
	mplayer_init(nil, -1)
end)
local player_next = ui.new_button("MISC", "Movement", "⟳ Next", function()
	mplayer_init(nil, 1)
end)
ui.new_label("MISC", "Movement", "--------------------------------------------------")
ui.new_label("MISC", "Movement", "Options")
player_auto_play = ui.new_checkbox("MISC", "Movement", "Auto Play")
player_rpt = ui.new_checkbox("MISC", "Movement", "Repeat")
player_auto_next = ui.new_checkbox("MISC", "Movement", "Auto Next")
debug = ui.new_checkbox("MISC", "Movement", "HTTP Debug")
ui.new_label("MISC", "Movement", "--------------------------------------------------")
ui.set_callback(debug, function(self)
	if ui.get(self) then
		ui.set_visible(self, false)
	end
end)
ui.set_callback(player_auto_next, function(self)
	if ui.get(self) then
		if ui.get(player_rpt) then
			ui.set(player_rpt, false)
		end
	end
end)
ui.set_callback(player_rpt, function(self)
	if ui.get(self) then
		if ui.get(player_auto_next) then
			ui.set(player_auto_next, false)
		end
	end
end)
local progress_cache = {}
ui.set_callback(player_volume, function()
	if soundPlayer then
		soundPlayer:volume(ui.get(player_volume))
	end
end)
ui.set_callback(player_progress, function()
	if soundPlayer and progress_cache.duration then
		if not progress_cache.currentTime then
			progress_manual = true
			client.delay_call(.3, function()
				progress_manual = false
			end)
			soundPlayer:progress((ui.get(player_progress) / 100) * progress_cache.duration)
		elseif math.abs(progress_cache.currentTime - (ui.get(player_progress) / 100) * progress_cache.duration) > 0.5 then
			progress_manual = true
			client.delay_call(.3, function()
				progress_manual = false
			end)
			soundPlayer:progress((ui.get(player_progress) / 100) * progress_cache.duration)
		else
			progress_manual = false
		end
	end
end)
local creating_session = false
client.set_event_callback("paint_ui", function()
	if soundPlayer then
		local state = soundPlayer:state()
		ui.set(snd1_label, state)
		if state:split("|")[1] == "loaded" then
			progress_cache["duration"] = state:split("|")[2]
			ui.set_visible(player_play, true)
			ui.set_visible(player_pause, false)
			ui.set_visible(player_reload, true)
			ui.set_visible(player_volume, true)
			ui.set_visible(player_previous, true)
			ui.set_visible(player_next, true)
			ui.set_visible(player_auto_next, true)
			ui.set_visible(player_rpt, true)
			ui.set_visible(player_auto_play, true)
			if ui.get(player_auto_play) and progress_cache.duration ~= 0 then
				if soundPlayer then
					soundPlayer:play()
				end
			end
		elseif state:split("|")[1] == "playing" then
			progress_cache["currentTime"] = state:split("|")[2]
			ui.set_visible(player_play, false)
			ui.set_visible(player_pause, true)
			ui.set_visible(player_reload, true)
			ui.set_visible(player_volume, true)
			ui.set_visible(player_previous, true)
			ui.set_visible(player_next, true)
			ui.set_visible(player_auto_next, true)
			ui.set_visible(player_rpt, true)
			ui.set_visible(player_auto_play, true)
		elseif state == "paused" then
			ui.set_visible(player_play, true)
			ui.set_visible(player_pause, false)
			ui.set_visible(player_reload, true)
			ui.set_visible(player_volume, true)
			ui.set_visible(player_previous, true)
			ui.set_visible(player_next, true)
			ui.set_visible(player_auto_next, true)
			ui.set_visible(player_rpt, true)
			ui.set_visible(player_auto_play, true)
		elseif state == "ended" then
			ui.set_visible(player_play, true)
			ui.set_visible(player_pause, false)
			ui.set_visible(player_reload, true)
			ui.set_visible(player_volume, true)
			ui.set_visible(player_previous, true)
			ui.set_visible(player_next, true)
			ui.set_visible(player_auto_next, true)
			ui.set_visible(player_rpt, true)
			ui.set_visible(player_auto_play, true)
			if ui.get(player_auto_next) then
				if ui.get(player_auto_play) then
					ui.set(player_auto_play, false)
					client.delay_call(2, ui.set, player_auto_play, true)
				end
				mplayer_init(nil, 1)
				if soundPlayer then
					soundPlayer:play()
				end
			end
			if ui.get(player_rpt) then
				if soundPlayer then
					soundPlayer:reload()
				end
				if ui.get(player_auto_play) then
					ui.set(player_auto_play, false)
				end
				if soundPlayer then
					soundPlayer:play()
				end
			end
		else
			ui.set_visible(player_play, false)
			ui.set_visible(player_pause, false)
			ui.set_visible(player_reload, false)
			ui.set_visible(player_volume, false)
			ui.set_visible(player_previous, false)
			ui.set_visible(player_next, false)
			ui.set_visible(player_auto_next, false)
			ui.set_visible(player_rpt, false)
			ui.set_visible(player_auto_play, false)
		end
		if not progress_manual then
			if progress_cache.duration and progress_cache.currentTime then
				if state:split("|")[1] == "playing" then
					ui.set(player_progress, progress_cache.currentTime / progress_cache.duration * 100)
				end
			end
		end
	else
		if creating_session then
			ui.set(snd1_label, "Creating audio session... please wait.")
		else
			ui.set(snd1_label, "ready")
		end
		ui.set_visible(player_play, false)
		ui.set_visible(player_pause, false)
		ui.set_visible(player_reload, false)
		ui.set_visible(player_volume, false)
		ui.set_visible(player_previous, false)
		ui.set_visible(player_next, false)
		ui.set_visible(player_auto_next, false)
		ui.set_visible(player_rpt, false)
		ui.set_visible(player_auto_play, false)
	end
end)
local lrc_show = ui.new_checkbox("MISC", "Miscellaneous", "Show lyric")
local lrc_color = ui.new_color_picker("MISC", "Miscellaneous", "lyric color", 39, 175, 131, 225)
local query_type_text = database.read("yuki_player_queryx010")
local search_type = ui.new_combobox("MISC", "Movement", "Search type", "Name", "Playlist ID")
if query_type_text then
	ui.set(search_type, query_type_text)
end
local search_label = ui.new_label("MISC", "Movement", "Search here")
local search_text = ui.new_textbox("MISC", "Movement", "Search Text")
local query_text = database.read("yuki_player_queryx020")
if query_text then
	ui.set(search_text, query_text)
end
local names = {}
local cur_index = 0
function mplayer_init(index, next)
	local max_index = #names
	if next and next == 1 and cur_index + 1 <= max_index then
		cur_index = cur_index + 1
	end
	if next and next == -1 and cur_index - 1 >= 1 then
		cur_index = cur_index - 1
	end
	if not next then
		cur_index = index
	end
	index = index or cur_index
	ui.set(search_box, index - 1)
	http.get('GET', gen_netease_apis.vipcheck(search_cache[index]), nil, function(efs)
		local efs_t = json.parse(efs)
		if efs_t.code ~= 400 then
			if not soundPlayer then
				soundPlayer = soundlib.newSound(gen_netease_apis.music(search_cache[index]), true)
				if ui.get(debug) then
					print("Create lyric http request id: " .. search_cache[index])
				end
				http.get('GET', gen_netease_apis.lrc(search_cache[index]), nil, function(c)
					local p = json.parse(c)
					if p.lrc then
						if tostring(p.lrc.lyric) ~= "userdata: NULL" then
							cur_lrc = json.parse(tostring(lrc_parser(p.lrc.lyric)))
						else
							cur_lrc = nil
						end
					else
						cur_lrc = nil
					end
					if p.tlyric then
						if tostring(p.tlyric.lyric) ~= "userdata: NULL" then
							cur_lrc_translated = json.parse(tostring(lrc_parser(p.tlyric.lyric)))
						else
							cur_lrc_translated = nil
						end
					else
						cur_lrc_translated = nil
					end
				end)
				ui.set(sound_name, "Selected :" .. names[index])
			else
				soundPlayer:switch(gen_netease_apis.music(search_cache[index]))
				ui.set(sound_name, "Selected :" .. names[index])
				if ui.get(debug) then
					print("Create lyric http request id: " .. search_cache[index])
				end
				http.get('GET', gen_netease_apis.lrc(search_cache[index]), nil, function(c)
					local p = json.parse(c)
					if p.lrc then
						if tostring(p.lrc.lyric) ~= "userdata: NULL" then
							cur_lrc = json.parse(tostring(lrc_parser(p.lrc.lyric)))
						else
							cur_lrc = nil
						end
					else
						cur_lrc = nil
					end
					if p.tlyric then
						if tostring(p.tlyric.lyric) ~= "userdata: NULL" then
							cur_lrc_translated = json.parse(tostring(lrc_parser(p.tlyric.lyric)))
						else
							cur_lrc_translated = nil
						end
					else
						cur_lrc_translated = nil
					end

				end)
			end
		else
			if index == max_index then
				mplayer_init(nil, -1)
				if ui.get(debug) then
					print("Skipping VIP Song")
				end
			else
				mplayer_init(nil, 1)
				if ui.get(debug) then
					print("Skipping VIP Song")
				end
			end
		end
	end)

end
local last_box_call
local search_button = ui.new_button("MISC", "Movement", "Search", function(self)
	if search_box then
		ui.set_visible(search_box, false)
	end
	ui.set_visible(self, false)
	ui.set(search_label, "Searching...")
	local text = ui.get(search_text)
	names = {}
	if ui.get(search_type) == "Name" then
		if ui.get(debug) then
			print("Create search request name: " .. text)
		end
		http.get('GET', gen_netease_apis.search(text, 0), nil, function(c)
			local res = json.parse(c)
			if res.code == 200 and res.result.songCount ~= 0 then
				search_cache = {}
				for key, value in pairs(res.result.songs) do
					table.insert(names, value.name)
					search_cache[#names] = value.id
				end
			end
			if search_box then
				ui.set_visible(search_box, false)
			end
			if #names == 0 then
				return
			end
			ui.set(result_label, "Results for " .. text)
			search_box = ui.new_listbox("MISC", "Miscellaneous", "Search Box", unpack(names))
			ui.set_visible(self, true)
			ui.set(search_label, "Search here")
			ui.set_callback(search_box, function(self)
				if ui.get(search_box) == nil then
					return
				end
				local index = ui.get(search_box) + 1
				if index == cur_index then
					return
				end
				progress_cache = {}
				ui.set(player_progress, 0)
				creating_session = true
				mplayer_init(index)
			end)
		end)
	elseif ui.get(search_type) == "Playlist ID" then
		if ui.get(debug) then
			print("Create search request playlist id: " .. text)
		end
		http.get('GET', gen_netease_apis.playlist(text), nil, function(c)
			local res = json.parse(c)
			if res.code == 200 and res.playlist.trackCount ~= 0 then
				search_cache = {}
				for key, value in pairs(res.playlist.tracks) do
					table.insert(names, value.name)
					search_cache[#names] = value.id
				end
			end
			if search_box then
				ui.set_visible(search_box, false)
			end
			if #names == 0 then
				return
			end
			ui.set(result_label, "Playlist : " .. res.playlist.name)
			search_box = ui.new_listbox("MISC", "Miscellaneous", "Search Box", unpack(names))
			ui.set_visible(self, true)
			ui.set(search_label, "Search here")
			ui.set_callback(search_box, function(self)
				if ui.get(search_box) == nil then
					return
				end
				local index = ui.get(search_box) + 1
				if index == cur_index then
					return
				end
				progress_cache = {}
				ui.set(player_progress, 0)
				creating_session = true
				mplayer_init(index)
			end)
		end)
	end
end)
result_label = ui.new_label("MISC", "Miscellaneous", "Result")
search_box = ui.new_listbox("MISC", "Miscellaneous", "Search Box", "")
SFont = surface.create_font("Segoe", 30, 600, {0x010})
SCFont = surface.create_font("Segoe", 26, 600, {0x010})
local scr_w, scr_h = client.screen_size()
client.set_event_callback("paint_ui", function()
	if not cur_lrc or not ui.get(lrc_show) then
		return
	end
	if soundPlayer then
		local state = soundPlayer:state()
		if state:split("|")[1] == "playing" and state:split("|")[2] ~= "0" then
			local curtime = tonumber(progress_cache.currentTime)
			if not curtime then
				return
			end
			for key, value in pairs(cur_lrc.scripts) do
				local start = tonumber(value.start)
				local ends = tonumber(value["end"])
				if curtime < ends and curtime > start then
					if value.text then
						local offset = surface.get_text_size(SFont, value.text)
						local r, g, b, a = ui.get(lrc_color)
						surface.draw_text(scr_w / 2 - offset / 2, scr_h / 5 * a / 53, r, g, b, 200, SFont, value.text)
					end
				end
			end
			if not cur_lrc_translated then
				return
			end
			for key, value in pairs(cur_lrc_translated.scripts) do
				local start = tonumber(value.start)
				local ends = tonumber(value["end"])
				if curtime < ends and curtime > start then
					if value.text then
						local offset = surface.get_text_size(SCFont, value.text)
						local r, g, b, a = ui.get(lrc_color)
						surface.draw_text(scr_w / 2 - offset / 2, scr_h / 5 * a / 53 + 30, r, g, b, 200, SCFont, value.text)
					end
				end
			end
		end
	end
end)
client.set_event_callback("shutdown", function()
	if soundPlayer then
		soundPlayer:unload()
	end
	if ui.get(search_text) then
		database.write("yuki_player_queryx020", ui.get(search_text))
	end
	if ui.get(search_type) then
		database.write("yuki_player_queryx010", ui.get(search_type))
	end
	http_lut.clear()
end)
