vector = require "vector"
dragging = (function()local a={}local b,c,d,e,f,g,h,i,j,k,l,m,n,o;local p={__index={drag=function(self,...)local q,r=self:get()local s,t=a.drag(q,r,...)if q~=s or r~=t then self:set(s,t)end;return s,t end,set=function(self,q,r)local j,k=client.screen_size()ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res)end,get=function(self)local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}}function a.new(u,v,w,x)x=x or 10000;local j,k=client.screen_size()local y=ui.new_slider("AA", "Fake lag",u.." pos",0,x,v/j*x)local z=ui.new_slider("AA", "Fake lag","\n"..u.." pos 2",0,x,w/k*x)ui.set_visible(y,false)ui.set_visible(z,false)return setmetatable({name=u,x_reference=y,y_reference=z,res=x},p)end;function a.drag(q,r,A,B,C,D,E)if globals.framecount()~=b then c=ui.is_menu_open()f,g=d,e;d,e=ui.mouse_position()i=h;h=client.key_state(0x01)==true;m=l;l={}o=n;n=false;j,k=client.screen_size()end;if c and i~=nil then if(not i or o)and h and f>q and g>r and f<q+A and g<r+B then n=true;q,r=q+d-f,r+e-g;if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r))end end end;table.insert(l,{q,r,A,B})return q,r,A,B end;return a end)()
dragging_2 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()
dragging_3 = (function()local a={}local b,c,d,e,f,g,h,i,j,k,l,m,n,o;local p={__index={drag=function(self,...)local q,r=self:get()local s,t=a.drag(q,r,...)if q~=s or r~=t then self:set(s,t)end;return s,t end,set=function(self,q,r)local j,k=client.screen_size()ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res)end,get=function(self)local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}}function a.new(u,v,w,x)x=x or 10000;local j,k=client.screen_size()local y=ui.new_slider("AA", "Fake lag",u.." pos",0,x,v/j*x)local z=ui.new_slider("AA", "Fake lag","\n"..u.." pos 2",0,x,w/k*x)ui.set_visible(y,false)ui.set_visible(z,false)return setmetatable({name=u,x_reference=y,y_reference=z,res=x},p)end;function a.drag(q,r,A,B,C,D,E)if globals.framecount()~=b then c=ui.is_menu_open()f,g=d,e;d,e=ui.mouse_position()i=h;h=client.key_state(0x01)==true;m=l;l={}o=n;n=false;j,k=client.screen_size()end;if c and i~=nil then if(not i or o)and h and f>q and g>r and f<q+A and g<r+B then n=true;q,r=q+d-f,r+e-g;if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r))end end end;table.insert(l,{q,r,A,B})return q,r,A,B end;return a end)()
dragging_4 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()
dragging_5 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()
dragging_6 = (function() local a={} local b,c,d,e,f,g,h,i,j,k,l,m,n,o,dg; local p={__index={drag=function(self,...) local q,r=self:get() local s,t=a.drag(q,r,...) if q~=s or r~=t then self:set(s,t) end; return s,t end, set=function(self,q,r) local j,k = client.screen_size() ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res) end, get=function(self) local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}} function a.new(u,v,w,x)x=x or 10000; local j,k=client.screen_size() local y=ui.new_slider("LUA","A",u.." window position 2",0,x,v/j*x) local z=ui.new_slider("LUA","A","\n"..u.." window position y 2",0,x,w/k*x) ui.set_visible(y,false) ui.set_visible(z,false) return setmetatable({name = u,x_reference = y,y_reference = z,res = x},p) end; function a.drag(q,r,A,B,C,D,E) if globals.framecount()~=b then c = ui.is_menu_open() f,g=d,e; d,e=ui.mouse_position() i=h; h=client.key_state(0x01)==true; m=l; l={} o=n; n=false; j,k=client.screen_size() end; if c and i~=nil then if (not i or o) and h and f>q and g>r and f<q+A and g<r+B then n=true; q,r=q+d-f,r+e-g; if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r)) end end if f>=q and g>=r and f<=q+A and g<=r+B then dg = true else dg = false end else  f,g,d,e = 0,0,0,0 dg = false end; table.insert(l,{q,r,A,B}) return q,r,A,B end;function a.match() return dg end;return a end)()

hk_dragger = dragging.new("Running YDL Flags Indicators", 400, 600)
hk_dragger_2 = dragging_2.new("Running YDL Boxer Indicators", 500, 600)
hk_dragger_3 = dragging_3.new("Running YDL Nememis Indicators", 500, 700)
hk_dragger_4 = dragging_4.new("Running YDL Fakelag Indicators", 100, 200)
hk_dragger_5 = dragging_5.new("Running YDL Safety Indicators", 1680, 35)
hk_dragger_6 = dragging_6.new("Running YDL LC Indicators", 1685, 55)

delay_shot = ui.reference("Rage", "Other", "Delay shot")
silent_aim = ui.reference("Rage", "Aimbot", "Silent aim")
pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch")
fakelag_value_limit = ui.reference("AA", "Fake lag", "Limit")
max_fov = ui.reference("Rage", "Aimbot", "Maximum FOV")
force_baim = ui.reference("Rage", "Other", "Force body aim")
dt_mode = ui.reference("RAGE", "Other", "Double tap mode")
fake_duck = ui.reference("RAGE", "Other", "Duck peek assist")
mp_scale = ui.reference("Rage", "Aimbot", "Multi-point scale")
leg_movement = ui.reference("AA", "Other", "Leg movement")
force_safe = ui.reference("Rage", "Aimbot", "Force safe point")
prefer_baim = ui.reference("Rage", "Other", "Prefer body aim")
dt_check, dt_key = ui.reference("RAGE", "Other", "Double tap")
prefer_safe = ui.reference("Rage", "Aimbot", "Prefer safe point")
min_dmg = ui.reference("RAGE", "Aimbot", "Minimum damage")
edge_yaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw")
min_htc = ui.reference("RAGE", "Aimbot", "Minimum hit chance")
yaw, yaw_slider = ui.reference("AA", "Anti-aimbot angles", "Yaw")
auto_wall = ui.reference("Rage", "Aimbot", "Automatic penetration")
resolver_check = ui.reference("Rage", "Other", "Anti-aim correction")
fake_yaw = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
hide_check, hide_key = ui.reference("AA", "Other", "On shot anti-aim")
fake_peeking, fake_peek_key = ui.reference("AA", "Other", "Fake peek")
yaw_target_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base")
jitter, jitter_slider = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")
slow_enabled, slowwalk_key = ui.reference("AA", "Other", "Slow motion")
aimbot_check, aimbot_hotkey = ui.reference("Rage", "Aimbot", "Enabled")
low_body = ui.reference("AA", "Anti-aimbot angles", "Lower body yaw target")
fakelag_exploit = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks")
free_body = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
quick_peek, quick_peek_key = ui.reference("Rage", "Other", "Quick peek assist")
bodyyaw_types, bodyyaw_val = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
freestand_type, freestand_key = ui.reference("AA", "Anti-aimbot angles", "Freestanding")
checkbox_force_third_person, hotkey_force_third_person = ui.reference("Visuals", "Effects", "Force third person (alive)")
resolver, resolver_override = ui.reference("RAGE", "Other", "Anti-aim correction"), ui.reference("RAGE", "Other", "Anti-aim correction override")

local enabled_custom_aa = ui.new_checkbox("AA", "Anti-aimbot angles", "★ Enabled YuDi.Lua Customized AntiAim ★")
local antiaim_dir = ui.new_combobox("AA", "Anti-aimbot angles", "● AntiAim Direction ●","Left Desync","Right Desync")
local status_acitve_visible = ui.new_combobox("AA", "Anti-aimbot angles", "Custom AntiAim Status -> ●","Default","Standing","Moving","Slow Motion","In Air","Crouching","Shooting","Hide Shot","Double Tap","Fake Duck","Wall Peek","Visible Peek","On Key","Manual Left","Manual Right")
local enabled_indicator = ui.new_checkbox("AA", "Anti-aimbot angles", "Enabled AntiAim Indicators")
local text_starts = ui.new_combobox("AA", "Anti-aimbot angles", "● Text Format Types ●", "Off", "Metixer", "Block Metixer", "Normal", "Default", "Default Centered", "Block", "Block Centered")
local information_l_3 = ui.new_label("AA", "Anti-aimbot angles", "● Text AntiAim Status Color ●")
local information_c_3 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n AntiAim Status_C", "0","255","255", "255")
local information_l_1 = ui.new_label("AA", "Anti-aimbot angles", "● Text Ideal Yaw Color ●")
local information_c_1 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Ideal Yaw Color 1_C", "255","155","47", "255")
local information_l_2 = ui.new_label("AA", "Anti-aimbot angles", "● Text LBY Target Color ●")
local information_c_2 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n LBY Target 1_C", "180","145","255", "255")
local information_l_4 = ui.new_label("AA", "Anti-aimbot angles", "● Text Anim Color ●")
local information_c_4 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Anim Color 1_C", "0", "255", "0", "255")
local information_l_5 = ui.new_label("AA", "Anti-aimbot angles", "● Text Double Tap Color ●")
local information_c_5 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Double Tap Color 1_C", "255", "200", "240", "255")
local text_distance = ui.new_slider("AA", "Anti-aimbot angles", "● Text Indicators Distance ●", - 20, 175, 0)
local arrows_starts = ui.new_combobox("AA", "Anti-aimbot angles", "● Arrows Format Types ●", "Off", "Metixer", "Block Metixer", "Normal", "Default", "Default Centered", "Block", "Block Centered")
local arrows_indicator_types = ui.new_combobox("AA", "Anti-aimbot angles", "● Arrows Indicator Types -> ●", "Default", "Triangle", "Circle Arrows", "Fish Spear", "Pair Arrows", "Pair Arrows 2", "Barroom", "Classic", "OneTap V2", "Small Square", "TranSparent", "Round", "Dick", "Square", "Stars", "Caresses", "Carabiner", "Special", "Crooked Arrow", "Circle", "Ribbon 1", "Ribbon 2", "Ribbon 3", "Ribbon 4", "Shadows", "Double Arrows", "Misc", "Mathematical Arrow", "Cross Arrowhead", "Triangles Arrows", "Triangles Arrows 2")
local rainbow_types = ui.new_multiselect("AA", "Anti-aimbot angles", "Rainbow Arrows Types", "Real Angle Arrows", "Fake Angle Arrows")
local arrows_rainbow_speed = ui.new_slider("AA", "Anti-aimbot angles", "Rainbow Arrows Speed",  1, 100, 1, true, "X", 1)
local real_label = ui.new_label("AA", "Anti-aimbot angles", "Real Angle Color")
local real_desync_color = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Real Angle Color_C", 255, 255, 255, 255)
local fake_label = ui.new_label("AA", "Anti-aimbot angles", "Fake Angle Color")
local fake_desync_color = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Fake Angle Color_C", 0, 255, 255, 255)
local manual_label = ui.new_label("AA", "Anti-aimbot angles", "Manual Angle Color")
local manual_desync_color = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Manual Angle Color_C", 0, 255, 255, 255)
local pulse_arrows = ui.new_checkbox("AA", "Anti-aimbot angles", "Pulse Arrows Indicators")
local pulse_types = ui.new_multiselect("AA", "Anti-aimbot angles", "Pulse Arrows Types", "Real Angle Arrows", "Fake Angle Arrows")
local pulse_speed = ui.new_slider("AA", "Anti-aimbot angles", "Arrows Pulse Speed", 1, 10, 1, true, "S", 1)
local arrows_distance = ui.new_slider("AA", "Anti-aimbot angles", "Arrows Indicators Distance", 0, 175, 120)
local enabled_box_indicator = ui.new_checkbox("AA", "Anti-aimbot angles", "● Enabled Box Infomation Indicators ●")
local blackbox_menu_type = ui.new_combobox("AA", "Anti-aimbot angles", "● Indicators Black Box Types ●", "Default", "Besiege")
local blackbox_flags_type = ui.new_combobox("AA", "Anti-aimbot angles", "● Information AntiAim Flags Format Types ●", "Capitalized", "Lowercase")
local blackbox_line_type = ui.new_combobox("AA", "Anti-aimbot angles", "● Black Box Lines Types ●", "Static Faded Color", "Rainbow Faded Color")
local blackbox_line_status = ui.new_combobox("AA", "Anti-aimbot angles", "● Black Box Lines Faded Types ●", "Forward Faded Color", "Backward Faded Color")
local blackbox_gradient_rainbow_speed = ui.new_slider("AA", "Anti-aimbot angles", "● Rainbow Faded Speed ●",  1, 100, 1, true, "X", 1)
local blackbox_gradient_1 = ui.new_label("AA", "Anti-aimbot angles", "● BlackBox Gradient Color 1 ●")
local blackbox_gradient_c_1 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n BlackBox Gradient Color C_1", "202", "70", "205", "255")
local blackbox_gradient_2 = ui.new_label("AA", "Anti-aimbot angles", "● BlackBox Gradient Color 2 ●")
local blackbox_gradient_c_2 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n BlackBox Gradient Color C_2", "201", "227", "58", "255")
local remove_skeet_indicators = ui.new_checkbox("AA", "Anti-aimbot angles", "● Remove Skeet Noumenon Indicators ●")
local box_tab_label = ui.new_label("AA", "Anti-aimbot angles", "● Box Tab Color ●")
local box_tab_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Box Tab C", "255", "255", "255", "255")
local box_format_label_disabled = ui.new_label("AA", "Anti-aimbot angles", "● Box Disabled Color ●")
local box_format_c_disabled = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Box Disabled C", "255", "255", "255", "255")
local box_format_label_1 = ui.new_label("AA", "Anti-aimbot angles", "● Box Format Color First ●")
local box_format_c_1 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Box Format C_1", "100", "155", "255", "255")
local box_format_label_2 = ui.new_label("AA", "Anti-aimbot angles", "● Box Format Color Second ●")
local box_format_c_2 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Box Format C_2", "200", "110", "205", "255")
local box_dh_label = ui.new_label("AA", "Anti-aimbot angles", "● Box D & H Color Second ●")
local box_dh_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Box D & H C_2", "255", "215", "145", "255")
local box_slider_label_1 = ui.new_label("AA", "Anti-aimbot angles", "● Box Slider Color First ●")
local box_slider_c_1 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Box Slider C_1", "59", "175", "222", "255")
local box_slider_label_2 = ui.new_label("AA", "Anti-aimbot angles", "● Box Slider Color Second ●")
local box_slider_c_2 = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Box Slider C_2", "202", "70", "205", "255")
local nem_slider_label = ui.new_label("AA", "Anti-aimbot angles", "● Nemesis Box Slider Color ●")
local nem_slider_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Nemesis Box Slider Color", "250", "150", "255", "255")
local h_aa_scale_label = ui.new_label("AA", "Anti-aimbot angles", "● AntiAim Information Box Scale Color ●")
local h_aa_scale_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n AntiAim Information Box Scale Color", "0", "115", "255", "255")
local h_aa_format_label = ui.new_label("AA", "Anti-aimbot angles", "● AntiAim Information Box Format Color ●")
local h_aa_format_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n AntiAim Information Box Format Color", "187", "128", "255", "255")
local value_savor_box_label = ui.new_label("AA", "Anti-aimbot angles", "● AntiAim Lagcomp Indicators Box Color ●")
local value_savor_box_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n AntiAim Lagcomp Box Color", "20", "20", "20", "255")
local value_savor_format_label = ui.new_label("AA", "Anti-aimbot angles", "● AntiAim Lagcomp Indicators Format Color ●")
local value_savor_format_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n AntiAim Lagcomp Format Color", "255", "255", "255", "255")
local value_savor_slider_label = ui.new_label("AA", "Anti-aimbot angles", "● AntiAim Lagcomp Indicators Slider Color ●")
local value_savor_slider_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n AntiAim Lagcomp Slider Color", "75", "75", "175", "200")
local h_fl_scale_label = ui.new_label("AA", "Anti-aimbot angles", "● Fakelag Information Box Scale Color ●")
local h_fl_scale_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Fakelag Information Box Scale Color", "0", "115", "255", "255")
local h_fl_format_label = ui.new_label("AA", "Anti-aimbot angles", "● Fakelag Information Box Format Color ●")
local h_fl_format_c = ui.new_color_picker("AA", "Anti-aimbot angles", "\n Fakelag Information Box Format Color", "187", "128", "255", "255")
local lag_arrows_status = ui.new_combobox("AA", "Anti-aimbot angles", "● Fakelag Value Format Fluctuate ●", "Static Fluctuate", "Arrows Fluctuate")
local lag_arrows_types = ui.new_combobox("AA", "Anti-aimbot angles", "● Fakelag Fluctuate Arrows -> ●", "Default", "Normal", "Triangle", "Circle Arrows", "Fish Spear", "Pair Arrows", "Pair Arrows 2", "Barroom", "Classic", "OneTap V2", "Small Square", "TranSparent", "Round", "Dick", "Square", "Stars", "Caresses", "Carabiner", "Special", "Crooked Arrow", "Circle", "Ribbon 1", "Ribbon 2", "Ribbon 3", "Ribbon 4", "Shadows", "Double Arrows", "Misc", "Mathematical Arrow", "Cross Arrowhead", "Triangles Arrows", "Triangles Arrows 2")
local lag_format_types = ui.new_combobox("AA", "Anti-aimbot angles", "● Fakelag Status Format Types ●", "Normal Format Status", "Emiya Format Status")
local enabled_circle_indicator = ui.new_checkbox("AA", "Anti-aimbot angles", "Enabled AntiAim Circle Indicators")
local invert_aa = ui.new_hotkey("AA", "Anti-aimbot angles", "Invert AntiAim")
ui.set(lag_arrows_status, "Arrows Fluctuate")
ui.set(blackbox_flags_type, "Lowercase")
ui.set(lag_arrows_types, "Classic")
ui.set(invert_aa, "Toggle")

first_label = ui.new_label("AA", "Anti-aimbot angles", "---------- Custom AntiAim Condition ----------")
local player_status_cond = {
    ["Default"] = {
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Default YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Default JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Default BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Default]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]L LoweL Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Default]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Standing"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Standing]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Standing YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Standing JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Standing BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Standing]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Moving"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Moving]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Moving YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Moving JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Moving BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Moving]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Slow Motion"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Slow Motion]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Slow Motion YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Slow Motion JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Slow Motion BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Slow Motion]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["In Air"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[In Air]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L In Air YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L In Air JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L In Air BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[In Air]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Crouching"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Crouching]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Crouching YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Crouching JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Crouching BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Crouching]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Shooting"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Shooting]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Shooting YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Shooting JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Shooting BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Shooting]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Hide Shot"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Hide Shot]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Hide Shot YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Hide Shot JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Hide Shot BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Hide Shot]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Hide Shot]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Double Tap"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Double Tap]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Double Tap YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Double Tap JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Double Tap BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Double Tap]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Double Tap]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Fake Duck"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Fake Duck]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Fake Duck YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Fake Duck JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Fake Duck BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Fake Duck]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Fake Duck]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Wall Peek"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Wall Peek]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Wall Peek YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Wall Peek JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Wall Peek BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Wall Peek]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Wall Peek]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Visible Peek"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Visible Peek]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Visible Peek YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Visible Peek JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Visible Peek BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Visible Peek]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Visible Peek]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["On Key"] = {
        ["enabled_status"] = ui.new_hotkey("AA", "Anti-aimbot angles", "[On Key]L Enabled AntiAim",false),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L On Key YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L On Key JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L On Key BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[On Key]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Key]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Manual Left"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Manual Left]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Manual Left YawSlider", -180, 180, -90, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Manual Left JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Manual Left BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Manual Left]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Manual Left]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Manual Right"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Manual Right]L Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]L Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]L Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]L Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Manual Right YawSlider", -180, 180, 90, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]L Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Manual Right JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]L Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n L Manual Right BodySlider", -180, 180, -90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Manual Right]L Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]L Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Manual Right]L Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },
}

local player_status_cond_2 = {
    ["Default"] = {
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Default YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Default JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Default BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Default]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Default]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Default]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Standing"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Standing]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Standing YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Standing JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Standing BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Standing]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Standing]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Standing]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Moving"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Moving]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Moving YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Moving JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Moving BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Moving]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Moving]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Moving]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Slow Motion"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Slow Motion]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Slow Motion YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Slow Motion JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Slow Motion BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Slow Motion]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Slow Motion]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Slow Motion]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["In Air"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[In Air]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R In Air YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R In Air JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R In Air BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[In Air]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[In Air]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[In Air]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Crouching"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Crouching]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Crouching YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Crouching JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Crouching BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Crouching]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Crouching]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Crouching]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Shooting"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Shooting]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Shooting YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Shooting JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Shooting BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Shooting]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Shooting]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Shooting]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Hide Shot"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Hide Shot]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Hide Shot YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Hide Shot JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Hide Shot BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Hide Shot]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Hide Shot]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Hide Shot]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Double Tap"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Double Tap]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Double Tap YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Double Tap JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Double Tap BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Double Tap]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Double Tap]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Double Tap]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Fake Duck"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Fake Duck]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Fake Duck YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Fake Duck JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Fake Duck BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Fake Duck]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Fake Duck]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Fake Duck]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Wall Peek"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Wall Peek]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Wall Peek YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Wall Peek JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Wall Peek BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Wall Peek]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Wall Peek]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Wall Peek]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Visible Peek"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Visible Peek]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Visible Peek YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Visible Peek JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Visible Peek BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Visible Peek]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Visible Peek]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Visible Peek]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["On Key"] = {
        ["enabled_status"] = ui.new_hotkey("AA", "Anti-aimbot angles", "[On Key]R Enabled AntiAim",false),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R On Key YawSlider", -180, 180, 0, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R On Key JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R On Key BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[On Key]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[On Key]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[On Key]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Manual Left"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Manual Left]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Manual Left YawSlider", -180, 180, -90, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Manual Left JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Manual Left BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Manual Left]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Left]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Manual Left]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },

    ["Manual Right"] = {
        ["enabled_status"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Manual Right]R Enabled AntiAim"),
        ["pitch"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]R Pitch","Off","Default","Up","Down","Minimal","Random"),
        ["yaw_base"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]R Yaw Base","Local view","At targets"),
        ["yaw"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]R Yaw","Off","180","Spin","Static","180 Z","Crosshair"),
        ["yaw_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Manual Right YawSlider", -180, 180, 90, true,"°", 1),
        ["jitter"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]R Yaw Jitter","Off","Offset","Center","Random"),
        ["jitter_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Manual Right JitterSlider", -180, 180, 0, true,"°", 1),
        ["body_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]R Body Yaw","Static","Jitter","Opposite"),
        ["body_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "\n R Manual Right BodySlider", -180, 180, 90, true,"°", 1),
        ["free_stand"] = ui.new_checkbox("AA", "Anti-aimbot angles", "[Manual Right]R Freestanding Body Yaw"),
        ["lby_status"] = ui.new_combobox("AA", "Anti-aimbot angles", "[Manual Right]R Lower Body Yaw Targets","Off","Sway","Eye yaw","Opposite"),
        ["lby_slider"] = ui.new_slider("AA", "Anti-aimbot angles", "[Manual Right]R Fake Yaw Limit", 0, 60, 60, true,"°", 1),
    },
}

local manual_aa = ui.new_checkbox("AA", "Anti-aimbot angles", "Manual-AntiAim")
local manual_left_dir = ui.new_hotkey("AA", "Anti-aimbot angles", "Manual-Left")
local manual_right_dir = ui.new_hotkey("AA", "Anti-aimbot angles", "Manual-Right")
local manual_backward_dir = ui.new_hotkey("AA", "Anti-aimbot angles", "Manual-Back")
local freestanding_direction = ui.new_hotkey("AA", "Anti-aimbot angles", "Freestanding Keybind")
local manual_state = ui.new_slider("AA", "Anti-aimbot angles", "\n Manual Direction Status", 0, 3, 0)
local enabled_antiaim_exploit = ui.new_checkbox("AA", "Anti-aimbot angles", "AntiAim Exploits")
local anims_type = ui.new_multiselect("AA", "Anti-aimbot angles", "AntiAim Exploits Anims", {
	"Enabled On Land Anims",
	"Enabled Break Leg Movement",
	"Enabled Break Lower Body Anims",
	"Disabled Slow Walk Anims",
	"Standing Half Crouching Anims",
	"Standing Full Crouching Anims",
	"Interpolate On Shot Animations",
	"Random AntiAim Exploit Anims"
})

local chkbox_slowwalk = ui.new_checkbox("AA", "Other", "Slow Walk(Attention Spread)")
local slider_slowwalk = ui.new_slider("AA", "Other", "Slow Walk Speed", 1, 100, 100, true, "%")
local limit_reference = ui.new_slider("AA", "Other", "Slow Motion Limit", 10, 57, 50, 57, "", 1, {[57] = "Max"})
ui.set_visible(manual_state, false)

lc_y = 0
lc_fix = 0
end_time = 0
check_lc = false
ground_ticks = 1
svg_patterns = {}
vec_data, flip = { }, true
YDL_real_global_choke = 15
Player_State = "Standing"
manual_status_open = true
fix_out, fix_in, time_fix = -0.42
logM, logMT, logF, logFT = "", "", "", ""
bomb_time, bomb_slider, bomb_dmg_slider, bomb_dmg_text = 0, 0, 0, 0
gradient_f_r, gradient_f_g, gradient_f_b, gradient_f_a = 255, 255, 255, 255
gradient_s_r, gradient_s_g, gradient_s_b, gradient_s_a = 255, 255, 255, 255
local vars = {timer, fortcalc, timer_max, c4_time_frozen, c4_defuse_frozen}
bomb_timer_text, bomb_timer_vars, bomb_dmg_text, bomb_dmg_vars = 0, 0, 0, 0
First_CK, FL_0, FL_1, FL_2, FL_3, chocked_fl, total_limit, absolute_limit = 0, 0, 0, 0, 0, 0, 0, 0
shot_circle, rv_circle, yaw_slider_manual_ref, yaw_slider_manual, fix_in, time_fix, get_aa_flags_add_y, break_anim, break_ranim = 0, 0, 0, 0, 0, 0, 0, 0, 0

local function multi_select(search_table, search_value)
	for _, table_value in pairs(search_table) do
		if (search_value == table_value) then
			return true
		end
	end
		return false
end

local function visible_table(val, bool)
	for key, v in pairs(val) do
		ui.set_visible(v, bool)
	end
end

bind_system = {
    left = false,
    right = false,
    back = false,
}

function bind_system:update()
	ui.set(manual_left_dir, "On hotkey")
	ui.set(manual_right_dir, "On hotkey")
	ui.set(manual_backward_dir, "On hotkey")

	local m_state = ui.get(manual_state)
	local left_state, right_state, backward_state = 
		ui.get(manual_left_dir), 
		ui.get(manual_right_dir),
		ui.get(manual_backward_dir)
	if  left_state == self.left and 
		right_state == self.right and
		backward_state == self.back then
		return
	end

	self.left, self.right, self.back = 
		left_state, 
		right_state, 
		backward_state
	if (left_state and m_state == 1) or (right_state and m_state == 2) or (backward_state and m_state == 3) then
		ui.set(manual_state, 0)
		return
	end

	if left_state and m_state ~= 1 then
		ui.set(manual_state, 1)
	end

	if right_state and m_state ~= 2 then
		ui.set(manual_state, 2)
	end

	if backward_state and m_state ~= 3 then
		ui.set(manual_state, 3)
	end
end

client.set_event_callback("weapon_fire", function(e)
	local localplayer = client.userid_to_entindex(e.userid)
	if localplayer ~= entity.get_local_player() then return end
	if -fix_out < globals.realtime() * time_fix then 
		fix_in = globals.realtime() + fix_out
	end 
end)

local function setMath(int, max, declspec)
	local int = (int > max and max or int)
	local tmp = max / int;
	local i = (declspec / tmp)
	i = (i >= 0 and math.floor(i + 0.5) or math.ceil(i - 0.5))
	return i
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
	YDL_weapon_visible = visible and true or false
	stored_target = enemy_entindex
	local enemy_player_number = entity.get_players(true)
end

client.set_event_callback("paint",YDL_visible_enemy)

client.set_event_callback("predict_command", function()
	local localplayer = entity.get_local_player()
	if not localplayer or not entity.is_alive(localplayer) or not ui.get(enabled_custom_aa) or not ui.get(enabled_antiaim_exploit) then
    		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0)
		return
	end

	if multi_select(ui.get(anims_type), "Disabled Slow Walk Anims") and ui.get(slow_enabled) and ui.get(slowwalk_key) then
    		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0, 9)
	end

	if multi_select(ui.get(anims_type), "Interpolate On Shot Animations") then
    		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 12)
    		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0, 9)
	end

	if multi_select(ui.get(anims_type), "Enabled Break Lower Body Anims") then
    		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", ui.get(bodyyaw_val) >= 1 and -1 or 1, 11)
	end

	if multi_select(ui.get(anims_type), "Standing Half Crouching Anims") then
    		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 16)
	end

	if multi_select(ui.get(anims_type), "Standing Full Crouching Anims") then
    		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 17)
	end

	if multi_select(ui.get(anims_type), "Enabled Break Leg Movement") then
    		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 8, 0)
	end

	local on_ground = bit.band(entity.get_prop(localplayer, "m_fFlags"), 1)
	if multi_select(ui.get(anims_type), "Enabled On Land Anims") and ui.get(pitch) ~= "Off" then
		if on_ground == 1 then
			ground_ticks = ground_ticks + 1
		else
			ground_ticks = 0
			end_time = globals.curtime() + 1
		end
    
		if ground_ticks > ui.get(fakelag_value_limit) +1 and end_time > globals.curtime() then
    			entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
		end
	end

	if multi_select(ui.get(anims_type), "Random AntiAim Exploit Anims") then
		local random_anims = math.random(1, 7)
		if random_anims == 1 then
			entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0, 9)
		elseif random_anims == 2 then
    			entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 8, 0)
		elseif random_anims == 3 then
    			entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 12)
		elseif random_anims == 4 then
    			entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 16)
		elseif random_anims == 5 then
    			entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 17)
		elseif random_anims == 6 then
    			entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
		elseif random_anims == 7 then
    			entity.set_prop(entity.get_local_player(), "m_flPoseParameter", ui.get(bodyyaw_val) >= 1 and - 1 or 1, 11)
		end
	end
end)

client.set_event_callback("paint", function(c)
	local localplayer = entity.get_local_player()
	if not localplayer or not entity.is_alive(localplayer) or not ui.get(enabled_custom_aa) or not ui.get(enabled_indicator) or not ui.get(enabled_box_indicator) then
		return
	end

	local client_get_can_exploit = function(localplayer, exploit_tick_shift)
	local weapons = entity.get_player_weapon(localplayer)
	local exploit_tickbase = entity.get_prop(localplayer, "m_nTickBase")
	local interval_crooked = globals.tickinterval() * (exploit_tickbase - exploit_tick_shift)
	interval_crooked = interval_crooked == nil and 1 or interval_crooked

	if interval_crooked < entity.get_prop(localplayer, "m_flNextAttack") then
		return false
	end

	if interval_crooked < entity.get_prop(weapons, "m_flNextPrimaryAttack") then
		return false
	end
		return true
	end

	can_shift_shot = client_get_can_exploit(localplayer, 17)
end)

local function hsv_to_rgb(h, s, v, a)
	local r, g, b
	local i = math.floor(h * 6);
	local f = h * 6 - i;
	local p = v * (1 - s);
	local q = v * (1 - f * s);
	local t = v * (1 - (1 - f) * s);
	i = i % 6

	if i == 0 then 
		r, g, b = v, t, p
	elseif i == 1 then
		r, g, b = q, v, p
	elseif i == 2 then
		r, g, b = p, v, t
	elseif i == 3 then
		r, g, b = p, q, v
	elseif i == 4 then
		r, g, b = t, p, v
	elseif i == 5 then
		r, g, b = v, p, q
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

client.set_event_callback("paint", function(cmd)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(enabled_custom_aa) then
		return
	end

	if multi_select(ui.get(anims_type), "Enabled Break Leg Movement") and ui.get(enabled_antiaim_exploit) then
		local random_math = math.random(1, 3)

		if random_math == 1 then
    			ui.set(leg_movement, "Off")
		elseif random_math == 2 then
    			ui.set(leg_movement, "Always slide")
		elseif random_math == 3 then
    			ui.set(leg_movement, "Never slide")
		end
	end

	fix_out = 0.32
	local hide_shot = ui.get(hide_check) and ui.get(hide_key)
	local double_tap = ui.get(dt_check) and ui.get(dt_key)
	local fake_duck = ui.get(fake_duck)
	local can_fire_wall = player_will_peek() == nil and false or player_will_peek()
	local visible_peek = YDL_weapon_visible == nil and false or YDL_weapon_visible
	local vx, vy, vz = entity.get_prop(local_player, "m_vecVelocity")
	local fl_speed = math.sqrt((vx * vx) + (vy * vy))
	local onground = (bit.band(entity.get_prop(local_player, "m_fFlags"), 1) == 1)
	local infiniteduck = (bit.band(entity.get_prop(local_player, "m_fFlags"), 2) == 2)
	local weapon = entity.get_player_weapon(local_player)
	local slowwalking = ui.get(slow_enabled) and ui.get(slowwalk_key)
	local shot_circle = fix_in > globals.realtime() and (setMath(fix_in - globals.realtime(), fix_out , 40) * 0.004) or 0
	local next_attack = entity.get_prop(weapon, "m_flNextPrimaryAttack")
	local tickbase_shift = entity.get_prop(local_player, "m_nTickBase")
	next_attack = next_attack == nil and 1 or next_attack
	tickbase_shift = tickbase_shift == nil and 1 or tickbase_shift
	local fired_shoot = next_attack <= tickbase_shift * globals.tickinterval() - 0.12
	local not_tickbase = hide_shot == false and double_tap == false and fake_duck == false
	local not_peek = can_fire_wall == false and YDL_weapon_visible == false
	local wall_peek = can_fire_wall == true and YDL_weapon_visible == false
	local shooting_aa_ref = ui.get(invert_aa) and player_status_cond_2["Shooting"] or player_status_cond["Shooting"]
	local shooting_aa = ui.get(shooting_aa_ref["enabled_status"])
	local hideshot_aa_ref = ui.get(invert_aa) and player_status_cond_2["Hide Shot"] or player_status_cond["Hide Shot"]
	local hideshot_aa = ui.get(hideshot_aa_ref["enabled_status"])
	local doubletap_aa_ref = ui.get(invert_aa) and player_status_cond_2["Double Tap"] or player_status_cond["Double Tap"]
	local doubletap_aa = ui.get(doubletap_aa_ref["enabled_status"])
	local fakeduck_aa_ref = ui.get(invert_aa) and player_status_cond_2["Fake Duck"] or player_status_cond["Fake Duck"]
	local fakeduck_aa = ui.get(fakeduck_aa_ref["enabled_status"])
	local wallpeek_aa_ref = ui.get(invert_aa) and player_status_cond_2["Wall Peek"] or player_status_cond["Wall Peek"]
	local wallpeek_aa = ui.get(wallpeek_aa_ref["enabled_status"])
	local visiblepeek_aa_ref = ui.get(invert_aa) and player_status_cond_2["Visible Peek"] or player_status_cond["Visible Peek"]
	local visiblepeek_aa = ui.get(visiblepeek_aa_ref["enabled_status"])
	local on_hotkey_aa_ref = ui.get(invert_aa) and player_status_cond_2["On Key"] or player_status_cond["On Key"]
	local on_hotkey_aa = ui.get(on_hotkey_aa_ref["enabled_status"])

	if fl_speed < 5 and not slowwalking and onground and not infiniteduck and not_peek and not_tickbase and fired_shoot and not on_hotkey_aa then 
		Player_State = "Standing"
		Player_State_Visible = "STANDING"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Standing" or "STANDING"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 7.5 or 6.5
	elseif fl_speed > 3 and not slowwalking and onground and not infiniteduck and not_peek and not_tickbase and fired_shoot and not on_hotkey_aa then
		Player_State = "Moving"
		Player_State_Visible = "MOVING"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Moving" or "MOVING"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 11 or 10
	elseif fl_speed > 3 and slowwalking and onground and not infiniteduck and not_peek and not_tickbase and fired_shoot and not on_hotkey_aa then
		Player_State = "Slow Motion"
		Player_State_Visible = "SLOW MOTION"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Slow Motion" or "SLOW MOTION"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 0 or - 1
	elseif not onground and not_tickbase and fired_shoot and not on_hotkey_aa then
		Player_State = "In Air"
		Player_State_Visible = "IN AIR"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Jumping" or "JUMPING"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 10 or 9
	elseif onground and infiniteduck and not_peek and not_tickbase and fired_shoot and not on_hotkey_aa then
		Player_State = "Crouching"
		Player_State_Visible = "CROUCHING"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Crouching" or "CROUCHING"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 5.5 or 4.5
	elseif not fired_shoot and shot_circle >= 0.001 and not_tickbase and not on_hotkey_aa and shooting_aa then
		Player_State = "Shooting"
		Player_State_Visible = "SHOOTING"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Shooting" or "SHOOTING"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 7 or 6
	elseif onground and wall_peek and not_tickbase and fired_shoot and not on_hotkey_aa and wallpeek_aa then
		Player_State = "Wall Peek"
		Player_State_Visible = "WALL PEEK"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Wall Peek" or "WALL PEEK"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 4.5 or 3.5
	elseif onground and visible_peek and not_tickbase and fired_shoot and not on_hotkey_aa and visiblepeek_aa then
		Player_State = "Visible Peek"
		Player_State_Visible = "VISIBLE PEEK"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Visible Peek" or "VISIBLE PEEK"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 2 or 1
	elseif hide_shot and not double_tap and not fake_duck and not on_hotkey_aa and hideshot_aa then
		Player_State = "Hide Shot"
		Player_State_Visible = "HIDE SHOT"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Hide Shot" or "HIDE SHOT"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 5 or 4
	elseif double_tap and not fake_duck and not on_hotkey_aa and doubletap_aa then
		Player_State = "Double Tap"
		Player_State_Visible = "DOUBLE TAP"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Double Tap" or "DOUBLE TAP"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 2.5 or 1.5
	elseif fake_duck and not on_hotkey_aa and fakeduck_aa then
		Player_State = "Fake Duck"
		Player_State_Visible = "FAKE DUCK"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "Fake Duck" or "FAKE DUCK"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 4.75 or 3.75
	elseif on_hotkey_aa then
		Player_State = "On Key"
		Player_State_Visible = "ON KEY"
		Player_State_Visible_2 = ui.get(blackbox_flags_type) == "Lowercase" and "On Key" or "ON KEY"
		get_aa_flags_add_y = ui.get(blackbox_flags_type) == "Lowercase" and 12 or 11
	end

	Player_State = Player_State == nil and "Default" or Player_State
	local active_selection_ref = ui.get(invert_aa) and player_status_cond_2[Player_State] or player_status_cond[Player_State]
	local active_selection_ref_2 = ui.get(invert_aa) and player_status_cond_2["Default"] or player_status_cond["Default"]
	local active_selection_ref_3 = ui.get(active_selection_ref["enabled_status"]) and active_selection_ref or active_selection_ref_2
	local active_selection_ref_4 = ui.get(invert_aa) and player_status_cond_2["Manual Left"] or player_status_cond["Manual Left"]
	local active_selection_ref_5 = ui.get(invert_aa) and player_status_cond_2["Manual Right"] or player_status_cond["Manual Right"]
	local active_selection_ref_6 = ui.get(manual_state) == 1 and active_selection_ref_4 or active_selection_ref_5
	active_selection_ref_status = ui.get(invert_aa) and player_status_cond_2[Player_State]["enabled_status"] or player_status_cond[Player_State]["enabled_status"]

	if not ui.get(manual_aa) then
		ui.set(manual_state, 0)
	end

	bind_system:update()
	local manual_status_open = true
	if ui.get(manual_aa) and ui.get(manual_state) == 1 then
		yaw_slider_manual_ref = ui.get(active_selection_ref_6["enabled_status"]) and ui.get(active_selection_ref_4["yaw_slider"]) or - 90
		manual_status_open = false
	elseif ui.get(manual_aa) and ui.get(manual_state) == 2 then
		yaw_slider_manual_ref = ui.get(active_selection_ref_6["enabled_status"]) and ui.get(active_selection_ref_5["yaw_slider"]) or 90
		manual_status_open = false
	elseif ui.get(manual_aa) and ui.get(manual_state) == 0 or ui.get(manual_state) == 3 then
		manual_status_open = true
	end

	local active_selection = manual_status_open and active_selection_ref_3 or ui.get(active_selection_ref_6["enabled_status"]) and active_selection_ref_6 or active_selection_ref_3
	local yaw_slider_manual =  manual_status_open and ui.get(active_selection["yaw_slider"]) or yaw_slider_manual_ref
	ui.set(pitch, ui.get(active_selection["pitch"]))
	ui.set(yaw_target_base, ui.get(active_selection["yaw_base"]))
	ui.set(yaw, ui.get(active_selection["yaw"]))
	ui.set(yaw_slider, manual_status_open == true and ui.get(active_selection["yaw_slider"]) or yaw_slider_manual)
	ui.set(jitter, ui.get(active_selection["jitter"]))
	ui.set(jitter_slider, ui.get(active_selection["jitter_slider"]))
	ui.set(bodyyaw_types, ui.get(active_selection["body_status"]))
	ui.set(bodyyaw_val, ui.get(active_selection["body_slider"]))
	ui.set(free_body, ui.get(active_selection["free_stand"]))
	ui.set(low_body, ui.get(active_selection["lby_status"]))
	ui.set(fake_yaw, ui.get(active_selection["lby_slider"]))
	ui.set(freestand_type, ui.get(manual_aa) and "Default" or "-")
	ui.set(freestand_key, ui.get(manual_aa) and ui.get(freestanding_direction) and "Always on" or "On hotkey" or "On hotkey")

	if ui.get(arrows_indicator_types) == "Default" then
		arrows_left = "⮜"
		arrows_right = "⮞"
	elseif ui.get(arrows_indicator_types) == "Triangle" then
		arrows_left = "⭠"
		arrows_right = "⭢"
	elseif ui.get(arrows_indicator_types) == "Circle Arrows" then
		arrows_left = "⮈"
		arrows_right = "⮊"
	elseif ui.get(arrows_indicator_types) == "Fish Spear" then
		arrows_left = "↼"
		arrows_right = "⇀"
	elseif ui.get(arrows_indicator_types) == "Pair Arrows" then
		arrows_left = "⮄"
		arrows_right = "⮆"
	elseif ui.get(arrows_indicator_types) == "Pair Arrows 2" then
		arrows_left = "⇚"
		arrows_right = "⇛"
	elseif ui.get(arrows_indicator_types) == "Barroom" then
		arrows_left = "⭰"
		arrows_right = "⭲"
	elseif ui.get(arrows_indicator_types) == "Classic" then
		arrows_left = "<"
		arrows_right = ">"
	elseif ui.get(arrows_indicator_types) == "OneTap V2" then
		arrows_left = "◁"
		arrows_right = "▷"
	elseif ui.get(arrows_indicator_types) == "Small Square" then
		arrows_left = "⯇"
		arrows_right = "⯈"
	elseif ui.get(arrows_indicator_types) == "TranSparent" then
		arrows_left = "⮘"
		arrows_right = "⮚"
	elseif ui.get(arrows_indicator_types) == "Round" then
		arrows_left = "("
		arrows_right = ")"
	elseif ui.get(arrows_indicator_types) == "Dick" then
		arrows_left = "ꓷ"
		arrows_right = "D"
	elseif ui.get(arrows_indicator_types) == "Square" then
		arrows_left = "⍃"
		arrows_right = "⍄"
	elseif ui.get(arrows_indicator_types) == "Stars" then
		arrows_left = "★"
		arrows_right = "★"
	elseif ui.get(arrows_indicator_types) == "Caresses" then
		arrows_left = "⇷"
		arrows_right = "⇸"
	elseif ui.get(arrows_indicator_types) == "Carabiner" then
		arrows_left = "↩"
		arrows_right = "↪"
	elseif ui.get(arrows_indicator_types) == "Special" then
		arrows_left = "⤙"
		arrows_right = "⤚"
	elseif ui.get(arrows_indicator_types) == "Crooked Arrow" then
		arrows_left = "⭜"
		arrows_right = "⭝"
	elseif ui.get(arrows_indicator_types) == "Circle" then
		arrows_left = "↶"
		arrows_right = "↷"
	elseif ui.get(arrows_indicator_types) == "Ribbon 1" then
		arrows_left = "⮰"
		arrows_right = "⮱"
	elseif ui.get(arrows_indicator_types) == "Ribbon 2" then
		arrows_left = "⮲"
		arrows_right = "⮳"
	elseif ui.get(arrows_indicator_types) == "Ribbon 3" then
		arrows_left = "⮴"
		arrows_right = "⮵"
	elseif ui.get(arrows_indicator_types) == "Ribbon 4" then
		arrows_left = "⮶"
		arrows_right = "⮷"
	elseif ui.get(arrows_indicator_types) == "Shadows" then
		arrows_left = "◄"
		arrows_right = "►"
	elseif ui.get(arrows_indicator_types) == "Double Arrows" then
		arrows_left = "↞"
		arrows_right = "↠"
	elseif ui.get(arrows_indicator_types) == "Misc" then
		arrows_left = "◅"
		arrows_right = "▻"
	elseif ui.get(arrows_indicator_types) == "Mathematical Arrow" then
		arrows_left = "⥷"
		arrows_right = "⭃"
	elseif ui.get(arrows_indicator_types) == "Cross Arrowhead" then
		arrows_left = "⤪"
		arrows_right = "⤨"
	elseif ui.get(arrows_indicator_types) == "Triangles Arrows" then
		arrows_left = "◀"
		arrows_right = "▶"
	elseif ui.get(arrows_indicator_types) == "Triangles Arrows 2" then
		arrows_left = "⯇"
		arrows_right = "⯈"
	end

	if ui.get(enabled_indicator) then
		local screen_x, screen_y = client.screen_size()
		local real_x, real_y = screen_x / 2, screen_y / 2
		local double_tap = ui.get(dt_check) and ui.get(dt_key)
		local hide_shot = ui.get(hide_check) and ui.get(hide_key)
		local real_r, real_g, real_b, real_a = ui.get(real_desync_color)
		local location_x, location_y, location_z = client.eye_position()
		local pitch_attack, attack_head_yaw = client.camera_angles()
		local fake_r, fake_g, fake_b, fake_a = ui.get(fake_desync_color)
		local vis_dt_ref = can_shift_shot and "DT(ACTIVE)" or "DT(INACTIVE)"
		local head_x, head_y, head_z = entity.hitbox_position(local_player, 0)
		local form_r_1, form_g_1, form_b_1, form_a_1 = ui.get(information_c_1)
		local form_r_2, form_g_2, form_b_2, form_a_2 = ui.get(information_c_2)
		local form_r_3, form_g_3, form_b_3, form_a_3 = ui.get(information_c_3)
		local form_r_4, form_g_4, form_b_4, form_a_4 = ui.get(information_c_4)
		local form_r_5, form_g_5, form_b_5, form_a_5 = ui.get(information_c_5)
		local delta_head_x, delta_head_y = head_x - location_x, head_y - location_y
		local body_posepara = entity.get_prop(local_player, "m_flPoseParameter", 11)
		local manual_r, manual_g, manual_b, manual_a = ui.get(manual_desync_color)
		local standheight_head_yaw = math.deg(math.atan2(delta_head_y, delta_head_x))
		local fake_yaw_angle = math.max(- 60, math.min(60, body_posepara*120 - 60 + 0.5))
		local body_ratato = fake_yaw_angle <= - 1 and - fake_yaw_angle or fake_yaw_angle
		local visible_anims = client.key_state(0x45) and "E PEEK" or hide_shot and "HIDE" or "ANIM"
		local Player_State_Visible_Flags = active_selection_ref_status and Player_State_Visible or "DEFAULT"
		local vis_dt_r, vis_dt_g, vis_dt_b, vis_dt_a = can_shift_shot and 0 or 255, can_shift_shot and 255 or 0, 0, time_pulse
		local desync_color = {255 - (body_ratato*2.29824561404), body_ratato*3.42105263158, body_ratato*0.22807017543}
		local time_pulse = math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 6 - ui.get(pulse_speed))) % (math.pi * 2))) * 80
		local real_arrows_alpha = manual_status_open and fake_yaw_angle >=1 and real_a or fake_a or 0
		local fake_arrows_alpha = manual_status_open and fake_yaw_angle >=1 and fake_a or real_a or 0
		local rainbow_r, rainbow_g, rainbow_b = func_rgb_rainbowize((ui.get(arrows_rainbow_speed) / 10), 1)
		if ui.get(pulse_arrows) and multi_select(ui.get(pulse_types), "Real Angle Arrows") then
			real_arrows_alpha = fake_yaw_angle >= 1 and time_pulse * 3.135 or real_arrows_alpha
			fake_arrows_alpha = fake_yaw_angle <= - 1 and time_pulse * 3.135 or fake_arrows_alpha
		end

		if ui.get(pulse_arrows) and multi_select(ui.get(pulse_types), "Fake Angle Arrows") then
			real_arrows_alpha = fake_yaw_angle <= - 1 and time_pulse * 3.135 or real_arrows_alpha
			fake_arrows_alpha = fake_yaw_angle >= 1 and time_pulse * 3.135 or fake_arrows_alpha
		end

		if multi_select(ui.get(rainbow_types), "Real Angle Arrows") then
			ui.set(real_desync_color, rainbow_r, rainbow_g, rainbow_b, fake_a)
		end

		if multi_select(ui.get(rainbow_types), "Fake Angle Arrows") then
			ui.set(fake_desync_color, rainbow_r, rainbow_g, rainbow_b, real_a)
		end

		if ui.get(arrows_starts) == "Off" then
			fonts_types = ""
		elseif ui.get(arrows_starts) == "Metixer" then
			fonts_types = "c"
		elseif ui.get(arrows_starts) == "Block Metixer" then
			fonts_types = "c+"
		elseif ui.get(arrows_starts) == "Normal" then
			fonts_types = "cb"
		elseif ui.get(arrows_starts) == "Default" then
			fonts_types = "d"
		elseif ui.get(arrows_starts) == "Default Centered" then
			fonts_types = "dc"
		elseif ui.get(arrows_starts) == "Block" then
			fonts_types = "d-"
		elseif ui.get(arrows_starts) == "Block Centered" then
			fonts_types = "dc-"
		end

		if ui.get(text_starts) == "Off" then
			t_fonts_types = ""
		elseif ui.get(text_starts) == "Metixer" then
			t_fonts_types = "c"
		elseif ui.get(text_starts) == "Block Metixer" then
			t_fonts_types = "c+"
		elseif ui.get(text_starts) == "Normal" then
			t_fonts_types = "cb"
		elseif ui.get(text_starts) == "Default" then
			t_fonts_types = "d"
		elseif ui.get(text_starts) == "Default Centered" then
			t_fonts_types = "dc"
		elseif ui.get(text_starts) == "Block" then
			t_fonts_types = "d-"
		elseif ui.get(text_starts) == "Block Centered" then
			t_fonts_types = "dc-"
		end

		if ui.get(low_body) == "Off" then
			visible_lby_target = "OFF"
		elseif ui.get(low_body) == "Sway" then
			visible_lby_target = "SWAY"
		elseif ui.get(low_body) == "Eye yaw" then
			visible_lby_target = "EYEYAW"
		elseif ui.get(low_body) == "Opposite" then
			visible_lby_target = "OPPOSITE"
		end

		renderer.text(real_x, ui.get(text_starts) == "Block Metixer" and real_y + 55 + ui.get(text_distance) or real_y + 35 + ui.get(text_distance), form_r_3, form_g_3, form_b_3, form_a_3, t_fonts_types, 0, manual_status_open == true and Player_State_Visible_Flags or ui.get(manual_state) == 1 and "MANUAL LEFT" or "MANUAL RIGHT")
		renderer.text(real_x, ui.get(text_starts) == "Block Metixer" and real_y + ui.get(text_distance) + 75 or real_y + ui.get(text_distance) + 45, form_r_1, form_g_1, form_b_1, form_a_1, t_fonts_types, 0, "IDEAL YAW")
		renderer.text(real_x, ui.get(text_starts) == "Block Metixer" and real_y + ui.get(text_distance) + 95 or real_y + ui.get(text_distance) + 55, form_r_2, form_g_2, form_b_2, form_a_2, t_fonts_types, 0, visible_lby_target)
		renderer.text(real_x, ui.get(text_starts) == "Block Metixer" and real_y + ui.get(text_distance) + 115 or real_y + ui.get(text_distance) + 65, form_r_4, form_g_4, form_b_4, form_a_4, t_fonts_types, 0, visible_anims)
		renderer.text(real_x,ui.get(text_starts) == "Block Metixer" and real_y + ui.get(text_distance) + 135 or real_y + ui.get(text_distance) + 75, dt and vis_dt_r or form_r_5, dt and vis_dt_g or form_g_5, dt and vis_dt_b or form_b_5, dt and vis_dt_a or form_a_5, t_fonts_types, 0, double_tap and vis_dt_ref or "DT(DISABLED)")
		renderer.text(real_x - ui.get(arrows_distance) - 30, real_y - 6, fake_yaw_angle >= 1 and real_r or fake_r, fake_yaw_angle >= 1 and real_g or fake_g, fake_yaw_angle >= 1 and real_b or fake_b, real_arrows_alpha, fonts_types, 0, manual_status_open and arrows_left or "")
		renderer.text(real_x + ui.get(arrows_distance) + 20, real_y - 6, fake_yaw_angle >= 1 and fake_r or real_r, fake_yaw_angle >= 1 and fake_g or real_g, fake_yaw_angle >= 1 and fake_b or real_b, fake_arrows_alpha, fonts_types, 0, manual_status_open and arrows_right or "")
		renderer.text(ui.get(manual_state) == 1 and real_x - ui.get(arrows_distance) - 30 or real_x + ui.get(arrows_distance) + 20, real_y - 6, manual_r, manual_g, manual_b, manual_status_open and 0 or manual_a, fonts_types, 0, ui.get(manual_state) == 1 and arrows_left or arrows_right)
		renderer.circle_outline(real_x, real_y, 0, 0, 0, ui.get(enabled_circle_indicator) and 155 or 0, 10, 0, 1, 8)
		renderer.circle_outline(real_x + 1, real_y, desync_color[1], desync_color[2], desync_color[3], ui.get(enabled_circle_indicator) and 255 or 0, 10, fake_yaw_angle <= -1 and 94 or 269, 0.5, 5)
		renderer.circle_outline(real_x, real_y ,desync_color[1], desync_color[2], desync_color[3], ui.get(enabled_circle_indicator) and 255 or 0, 19, attack_head_yaw - standheight_head_yaw - 110, 0.25, 5)
	end
end)

local function change_speed(creative_speed)
	if client.get_cvar("cl_sidespeed") == 450 and creative_speed == 450 then
		return
	end

	client.set_cvar("cl_sidespeed", creative_speed)
	client.set_cvar("cl_forwardspeed", creative_speed)
	client.set_cvar("cl_backspeed", creative_speed)
end

client.set_event_callback("run_command", function()
	if not ui.get(chkbox_slowwalk) then 
		return 
	end

	if not ui.get(slowwalk_key) then
		change_speed(450)
	else
		local final_val = 250 * ui.get(slider_slowwalk) / 100
		change_speed(final_val)
	end
end)

local function modify_velocity(cmd, goalspeed)
	if goalspeed <= 0 then
		return
	end

	local minimalspeed = math.sqrt((cmd.forwardmove * cmd.forwardmove) + (cmd.sidemove * cmd.sidemove))
	if minimalspeed <= 0 then
		return
	end

	if cmd.in_duck == 1 then
		goalspeed = goalspeed * 2.94117647
	end

	if minimalspeed <= goalspeed then
		return
	end
	
	local speedfactor = goalspeed / minimalspeed
	cmd.forwardmove = cmd.forwardmove * speedfactor
	cmd.sidemove = cmd.sidemove * speedfactor
end

local function Length2DSqr(vec)
	return (vec[1]*vec[1] + vec[2]*vec[2]) 
end

local function vecMvec(vec, vec1)
	return {vec[1]-vec1[1], vec[2]-vec1[2]}
end

local function ro(num, n)
	return math.floor(num * 10^(n or 0) + 0.5) / 10^(n or 0)
end

local function get_player_velocity(Entity)
	local vx = entity.get_prop(Entity, "m_vecVelocity[0]")
	local vy = entity.get_prop(Entity, "m_vecVelocity[1]")
	return math.floor(math.min(10000, math.sqrt(vx*vx + vy*vy) + 0.5))
end


local function get_c4_time(ent)
	local c4_time = entity.get_prop(ent, "m_flC4Blow") - globals.curtime()
	return c4_time ~= nil and c4_time > 0 and c4_time or 0
end

local function isnt_defusable(ent)
	local c4_time, has_defuser = get_c4_time(ent), entity.get_prop(ent, "m_hBombDefuser")
	if has_defuser == 1 then
		if vars.c4_time_frozen < entity.get_prop(ent, "m_flDefuseCountDown") - globals.curtime() then
			return true
		end
	else
		if c4_time < 6 then
			return true
		end
	end

	return false
end

local function get_c4_damage(ent)
	local c4 = entity.get_all("CPlantedC4")[1]
	if not entity.is_alive(entity.get_local_player()) or c4 == nil then
		return
	end

	local lp_orig, c4_orig = vector(entity.get_origin(entity.get_local_player())), vector(entity.get_origin(ent))
	local dist_lp_c4 = lp_orig:dist(c4_orig)
	local get_armor = entity.get_prop(entity.get_local_player(), "m_ArmorValue")
	local bomb_first_a, bomb_first_b, bomb_first_c = 450.7, 75.68, 789.2
	local bomb_first_d = (dist_lp_c4 - bomb_first_b) / bomb_first_c
	local bomb_dmg = bomb_first_a * math.exp( - bomb_first_d * bomb_first_d)

	if get_armor > 0 then
		local new_bomb_dmg = bomb_dmg * 0.5
		local bomb_armor = (bomb_dmg - new_bomb_dmg) * 0.5

	if bomb_armor > get_armor then
		bomb_armor = get_armor * (1 / 0.5)
		new_bomb_dmg = bomb_dmg - bomb_armor
	end
		bomb_damage = new_bomb_dmg
	end

	return bomb_damage
end

client.set_event_callback("paint", function(e)
	local c4 = entity.get_all("CPlantedC4")[1]
	if c4 == nil or entity.get_prop(c4, "m_bBombDefused") == 1 or not entity.is_alive(entity.get_local_player()) then
		bomb_timer_vars = 0.00
		return
	end

	local def_timer = entity.get_prop(c4, "m_flDefuseCountDown") - globals.curtime()
	vars.timer, vars.fortcalc, vars.timer_max = math.ceil(get_c4_time(c4) * 10 ^ 1 - 0.5)/10 ^ 1 - 0.5, get_c4_time(c4), client.get_cvar("mp_c4timer")

	if entity.get_prop(c4, "m_hBombDefuser") == 1 then 
		vars.timer = math.ceil(def_timer * 10 ^ 1 - 0.5)/10 ^ 1 - 0.5
		vars.fortcalc = def_timer
		vars.timer_max = 10
	end

	local bomb_dmg = math.floor(get_c4_damage(c4) + 0.19) == nil and 0.5 or math.floor(get_c4_damage(c4) + 0.19)
	local bomb_dmg_text = "-" .. bomb_dmg .. " HP"
	vars.timer = vars.timer > 0 and vars.timer or 0
	if vars.timer == 0 then
		return
	end

	local timer_calc = (math.max(0, math.min(vars.timer_max, vars.fortcalc))) / vars.timer_max
	bomb_dmg_text_ref = bomb_dmg >= entity.get_prop(entity.get_local_player(), "m_iHealth") and "FATAL" or bomb_dmg_text
	bomb_timer_text_ref = vars.timer
	bomb_timer_vars = 220 * timer_calc
	bomb_dmg_text_draw = bomb_dmg_text_ref
	bomb_dmg_vars = bomb_dmg
end)

local function command_fakelag(cmd)
	local checkbox = ui.get(slow_enabled)
	local hotkey = ui.get(slowwalk_key)
	local limit = ui.get(limit_reference)
	
	if limit >= 57 then
		return
	end
	
	if checkbox and hotkey then
		modify_velocity(cmd, limit)
	end

	if ui.get(enabled_custom_aa) and client.key_state(0x45) and cmd.in_use == 1 then
		if entity.get_player_weapon() ~= nil and entity.get_classname(weaponn) == "CC4" then
			if cmd.in_attack == 1 then
				cmd.in_attack = 0
				cmd.in_use = 1
			end
		else
			if cmd.chokedcommands == 0 then
				cmd.in_use = 0
			end
		end
	end

	local localplayer = entity.get_local_player()
	if not localplayer or not entity.is_alive(localplayer) or not ui.get(enabled_custom_aa) or not ui.get(enabled_indicator) or not ui.get(enabled_box_indicator) then
		return
	end

	if cmd.chokedcommands == 0 then
		local x, y, z = entity.get_prop(localplayer, "m_vecOrigin")
		vec_data[flip and 0 or 1] = { x, y }
		flip = not flip
	end    

	if (vec_data[0] and vec_data[1]) then
		local shoud_break = get_player_velocity(localplayer) > 280
		local lag_dst = Length2DSqr(vecMvec(vec_data[0], vec_data[1]))
		lag_dst = lag_dst - 64 * 64
		lag_dst = lag_dst < 0 and 0 or lag_dst / 30
		lag_dst = lag_dst > 62 and 62 or lag_dst
		lc_fix = lag_dst      
		lc_y = 3
	end

	YDL_real_global_choke = cmd.chokedcommands
	if YDL_real_global_choke <= First_CK then
		FL_0 = FL_1
		FL_1 = FL_2
		FL_2 = FL_3
		FL_3 = First_CK
	end

	First_CK = YDL_real_global_choke
end

local function math_map(n, start, stop, new_start, new_stop)
	local value = (n - start) / (stop - start) * (new_stop - new_start) + new_start
	return new_start < new_stop and math.max(math.min(value, new_stop), new_start) or math.max(math.min(value, new_start), new_stop)
end

local function player_spawn(event)
	if not ui.get(enabled_custom_aa) or not ui.get(enabled_indicator) or not ui.get(enabled_box_indicator) then
		return
	end

	if client.userid_to_entindex(event.userid) == entity.get_local_player() then
		Status = "INACTIVE"
		First_CK = 0
		FL_0 = 0
		FL_1 = 0
		FL_2 = 0
		FL_3 = 0
	end
end

local function gen_pattern(width, height)
	local svg = [[<svg width="]] .. width .. [[" height="]] .. height .. [[" viewBox="0 0 ]] .. width .. [[ ]] .. height .. [[">
<rect width="]] .. width .. [[" height="]] .. height .. [[" y="0" x="0" fill="#151515"/>#pattern</svg>]]

	for x=0, width, 4 do
		for y=0, height, 4 do
		local pattern = [[<rect height="3" width="1" x="]] .. x+1 .. [[" y="]] .. y .. [[" fill="#0d0d0d"/><rect height="1" width="1" x="]] .. x+3 .. [[" y="]] .. y .. [[" fill="#0d0d0d"/><rect height="2" width="1" x="]] .. x+3 .. [[" y="]] .. y+2 .. [[" fill="#0d0d0d"/>]]
			svg = svg:gsub("#pattern", pattern .. "#pattern")
		end
	end

	svg = svg:gsub("#pattern\n", "")
	return svg
end

local function rectangle_outline(x, y, w, h, r, g, b, a, s)
	s = s or 1
	renderer.rectangle(x, y, w, s, r, g, b, a)
	renderer.rectangle(x, y+h-s, w, s, r, g, b, a)
	renderer.rectangle(x, y+s, s, h-s*2, r, g, b, a)
	renderer.rectangle(x+w-s, y+s, s, h-s*2, r, g, b, a)
end

function renderer.outline_rectangle(x, y, w, h, r, g, b, a)
	renderer.rectangle(x, y, w, 1, r, g, b, a)
	renderer.rectangle(x + w - 1, y, 1, h, r ,g, b, a)
	renderer.rectangle(x, y + h - 1, w, 1, r, g, b, a)
	renderer.rectangle(x, y, 1, h, r, g, b, a)
end

local function draw_window(x, y, r, g, b, a, label, items, keybinds)
	local separator_height = 13
	local start_y = 19
	local line_width = 121
	local test_y = start_y + #items * separator_height
	renderer.outline_rectangle(x, y, 200, test_y, 0, 0, 0, 255)
	renderer.rectangle(x, y, 200, test_y, 20, 20, 20, 150)
	renderer.gradient(x, y, 200, 17, 30, 30, 30, 255, 15, 15, 15, 255, false)
	renderer.rectangle(x + 1, y + 1, 198, 1, r, g, b, a)
	renderer.text(x + 100, y + 8, 255, 255, 255, 255, "c-", 0, label)
	if keybinds then
		for key, indicator in pairs(items) do key = key - 1
			local text_y_offset = y + key * separator_height + start_y

			renderer.text(x + 3, text_y_offset, 255, 255, 255, 255, '-', 0, indicator.text)
			renderer.text(x + 193, text_y_offset, 255, 255, 255, 255, 'r-', 0, 'TOGGLED')
		end
	else
		for key, indicator in pairs(items) do key = key - 1
			local text_y_offset = y + key * separator_height + start_y

			renderer.text(x + 3, text_y_offset, 255, 255, 255, 255, '-', 0, indicator.text)
			renderer.rectangle(x + 75, text_y_offset + 2, line_width, 6, 25, 25, 25, 255)
			renderer.rectangle(x + 75, text_y_offset + 2, line_width * indicator.value, 6, r, g, b, a)
		end
	end

	return y + test_y
end

local function draw_blackbox_indicator(x, y, w, h, a)
	local local_player = entity.get_local_player()
	if not local_player or not entity.is_alive(local_player) or not ui.get(enabled_custom_aa) or not ui.get(enabled_indicator) or not ui.get(enabled_box_indicator) then
		return
	end

	FL_0 = FL_0 == 0 and 1 or FL_0
	FL_1 = FL_1 == 0 and 1 or FL_1
	FL_2 = FL_2 == 0 and 1 or FL_2
	FL_3 = FL_3 == 0 and 1 or FL_3
	max_val = math.max(unpack({FL_0, FL_1, FL_2, FL_3})*2)
	min_val = math.min(unpack({FL_0, FL_1, FL_2, FL_3}))
	max_val_flu = math.max(unpack({FL_0, FL_1, FL_2, FL_3}))
	maxmum_mini = max_val_flu - min_val
	absolute_limit = (3 * 0.25) + (max_val / total_limit)
	h_absolute_limit = (3 * 0.25) + (max_val_flu / total_limit)
	limit_number = ui.get(fakelag_exploit) - 2
	test_flu_val = FL_3 - FL_0
	total_limit = FL_0 + FL_1 + FL_2 + FL_3
	visible_max_value = max_val
	visible_flu_value = test_flu_val
	if max_val <= 29 then
		if FL_3 <= 2 and FL_2 <= 2 and FL_1 <= 2 and FL_0 <= 2 then
			Status = "INACTIVE"
		elseif FL_3 <= 3 and FL_2 <= 3 and FL_1 <= 3 and FL_0 <= 3 then
			Status = "LOW"
		elseif FL_3 == FL_1 and FL_3 ~= FL_0 then
			if FL_3 >= 11 and FL_2 <= 3 then
				Status = ui.get(lag_format_types) == "Emiya Format Status" and "RANDOM" or "FLUCTUATED"
			elseif FL_3 <= 3 and FL_2 >= 11 then
				Status = ui.get(lag_format_types) == "Emiya Format Status" and "EMI-MAX" or "F-MAX"
			elseif FL_3 <= 3 and FL_2 <= 6 then
				Status = ui.get(lag_format_types) == "Emiya Format Status" and "MIN-HYPER" or "F-MIN"
			end

	if visible_flu_value == -1 or visible_flu_value == 1 then
		if FL_3 == FL_1 or FL_3 == 13 and FL_1 == 13 then
				Status = "MAX-CONSIST"
			end
		end

	elseif FL_3 == 4 and FL_2 == 4 and FL_1 == 4 and FL_0 == 4 then
		Status = ui.get(lag_format_types) == "Emiya Format Status" and "NORMAL" or "MINIMAL"
	elseif FL_3 == 11 and FL_2 == 11 and FL_1 == 11 and FL_0 == 11 then
		Status = "MAX-MINIMAL"
	elseif FL_3 == FL_2 or FL_3 == FL_1 then
		if max_val >= 21 and max_val <= 28 and FL_3 >= 12 then
			Status = ui.get(lag_format_types) == "Emiya Format Status" and "MAX-CONSIST" or "MAXIMIZED"
		elseif max_val >= 10 and max_val <= 21 then
			Status = "MAX-MINIMAL"
		end
	elseif FL_2 <= FL_3 and FL_1 <= FL_2 and max_val <= 14 and test_flu_val >= 4 or test_flu_val <= -4 then
		Status = "FL-BREAK"
	elseif FL_2 < FL_3 and FL_2 < FL_1 and FL_0 < FL_1 and max_val <= 18 and test_flu_val >= 5 or test_flu_val <= -5 then
		Status = "FL-BREAK"
	end

	elseif max_val_flu >= 15 then
		if absolute_limit < 1.12 then
			Status = ui.get(lag_format_types) == "Emiya Format Status" and "EXCEED" or "FLB-XPLT"
		elseif absolute_limit > 1.12 then
			Status = ui.get(lag_format_types) == "Emiya Format Status" and "E-HYPER" or "OVERFLOW"
		end
	end

	if not ui.get(fake_duck) then
		if not ui.get(dt_key) then
			if max_val_flu <= 14 then
				if max_val_flu >= 0 and max_val_flu <= 2 then
					H_Status = "INACTIVE"
				elseif max_val_flu >= 3 and max_val_flu <= 3 then
					H_Status = "LOW"
				elseif max_val_flu <= 9 and test_flu_val <= 2 then
					H_Status = "NOMINAL"
				elseif max_val_flu >= 10 and test_flu_val <= 2 then
					if max_val_flu >= 13 and max_val_flu <= 14 and First_CK >= 13 then
						H_Status = "MAXIMIZED"
				elseif max_val_flu >= 10 and max_val_flu <= 12 then
					H_Status = "MAX-MINIMAL"
				end

			elseif test_flu_val >= 2 and max_val_flu >= 5 then
				if test_flu_val >= 9 and test_flu_val <= 10 then
					H_Status = "FLUCTUATED"
				elseif test_flu_val >= 11 and test_flu_val <= 13 and absolute_limit < 1.29 then
					H_Status = "FLUCTUATED-MAX"
				elseif test_flu_val >= 13 and absolute_limit > 1.29 then
					H_Status = "BREAK"
				elseif test_flu_val >= 3 and test_flu_val <= 8 then
					H_Status = "FLUCTUATED-MIN"
				end          
			end
				elseif max_val_flu >= 15 then
					if h_absolute_limit > 1.12 then
						H_Status = "BREAK-EXPLOIT"
					elseif h_absolute_limit < 1.12 then
						H_Status = "OVERFLOW"
					end
				end
			else
				H_Status = "DOUBLE TAP"
			end
	else
		if ui.get(dt_key) then
			H_Status = "FAKEDUCK  (DT)"
		else
			H_Status = "FAKEDUCK"
		end
	end

	if Status == "LOW" then
		YDL_state_b = 0
		YDL_state_g = 0
		YDL_state_r = 255
		x_ind_pos = 110
		y_ind_pos = 30
	elseif Status == "UPDATING..." then
		YDL_state_b = 0
		YDL_state_g = 161
		YDL_state_r = 230
		x_ind_pos = 155
	elseif Status == "INACTIVE" then
		YDL_state_b = 0
		YDL_state_g = 0
		YDL_state_r = 255
		x_ind_pos = 135
		y_ind_pos = 10
	elseif Status == "FLUCTUATED" then
		YDL_state_b = 21
		YDL_state_g = 194
		YDL_state_r = 123
		x_ind_pos = 155
		y_ind_pos = -5
	elseif Status == "F-MAX" then
		YDL_state_b = 15
		YDL_state_g = 180
		YDL_state_r = 123
		x_ind_pos = 115
		y_ind_pos = 25
	elseif Status == "F-MIN" then
		YDL_state_b = 15
		YDL_state_g = 180
		YDL_state_r = 123
		x_ind_pos = 115
		y_ind_pos = 25
	elseif Status == "F-LOW" then
		YDL_state_b = 15
		YDL_state_g = 180
		YDL_state_r = 123
		x_ind_pos = 115
		y_ind_pos = 30
	elseif Status == "FL-BREAK" then
		YDL_state_b = 251
		YDL_state_g = 86
		YDL_state_r = 212
		x_ind_pos = 135
		y_ind_pos = 10
	elseif Status == "MAXIMIZED" then
		YDL_state_b = 255
		YDL_state_g = 142
		YDL_state_r = 20
		x_ind_pos = 150
		y_ind_pos = -5
	elseif Status == "MINIMAL" then
		YDL_state_b = 255
		YDL_state_g = 175
		YDL_state_r = 10
		x_ind_pos = 150
		y_ind_pos = 10
	elseif Status == "MAX-MINIMAL" then
		YDL_state_b = 255
		YDL_state_g = 142
		YDL_state_r = 20
		x_ind_pos = 165
		y_ind_pos = -20
	elseif Status == "MAX-CONSIST" then
		YDL_state_b = 15
		YDL_state_g = 180
		YDL_state_r = 123
		x_ind_pos = 165
		y_ind_pos = -15
	elseif Status == "OVERFLOW" then
		YDL_state_b = 0
		YDL_state_g = 0
		YDL_state_r = 255
		x_ind_pos = 145
		y_ind_pos = 0
	elseif Status == "FLB-XPLT" then
		YDL_state_b = 230
		YDL_state_g = 0
		YDL_state_r = 168
		x_ind_pos = 120
		y_ind_pos = 15
	elseif Status == "RANDOM" then
		YDL_state_b = 96
		YDL_state_g = 137
		YDL_state_r = 252
		x_ind_pos = 122
		y_ind_pos = 10
	elseif Status == "EMI-MAX" then
		YDL_state_b = 163
		YDL_state_g = 129
		YDL_state_r = 237
		x_ind_pos = 125
		y_ind_pos = 10
	elseif Status == "MIN-HYPER" then
		YDL_state_b = 212
		YDL_state_g = 255
		YDL_state_r = 93
		x_ind_pos = 134
		y_ind_pos = 0
	elseif Status == "E-HYPER" then
		YDL_state_b = 93
		YDL_state_g = 77
		YDL_state_r = 255
		x_ind_pos = 118
		y_ind_pos = 15
	elseif Status == "EXCEED" then
		YDL_state_b = 255
		YDL_state_g = 127
		YDL_state_r = 207
		x_ind_pos = 112
		y_ind_pos = 20
	elseif Status == "NORMAL" then
		YDL_state_b = 123
		YDL_state_g = 180
		YDL_state_r = 15
		x_ind_pos = 120
		y_ind_pos = 15
	end

	if H_Status == "LOW" then
		ind_S_r, ind_S_g, ind_S_b = 255, 0, 0
	elseif H_Status == "UPDATING..." then
		ind_S_r, ind_S_g, ind_S_b = 230, 161, 0    
	elseif H_Status == "INACTIVE" then
		ind_S_r, ind_S_g, ind_S_b = 255, 0, 0
	elseif H_Status == "DOUBLE TAP" then
		ind_S_r, ind_S_g, ind_S_b = 187, 128, 255
	elseif H_Status == "FAKEDUCK" or Status == "FAKEDUCK  (DT)" then
		ind_S_r, ind_S_g, ind_S_b = 187, 128, 255
	elseif H_Status == "FLUCTUATED" then
		ind_S_r, ind_S_g, ind_S_b = 123, 194, 21
	elseif H_Status == "FLUCTUATED-MAX" then
		ind_S_r, ind_S_g, ind_S_b = 123, 180, 15
	elseif H_Status == "FLUCTUATED-MIN" then
		ind_S_r, ind_S_g, ind_S_b = 123, 180, 15
	elseif H_Status == "F-LOW" then
		ind_S_r, ind_S_g, ind_S_b = 123, 180, 15
	elseif H_Status == "BREAK" then
		ind_S_r, ind_S_g, ind_S_b = 212, 86, 251
	elseif H_Status == "MAXIMIZED" then
		ind_S_r, ind_S_g, ind_S_b = 20, 142, 255
	elseif H_Status == "MAX-MINIMAL" then
		ind_S_r, ind_S_g, ind_S_b = 20, 142, 255
	elseif H_Status == "NOMINAL" then
		ind_S_r, ind_S_g, ind_S_b = 123, 180, 15
	elseif H_Status == "OVERFLOW" then
		ind_S_r, ind_S_g, ind_S_b = 255, 50, 0
	elseif H_Status == "BREAK-EXPLOIT" then
		ind_S_r, ind_S_g, ind_S_b = 168, 0, 230
	end

	local keybinds = {}
	local indicators = {}
	local height, wind = 36, 200
	local x, y = hk_dragger:get()
	local x_2, y_2 = hk_dragger_2:get()
	local x_3, y_3 = hk_dragger_3:get()
	local x_4, y_4 = hk_dragger_4:get()
	local x_5, y_5 = hk_dragger_5:get()
	local x_6, y_6 = hk_dragger_6:get()
	local ind_match = dragging_2.match() and 200 or 0
	local h_ind_match = dragging_4.match() and 200 or 0
	local nem_r, nem_g, nem_b, nem_a = ui.get(nem_slider_c)
	local h_cond_r, h_cond_g, h_cond_b, h_cond_a = ui.get(h_aa_scale_c)
	local h_box_r, h_box_g, h_box_b, h_box_a = ui.get(h_aa_format_c)
	local f_ind_r, f_ind_g, f_ind_b, f_ind_a = ui.get(h_fl_scale_c)
	local f_lc_r, f_lc_g, f_lc_b, f_lc_a = ui.get(h_fl_format_c)
	local get_bomb_planted = entity.get_all("CPlantedC4")[1]
	local bomb_timer_text_ref_2 = get_bomb_planted == nil and 0 or bomb_timer_text_ref
	local bomb_timer_text = bomb_timer_text_ref_2 <= 0.2 and 0 or bomb_timer_text_ref
	local bomb_status = bomb_timer_text >= 0.2 and true or false
	local w, h = 210, bomb_status == true and 304 or 279
	local value_box_fluctuate = test_flu_val >= 0 and test_flu_val or - test_flu_val
	local bomb_timer_draw = bomb_timer_text >= 10 and x + 101 or x + 93
	local bomb_damage_draw_ref = bomb_dmg_vars >= 10 and x + 104 or x + 100
	local bomb_damage_draw = bomb_dmg_vars == "FATAL" and x + 101 or bomb_damage_draw_ref
	local black_box_remove_x = 4
	local black_box_remove_y = 8.5
	local global_remove_delay_yaw = bomb_status == true and - 34 or - 8
	local blackbox_w, blackbox_h, lxa, pw = w - 12, h - 12, 0
	local vx, vy, vz = entity.get_prop(local_player, "m_vecVelocity")
	local velocity_speed_ref = math.sqrt((vx * vx) + (vy * vy))
	local velocity_speed = velocity_speed_ref >= 325 and 325 or velocity_speed_ref
	local accuracy_ref = 100 * velocity_speed / 325
	local weapons = entity.get_player_weapon(local_player)
	local tickbase = entity.get_prop(local_player, "m_nTickBase") == nil and 1 or entity.get_prop(local_player, "m_nTickBase")
	local curtime = globals.tickinterval() * (tickbase - 16) == nil and 1 or globals.tickinterval() * (tickbase - 16)
	local tickbase_slider = entity.get_prop(weapons, "m_flNextPrimaryAttack") - curtime
	local tickbase_read = entity.get_prop(weapons, "m_flNextPrimaryAttack") - curtime <= 0.001
	local alpha = 1 + math.sin(math.abs(-math.pi + globals.realtime() % (math.pi * 2))) * 219
	local pulse = 8 + math.sin(math.abs(-math.pi + (globals.realtime() * (0.6 / 1)) % (math.pi * 2))) * 12
	local alpha_faster = 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200
	local shot_circle = fix_in > globals.realtime() and (setMath(fix_in - globals.realtime(), fix_out , 40) * 0.004) or 0
	local white_anim = shot_circle * 620
	local space_check_1 = FL_2 > FL_1 or FL_2 < FL_1
	local space_check_2 = FL_1 > FL_0 or FL_1 < FL_0
	local space_check_3 = FL_0 > FL_3 or FL_0 < FL_3
	local rainbow_r, rainbow_g, rainbow_b = func_rgb_rainbowize((ui.get(blackbox_gradient_rainbow_speed) / 10), 1)
	local while_ariel = (bit.band(entity.get_prop(local_player, "m_fFlags"), 1) == 1)
	local box_dh_r, box_dh_g, box_dh_b, box_dh_a = ui.get(box_dh_c)
	local box_tab_r, box_tab_g, box_tab_b, box_tab_a = ui.get(box_tab_c)
	local freestanding = ui.get(freestand_key) and ui.get(freestanding_direction)
	local break_lc_r, break_lc_g= lc_fix >= 1 and 0 or 255, lc_fix >= 1 and 255 or 0
	local box_dis_r, box_dis_g, box_dis_b, box_dis_a = ui.get(box_format_c_disabled)
	local box_f_for_r, box_f_for_g, box_f_for_b, box_f_for_a = ui.get(box_format_c_1)
	local box_s_for_r, box_s_for_g, box_s_for_b, box_s_for_a = ui.get(box_format_c_2)
	local box_f_side_r, box_f_side_g, box_f_side_b, box_f_side_a = ui.get(box_slider_c_1)
	local box_s_side_r, box_s_side_g, box_s_side_b, box_s_side_a = ui.get(box_slider_c_2)
	local savor_box_r, savor_box_g, savor_box_b, savor_box_a = ui.get(value_savor_box_c)
	local savor_slider_r, savor_slider_g, savor_slider_b, savor_slider_a = ui.get(value_savor_slider_c)
	local savor_format_r, savor_format_g, savor_format_b, savor_format_a = ui.get(value_savor_format_c)
	local manual_status_flags = not ui.get(manual_aa) or ui.get(manual_aa) and ui.get(manual_state) == 0 or ui.get(manual_state) == 3
	local ind_r, ind_g, ind_b, ind_a = math.min(255, h_cond_r + white_anim), math.min(255, h_cond_g + white_anim),math.min(255, h_cond_b + white_anim), math.min(255, h_cond_a + white_anim) 
	local ind_dr, ind_dg, ind_db = math.min(255, h_box_r + break_ranim), math.min(255, h_box_g - break_anim),math.min(255, h_box_b - break_anim)
	local h_ind_r, h_ind_g, h_ind_b, h_ind_a = math.min(255, f_ind_r + white_anim), math.min(255, f_ind_g + white_anim),math.min(255, f_ind_b + white_anim), math.min(255, f_ind_a + white_anim)
	local get_aa_flags_ref = active_selection_ref_status and Player_State_Visible_2 or ui.get(blackbox_flags_type) == "Lowercase" and "Default" or "DEFAULT"
	local get_aa_flags = manual_status_flags and get_aa_flags_ref or ui.get(blackbox_flags_type) == "Lowercase" and "Manual" or "MANUAL"
	local head_position = vector(entity.hitbox_position(local_player, 0))
	local neck_position = vector(entity.hitbox_position(local_player, 1))
	local positions_dif = head_position.z - neck_position.z
	local fakeyaw_height = math_map(positions_dif, 2.2, 4, 1, 0)
	local head_height = fakeyaw_height * 60
	local dt = ui.get(dt_check) and ui.get(dt_key)
	local fake_peek = ui.get(fake_peeking) and ui.get(fake_peek_key)
	local bomb_override_vartext = bomb_dmg_vars <= 0 and box_f_for_a or 0
	local hide_shot = ui.get(hide_check) and ui.get(hide_key)
	local slow_walk = ui.get(slow_enabled) and ui.get(slowwalk_key)
	local aimbot = ui.get(aimbot_check) and ui.get(aimbot_hotkey)
	local manual_peek = ui.get(quick_peek) and ui.get(quick_peek_key)
	local dt_status = can_shift_shot and "Status: ●" or "Status: ×"
	local flags_un_lc = while_ariel and (h / 64) * math.floor(lc_fix) < 1
	local dt_status_r, dt_status_g = can_shift_shot and 0 or 255, can_shift_shot and 255 or 0
	local chokecommands_ref = globals.chokedcommands() / ui.get(fakelag_value_limit)
	local chokecommands = chokecommands_ref >= 1 and 1 or chokecommands_ref
	local body_posepara = entity.get_prop(local_player, "m_flPoseParameter", 11)
	local fake_yaw_angle = math.max(-60, math.min(60, body_posepara*120 - 60 + 0.5))
	local minimum_fakeheadheight = ui.get(fake_yaw) - fake_yaw_angle - 2
	local overlap_headheight = minimum_fakeheadheight <= -1 and 1 or minimum_fakeheadheight
	local overflow_fov_y_ref = ui.get(max_fov) <= 9 and 33 or 30.25
	local overflow_fov_y = ui.get(max_fov) <= 99 and overflow_fov_y_ref or 28.5
	local safety_text = string.format("Desync: %s° | Safety: %s%s | Dir: %s", string.format("%.f", fake_yaw_angle),string.format("%.f", fake_yaw_angle >= 1 and fake_yaw_angle / 60 * 100 or fake_yaw_angle / - 60 * 100), "%", ui.get(invert_aa) and "RIGHT" or "LEFT")
	local safety_w = renderer.measure_text(nil, safety_text) + 8
	local lc_text = string.format("%s | Choke: %d | Adaptive:%s | Dst:", "LC" ,max_val * 0.5, max_val * 0.5 >= 10 and "true" or "false", "")
	local lc_wind = renderer.measure_text(nil, lc_text) + 8

	if ui.get(lag_arrows_types) == "Default" then
		lag_arrows_dire = "⮞"
	elseif ui.get(lag_arrows_types) == "Normal" then
		lag_arrows_dire = "-"
	elseif ui.get(lag_arrows_types) == "Triangle" then
		lag_arrows_dire = "⭢"
	elseif ui.get(lag_arrows_types) == "Circle Arrows" then
		lag_arrows_dire = "⮊"
	elseif ui.get(lag_arrows_types) == "Fish Spear" then
		lag_arrows_dire = "⇀"
	elseif ui.get(lag_arrows_types) == "Pair Arrows" then
		lag_arrows_dire = "⮆"
	elseif ui.get(lag_arrows_types) == "Pair Arrows 2" then
		lag_arrows_dire = "⇛"
	elseif ui.get(lag_arrows_types) == "Barroom" then
		lag_arrows_dire = "⭲"
	elseif ui.get(lag_arrows_types) == "Classic" then
		lag_arrows_dire = ">"
	elseif ui.get(lag_arrows_types) == "OneTap V2" then
		lag_arrows_dire = "▷"
	elseif ui.get(lag_arrows_types) == "Small Square" then
		lag_arrows_dire = "⯈"
	elseif ui.get(lag_arrows_types) == "TranSparent" then
		lag_arrows_dire = "⮚"
	elseif ui.get(lag_arrows_types) == "Round" then
		lag_arrows_dire = ")"
	elseif ui.get(lag_arrows_types) == "Dick" then
		lag_arrows_dire = "D"
	elseif ui.get(lag_arrows_types) == "Square" then
		lag_arrows_dire = "⍄"
	elseif ui.get(lag_arrows_types) == "Stars" then
		lag_arrows_dire = "★"
	elseif ui.get(lag_arrows_types) == "Caresses" then
		lag_arrows_dire = "⇸"
	elseif ui.get(lag_arrows_types) == "Carabiner" then
		lag_arrows_dire = "↪"
	elseif ui.get(lag_arrows_types) == "Special" then
		lag_arrows_dire = "⤚"
	elseif ui.get(lag_arrows_types) == "Crooked Arrow" then
		lag_arrows_dire = "⭝"
	elseif ui.get(lag_arrows_types) == "Circle" then
		lag_arrows_dire = "↷"
	elseif ui.get(lag_arrows_types) == "Ribbon 1" then
		lag_arrows_dire = "⮱"
	elseif ui.get(lag_arrows_types) == "Ribbon 2" then
		lag_arrows_dire = "⮳"
	elseif ui.get(lag_arrows_types) == "Ribbon 3" then
		lag_arrows_dire = "⮵"
	elseif ui.get(lag_arrows_types) == "Ribbon 4" then
		lag_arrows_dire = "⮷"
	elseif ui.get(lag_arrows_types) == "Shadows" then
		lag_arrows_dire = "►"
	elseif ui.get(lag_arrows_types) == "Double Arrows" then
		lag_arrows_dire = "↠"
	elseif ui.get(lag_arrows_types) == "Misc" then
		lag_arrows_dire = "▻"
	elseif ui.get(lag_arrows_types) == "Mathematical Arrow" then
		lag_arrows_dire = "⭃"
	elseif ui.get(lag_arrows_types) == "Cross Arrowhead" then
		lag_arrows_dire = "⤨"
	elseif ui.get(lag_arrows_types) == "Triangles Arrows" then
		lag_arrows_dire = "▶"
	elseif ui.get(lag_arrows_types) == "Triangles Arrows 2" then
		lag_arrows_dire = "⯈"
	end

	local space_arrows_3 = space_check_3 and lag_arrows_dire or " "
	local space_arrows_2 = space_check_2 and lag_arrows_dire or " "
	local space_arrows_1 = space_check_1 and lag_arrows_dire or " "

	if ui.get(remove_skeet_indicators) then
		for i = 100, 1, - 1 do
			renderer.indicator(255,255,255,0,i)
		end
	end

	if ui.get(blackbox_line_type) == "Static Faded Color" then
		gradient_f_r, gradient_f_g, gradient_f_b, gradient_f_a = ui.get(blackbox_gradient_c_1)
		gradient_s_r, gradient_s_g, gradient_s_b, gradient_s_a = ui.get(blackbox_gradient_c_2)
	elseif ui.get(blackbox_line_type) == "Rainbow Faded Color" then
		gradient_f_r, gradient_f_g, gradient_f_b, gradient_f_a = ui.get(blackbox_line_status) == "Backward Faded Color" and rainbow_b or rainbow_r, ui.get(blackbox_line_status) == "Backward Faded Color" and rainbow_r or rainbow_g, ui.get(blackbox_line_status) == "Backward Faded Color" and rainbow_g or rainbow_b, 255
		gradient_s_r, gradient_s_g, gradient_s_b, gradient_s_a = ui.get(blackbox_line_status) == "Backward Faded Color" and rainbow_r or rainbow_b, ui.get(blackbox_line_status) == "Backward Faded Color" and rainbow_g or rainbow_r, ui.get(blackbox_line_status) == "Backward Faded Color" and rainbow_b or rainbow_g, 255
	end

	if ui.get(blackbox_menu_type) == "Besiege" then
		rectangle_outline(x - black_box_remove_x, y - black_box_remove_y , w, h, 18, 18, 18, 255)
		rectangle_outline(x + 1 - black_box_remove_x, y + 1 - black_box_remove_y, w -2, h - 2, 62, 62, 62, 255)
		rectangle_outline(x + 2 - black_box_remove_x, y + 2 - black_box_remove_y, w - 4, h - 4, 44, 44, 44, 255, 3)
		rectangle_outline(x + 5 - black_box_remove_x, y + 5 - black_box_remove_y, w - 10, h - 10, 62, 62, 62, 255)

		for i = 6, 2, - 1 do
			pw = 2^i
			if blackbox_w % pw < 7 then
				break
			end
		end

		for i=1, 2 do
			if svg_patterns[pw] == nil or svg_patterns[pw][blackbox_h] == nil then
				svg_patterns[pw] = svg_patterns[pw] or {}
				svg_patterns[pw][blackbox_h] = renderer.load_svg(gen_pattern(pw, blackbox_h), pw, blackbox_h) or -1
			end

			if svg_patterns[pw][blackbox_h] ~= -1 then
				for xa=0, blackbox_w - pw, pw do
					renderer.texture(svg_patterns[pw][blackbox_h], x + 6 + xa + lxa - black_box_remove_x, y + 6 - black_box_remove_y, pw, blackbox_h, 255, 255, 255, 255)
				end
			end

			if blackbox_w % pw == 0 then
				break
			end

			lxa, pw = blackbox_w - (blackbox_w % pw), blackbox_w % pw
			blackbox_w = pw
		end
			renderer.gradient(x + 3, y, 196.75, 1, gradient_f_r, gradient_f_g, gradient_f_b, gradient_f_a, gradient_s_r, gradient_s_g, gradient_s_b, gradient_s_a, true)
	elseif ui.get(blackbox_menu_type) == "Default" then
		renderer.gradient(x + 1, y, 200, 242 - global_remove_delay_yaw, 25, 25, 25, 255, 25, 25, 25, 255, true)
		renderer.gradient(x + 1, y - 1, 200, 2, gradient_f_r, gradient_f_g, gradient_f_b, gradient_f_a, gradient_s_r, gradient_s_g, gradient_s_b, gradient_s_a, true)
	end

	renderer.text(x + 10, y + 5, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "B Yaw")
	renderer.text(x + 50, y + 5, box_f_for_r, box_f_for_g, box_f_for_b, box_f_for_a, "", 0, string.format("%.f", fake_yaw_angle))
	renderer.gradient(x + 135, y + 9, fake_yaw_angle >= 1 and fake_yaw_angle + 1 or fake_yaw_angle - 1, 5, box_f_side_r, box_f_side_g, box_f_side_b, box_f_side_a, box_s_side_r, box_s_side_g, box_s_side_b, box_s_side_a, true)
	renderer.text(x + 10, y + 18, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "Custom  AA")
	renderer.text(manual_status_flags and x + 100 + get_aa_flags_add_y or x + 100 + 10, y + 18, box_s_for_r, box_s_for_g, box_s_for_b, box_s_for_a, "", 0, get_aa_flags)
	renderer.text(x + 75, y + 16.8, ui.get(invert_aa) and 255 or box_f_for_r, ui.get(invert_aa) and 255 or box_f_for_g, ui.get(invert_aa) and 255 or box_f_for_b, ui.get(invert_aa) and 255 or box_f_for_a, "", 0, "⯇")
	renderer.text(x + 170, y + 16.8, ui.get(invert_aa) and box_f_for_r or 255, ui.get(invert_aa) and box_f_for_g or 255, ui.get(invert_aa) and box_f_for_b or 255, ui.get(invert_aa) and box_f_for_a or 255, "", 0, "⯈")
	renderer.text(x + 10, y + 31, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "D & H")
	renderer.text(x + 70, y + 31, box_dh_r, box_dh_g, box_dh_b, box_dh_a, "", 0, "HC ".. ui.get(min_htc))
	renderer.text(x + 130, y + 31, box_dh_r, box_dh_g, box_dh_b, box_dh_a, "", 0, "DMG ".. ui.get(min_dmg))
	renderer.text(x + 10, y + 44, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "D Tap")
	renderer.text(x + 60, y + 43.75, box_f_for_r, box_f_for_g, box_f_for_b, box_f_for_a, "", 0, dt and ui.get(dt_mode) or "-")
	renderer.text(dt and can_shift_shot and x + 129.45 or x + 130.05 or x + 129.45, y + 44, dt and dt_status_r or box_f_for_r, dt and dt_status_g or box_f_for_g, dt and 0 or box_f_for_b, dt and 255 or box_f_for_a, "", 0, dt and dt_status or "-")
	renderer.text(x + 10, y + 57, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "FL log")
	renderer.text(x + 48, y + 57, box_f_for_r, box_f_for_g, box_f_for_b, box_f_for_a, "", 0, ui.get(lag_arrows_status) == "Arrows Fluctuate" and FL_3 .. space_arrows_1 .. FL_2 .. space_arrows_2 .. FL_1 .. space_arrows_3 .. FL_0 or FL_3 .. "-" .. FL_2 .. "-" .. FL_1 .. "-" .. FL_0)
	renderer.text(x + 124.5, y + 57.25, YDL_state_r, YDL_state_g, YDL_state_b, 255, "", 0, Status)
	renderer.text(x + 10, y + 70, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "Fakelag")
	renderer.text(FL_3 <= 9 and x + 57 or x + 55, y + 70, box_f_for_r, box_f_for_g, box_f_for_b, box_f_for_a, "", 0, FL_3)
	renderer.gradient(x + 77, y + 74, chokecommands * 110, 5, box_f_side_r, box_f_side_g, box_f_side_b, box_f_side_a, box_s_side_r, box_s_side_g, box_s_side_b, box_s_side_a, true)
	renderer.text(x + 10, y + 83, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "Head height")
	renderer.gradient(x + 77, y + 87, head_height <= 1 and overlap_headheight or head_height, 5, box_f_side_r, box_f_side_g, box_f_side_b, box_f_side_a, box_s_side_r, box_s_side_g, box_s_side_b, box_s_side_a, true)
	renderer.text(x + 10, y + 96, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "Accuracy")
	renderer.text(x + 60, y + 96.5, box_f_for_r, box_f_for_g, box_f_for_b, box_f_for_a, "", 0, string.format("%.f", while_ariel and 100 - accuracy_ref or 100))
	renderer.gradient(x + 86, y + 101, while_ariel and 100 - accuracy_ref + 4 or 108, 5, box_f_side_r, box_f_side_g, box_f_side_b, box_f_side_a, box_s_side_r, box_s_side_g, box_s_side_b, box_s_side_a, true)
	renderer.text(x + 10, y + 109, box_tab_r, box_tab_g, box_tab_b, box_tab_a, "", 0, "Speed")
	renderer.text(x + 50, y + 109.5, box_f_for_r, box_f_for_g, box_f_for_b, box_f_for_a, "", 0, string.format("%.f", velocity_speed))
	renderer.gradient(x + 78, y + 113.5, accuracy_ref >= 30 and accuracy_ref + 17 or accuracy_ref, 5, box_f_side_r, box_f_side_g, box_f_side_b, box_f_side_a, box_s_side_r, box_s_side_g, box_s_side_b, box_s_side_a, true)
	renderer.text(x + 66.5, y + 109.5, box_f_for_r, box_f_for_g, box_f_for_b, velocity_speed > 2 and 0 or box_f_for_a, "", 0, "Standing Velocity Speed")
	renderer.text(x + 10, y + 122, while_ariel and box_tab_r or break_lc_r, while_ariel and box_tab_g or break_lc_g, while_ariel and box_tab_b or 0, while_ariel and 255 or box_tab_a, "", 0, "Lag comp")
	renderer.text(x + 61.5, y + 123, box_f_for_r, box_f_for_g, box_f_for_b, box_f_for_a, "", 0, string.format("%.f", (h / 64) * math.floor(lc_fix)))
	renderer.gradient(x + 84, y + 127, (h / 64) * math.floor(lc_fix) >= 270 and (h / 64) * math.floor(lc_fix) * 0.415 or (h / 64) * math.floor(lc_fix) * 0.422, 5, box_f_side_r, box_f_side_g, box_f_side_b, box_f_side_a, box_s_side_r, box_s_side_g, box_s_side_b, lc_y > 1 and box_s_side_a or 0, true)
	renderer.text(x + 78.5, y + 123, box_f_for_r, box_f_for_g, box_f_for_b, flags_un_lc and box_f_for_a or 0, "", 0, "Lag Comp Disabled")
	renderer.text(x + 10, y + 137, box_tab_r, box_tab_g, box_tab_b, bomb_status and box_tab_a or 0, "", 0, "Bomb timer")
	renderer.text(x + 72, y + 138, box_f_for_r, box_f_for_g, box_f_for_b, bomb_status and box_f_for_a or 0, "", 0, bomb_timer_text)
	renderer.gradient(bomb_timer_draw, y + 142, bomb_timer_vars * 0.435, 5, box_f_side_r, box_f_side_g, box_f_side_b, bomb_status and box_f_side_a or 0, box_s_side_r, box_s_side_g, box_s_side_b, bomb_status and box_s_side_a or 0, true)
	renderer.text(x + 10, y + 151, box_tab_r, box_tab_g, box_tab_b, bomb_status and box_tab_a or 0, "", 0, "Bomb dmg")
	renderer.text(x + 67, y + 152, bomb_dmg_text_draw == "FATAL" and 255 or box_f_for_r, bomb_dmg_text_draw == "FATAL" and 0 or box_f_for_g, bomb_dmg_text_draw == "FATAL" and 0 or box_f_for_b, bomb_status and box_f_for_a or 0, "", 0, bomb_dmg_text_draw)
	renderer.gradient(bomb_damage_draw, y + 155, bomb_dmg_vars * 0.335, 5, box_f_side_r, box_f_side_g, box_f_side_b, bomb_status and box_f_side_a or 0, box_s_side_r, box_s_side_g, box_s_side_b, bomb_status and box_s_side_a or 0, true)
	renderer.text(bomb_damage_draw + 7, y + 151, box_f_for_r, box_f_for_g, box_f_for_b, bomb_status and bomb_override_vartext or 0, "", 0, "Not Damage")
	renderer.text(ui.get(max_fov) >= 5 and x + overflow_fov_y or 43.55, y + 132 - global_remove_delay_yaw, ui.get(max_fov) >= 5 and box_f_for_r or box_dis_r, ui.get(max_fov) >= 5 and box_f_for_g or box_dis_g, ui.get(max_fov) >= 5 and box_f_for_b or box_dis_b, ui.get(max_fov) >= 5 and box_f_for_a or box_dis_a, "", 0, ui.get(max_fov) >= 5 and "● FOV " ..ui.get(max_fov) .. " ●" or "FOV " ..ui.get(max_fov))
	renderer.text(x + 115, y + 132 - global_remove_delay_yaw, ui.get(resolver_check) and box_s_for_r or box_dis_r, ui.get(resolver_check) and box_s_for_g or box_dis_g, ui.get(resolver_check) and box_s_for_b or box_dis_b, ui.get(resolver_check) and box_s_for_a or box_dis_a, "", 0, "Resolver")
	renderer.text(aimbot and x + 29.05 or x + 37.05, y + 147 - global_remove_delay_yaw, aimbot and box_f_for_r or box_dis_r, aimbot and box_f_for_g or box_dis_g, aimbot and box_f_for_b or box_dis_b, aimbot and box_f_for_a or box_dis_a, "", 0, aimbot and "● Aim bot ●" or "Aim bot")
	renderer.text(ui.get(fake_duck) and x + 105 or x + 113, y + 147 - global_remove_delay_yaw, ui.get(fake_duck) and box_f_for_r or box_dis_r, ui.get(fake_duck) and box_f_for_g or box_dis_g, ui.get(fake_duck) and box_f_for_b or box_dis_b, ui.get(fake_duck) and box_f_for_a or box_dis_a, "", 0, ui.get(fake_duck) and "● Fake duck ●" or "Fake duck")
	renderer.text(ui.get(mp_scale) == 24 and x + 28.6 or x + 20.6, y + 162 - global_remove_delay_yaw, ui.get(mp_scale) == 24 and box_dis_r or box_f_for_r, ui.get(mp_scale) == 24 and box_dis_g or box_f_for_g, ui.get(mp_scale) == 24 and box_dis_b or box_f_for_b, ui.get(mp_scale) == 24 and box_dis_a or box_f_for_a, "", 0, ui.get(mp_scale) == 24 and "Multi-point" or "● Multi-point ●")
	renderer.text(slow_walk and x + 104.52 or x + 112.52, y + 162 - global_remove_delay_yaw, slow_walk and box_f_for_r or box_dis_r, slow_walk and box_f_for_g or box_dis_g, slow_walk and box_f_for_b or box_dis_b, slow_walk and box_f_for_a or box_dis_a, "", 0, slow_walk and "● Slow Walk ●" or "Slow Walk")
	renderer.text(ui.get(silent_aim) and x + 22 or x + 30, y + 177 - global_remove_delay_yaw, ui.get(silent_aim) and box_f_for_r or box_dis_r, ui.get(silent_aim) and box_f_for_g or box_dis_g, ui.get(silent_aim) and box_f_for_b or box_dis_b, ui.get(silent_aim) and box_f_for_a or box_dis_a, "", 0, ui.get(silent_aim) and "● Slient aim ●" or "Slient aim")
	renderer.text(ui.get(auto_wall) and x + 105 or x + 113, y + 177 - global_remove_delay_yaw, ui.get(auto_wall) and box_f_for_r or box_dis_r, ui.get(auto_wall) and box_f_for_g or box_dis_g, ui.get(auto_wall) and box_f_for_b or box_dis_b, ui.get(auto_wall) and box_f_for_a or box_dis_a, "", 0, ui.get(auto_wall) and "● Auto wall ●" or "Auto wall")
	renderer.text(ui.get(prefer_safe) and x + 21 or x + 29, y + 193 - global_remove_delay_yaw, ui.get(prefer_safe) and box_f_for_r or box_dis_r, ui.get(prefer_safe) and box_f_for_g or box_dis_g, ui.get(prefer_safe) and box_f_for_b or box_dis_b, ui.get(prefer_safe) and box_f_for_a or box_dis_a, "", 0, ui.get(prefer_safe) and "● Prefer safe ●" or "Prefer safe")
	renderer.text(ui.get(force_safe) and x + 103.5 or x + 111.5, y + 193 - global_remove_delay_yaw, ui.get(force_safe) and box_f_for_r or box_dis_r, ui.get(force_safe) and box_f_for_g or box_dis_g, ui.get(force_safe) and box_f_for_b or box_dis_b, ui.get(force_safe) and box_f_for_a or box_dis_a, "", 0, ui.get(force_safe) and "● Force safe ●" or "Force safe")
	renderer.text(ui.get(force_baim) and x + 20.5 or x + 28.5, y + 208 - global_remove_delay_yaw, ui.get(force_baim) and box_f_for_r or box_dis_r, ui.get(force_baim) and box_f_for_g or box_dis_g, ui.get(force_baim) and box_f_for_b or box_dis_b, ui.get(force_baim) and box_f_for_a or box_dis_a, "", 0, ui.get(force_baim) and "● Force baim ●" or "Force baim")
	renderer.text(manual_peek and x + 101.5 or x + 109.5, y + 208 - global_remove_delay_yaw, manual_peek and box_f_for_r or box_dis_r, manual_peek and box_f_for_g or box_dis_g, manual_peek and box_f_for_b or box_dis_b, manual_peek and box_f_for_a or box_dis_a, "", 0, manual_peek and "● Quick peek ●" or "Quick peek")
	renderer.text(hide_shot and x + 23 or x + 31, y + 223 - global_remove_delay_yaw, hide_shot and box_f_for_r or box_dis_r, hide_shot and box_f_for_g or box_dis_g, hide_shot and box_f_for_b or box_dis_b, hide_shot and box_f_for_a or box_dis_a, "", 0, hide_shot and "● Hide shot ●" or "Hide shot")
	renderer.text(dt and x + 101 or x + 109, y + 223 - global_remove_delay_yaw, dt and box_f_for_r or box_dis_r, dt and box_f_for_g or box_dis_g, dt and box_f_for_b or box_dis_b, dt and box_f_for_a or box_dis_a, "", 0, dt and "● Double tap ●" or "Double tap")
	renderer.text(freestanding and x + 15 or x + 23, y + 238 - global_remove_delay_yaw, freestanding and box_f_for_r or box_dis_r, freestanding and box_f_for_g or box_dis_g, freestanding and box_f_for_b or box_dis_b, freestanding and box_f_for_a or box_dis_a, "", 0, freestanding and "● Freestanding ●" or "Freestanding")
	renderer.text(fake_peek and x + 103 or x + 111, y + 238 - global_remove_delay_yaw, fake_peek and box_f_for_r or box_dis_r, fake_peek and box_f_for_g or box_dis_g, fake_peek and box_f_for_b or box_dis_b, fake_peek and box_f_for_a or box_dis_a, "", 0, fake_peek and "● Fake peek ●" or "Fake peek")
	client.draw_gradient(ctx, x_2, y_2 -2, 40 + pulse*5, 2, ind_r, ind_g, ind_b, 255, 25, 25, 25, 5, true)
	client.draw_gradient(ctx, x_2, y_2, pulse + ind_match, height, ind_r, ind_g, ind_b, 255, 25, 25, 25, 5, true)
	client.draw_gradient(ctx, x_2 + 5, y_2, wind, 16, 0, 0, 0, 255, 10, 10, 10, 30, true)
	client.draw_gradient(ctx, x_2 + 5, y_2 + 19, wind, 16, 0, 0, 0, 255, 10, 10, 10, 30, true)
	client.draw_gradient(ctx, x_2 + 5, y_2 + 16, fake_yaw_angle >= 1 and (wind / 60) * fake_yaw_angle or (wind / 60) * - fake_yaw_angle, 3, 20, 20, 20, 255, ind_dr, ind_dg, ind_db, 220 , true)
	client.draw_gradient(ctx, x_2, y_2, wind, height, 30, 30, 30, 200, 10, 10, 10, 10, true)
	client.draw_gradient(ctx, x_2, y_2 + height, 120 + pulse*3, 3, ind_r, ind_g, ind_b, 255, 25, 25, 25, 20, true)
	client.draw_gradient(ctx, x_2, y_2 - 1, pulse, height + 1, ind_r, ind_g, ind_b, 255, 25, 25, 25, 5, true)
	renderer.text(x_2 + 8, y_2 + 2, 187, 128, 255, 255, "", 0, string.format("Desync: %s°", string.format("%.f", fake_yaw_angle >= 1 and fake_yaw_angle or - fake_yaw_angle)))
	renderer.text(x_2 + 85, y_2 + 2, 255, 255, 255, 255, "", 0, "DIR: ", ui.get(bodyyaw_types) == "Opposite" and "Predict" or ui.get(yaw_target_base) == "At targets" and "AT-TGT" or ui.get(invert_aa) and "M-LEFT" or "M-RIGHT")
	renderer.text(x_2 + 158, y_2 + 2, 128, 183, 255, 255, "", 0, "  YDL")    
	renderer.text(x_2 + 8, y_2 + 21, 187, 128, 255, 255, "", 0, "Condition: ", get_aa_flags)
	renderer.text(x_2 + 132, y_2 + 21, 128, 183, 255, 255, "", 0, "Velocity: ", string.format("%.f", velocity_speed))
	table.insert(indicators, {text = "FAKE  YAW", value = fake_yaw_angle >= 1 and fake_yaw_angle / 60 or - fake_yaw_angle / 60})
	table.insert(indicators, {text = "FAKELAG", value = chokecommands_ref})
	table.insert(indicators, {text = "FLUCTUATE", value = 1 - ((ui.get(fakelag_value_limit) - value_box_fluctuate) / ui.get(fakelag_value_limit)) <= 0 and 0 or 1 - ((ui.get(fakelag_value_limit) - value_box_fluctuate) / ui.get(fakelag_value_limit)) >= 1 and 1 or 1 - ((ui.get(fakelag_value_limit) - value_box_fluctuate) / ui.get(fakelag_value_limit))})
	table.insert(indicators, {text = "EXPLOITS", value = tickbase_slider >= 0.001 and 0 or tickbase_slider <= - 0.25 and 1 or tickbase_slider / - 0.25 * 1})
	table.insert(indicators, {text = "INACCURACY", value = while_ariel and 1 - (accuracy_ref * 0.01) or 1})
	table.insert(indicators, {text = "LAG COMPSTATION", value = (h / 64) * math.floor(lc_fix) / 270 >= 1 and 1 or (h / 64) * math.floor(lc_fix) / 270})
	table.insert(indicators, {text = "SPEED", value = math.min(1, velocity_speed / 240)})
	table.insert(indicators, {text = "STAND HEIGHT", value = fakeyaw_height})

	if ui.get(fake_duck) then
		table.insert(keybinds, {text = "FAKE DUCK"})
	end

	if dt and not ui.get(fake_duck) then
		table.insert(keybinds, {text = "DOUBLE TAP"})
	end

	if ui.get(prefer_baim) then
		table.insert(keybinds, {text = "PREFER BAIM"})
	end

	if ui.get(prefer_safe) then
		table.insert(keybinds, {text = "PREFER SAFE"})
	end

	if ui.get(force_safe) then
		table.insert(keybinds, {text = "SAFE POINT"})
	end

	if ui.get(force_baim) then
		table.insert(keybinds, {text = "BODY AIM"})
	end

	if hide_shot and not ui.get(fake_duck) then
		table.insert(keybinds, {text = "ON-SHOT"})
	end

	if freestanding then
		table.insert(keybinds, {text = "FREESTANDING"})
	end

	if slow_walk and not ui.get(fake_duck) then
		table.insert(keybinds, {text = "SLOW-MOTION"})
	end

	if ui.get(checkbox_force_third_person) and ui.get(hotkey_force_third_person) then
		table.insert(keybinds, {text = "THIRDPERSON"})
	end

	if ui.get(free_body) then
		table.insert(keybinds, {text = "FREESTANDING BODY"})
	end

	if ui.get(edge_yaw) then
		table.insert(keybinds, {text = "EDGE YAW"})
	end

	if ui.get(delay_shot) then
		table.insert(keybinds, {text = "DELAY SHOT"})
	end

	if ui.get(resolver) then
		table.insert(keybinds, {text = ui.get(resolver_override) and "RESOLVER OVERRIDE" or "RESOLVER"})
	end

	if fake_peek and not ui.get(fake_duck) then
		table.insert(keybinds, {text = "FAKE-PEEK"})
	end

	if manual_peek and not ui.get(fake_duck) then
		table.insert(keybinds, {text = "QUICK-PEEK"})
	end

	local indicators_window_y = draw_window(x_3, y_3, nem_r, nem_g, nem_b, nem_a, "INDICATORS", indicators, false) 
	draw_window(x_3, indicators_window_y + 7, nem_r, nem_g, nem_b, nem_a, "KEYBINDS", keybinds, true)
	client.draw_gradient(ctx, x_4, y_4-2, 40 + pulse * 5, 2, h_ind_r, h_ind_g, h_ind_b, 255, 25, 25, 25, 5, true)
	client.draw_gradient(ctx, x_4, y_4, pulse, 18+17, h_ind_r, h_ind_g, h_ind_b, 255, 25, 25, 25, 5, true)
	client.draw_gradient(ctx, x_4 + 5, y_4, 200, 16, 0, 0, 0, 255, 10, 10, 10, 30, true)
	client.draw_gradient(ctx, x_4 + 5, y_4+17 + lc_y, 200, 16, 0, 0, 0, 255, 10, 10, 10, 30, true)
	client.draw_gradient(ctx, x_4 + 5, y_4+14, (200 / limit_number) * First_CK, 3, 20, 20, 20, 255, h_ind_r, h_ind_g, h_ind_b, 180 , true)
	client.draw_gradient(ctx, x_4 + 5, y_4+17, (200 / 64) * math.floor(lc_fix), 3, 20, 20, 20, lc_y > 1 and 255 or 0, f_lc_r, f_lc_g, f_lc_b, lc_y > 1 and f_lc_a or 0, true)
	client.draw_gradient(ctx, x_4, y_4, 200, 18+17 + lc_y, 30, 30, 30, 200, 10, h_ind_match * 0.6 + 10, h_ind_match + 10, 10, true)
	client.draw_gradient(ctx, x_4, y_4 + lc_y +18+17, 120 + pulse * 3, 2, h_ind_r, h_ind_g, h_ind_b, 255, 25, 25, 25, 20, true)
	client.draw_gradient(ctx, x_4, y_4 - 1, pulse, 1+18+17 + lc_y, h_ind_r, h_ind_g, h_ind_b, 255, 25, 25, 25, 5, true)
	renderer.text(x_4 + 8, y_4 + 2, 187, 128, 255, 255, "", 0, "FAKE LAG")
	renderer.text(x_4 + 60, y_4 + 2, ind_S_r, ind_S_g, ind_S_b, 255, "", 0, H_Status)
	renderer.text(x_4 + 158, y_4 + 2, 128, 183, 255, 255, "", 0, "  YDL")
	renderer.text(x_4 + 8, y_4 + lc_y + 20, 187, 128, 255, 255, "", 0,"HISTORY:")
	renderer.text(x_4 + 60, y_4 + lc_y + 20, 200, 200, 200, 255, "", 0, string.format("%i-%i-%i-%i",FL_3,FL_2,FL_1,FL_0))
	renderer.text(x_4 + 135, y_4 + lc_y + 20, 128, 183, 255, 255, "", 0, "  M: ".. max_val * 0.5, "  F: " .. value_box_fluctuate)
	renderer.rectangle(x_5, y_5, 4, 17, ui.get(invert_aa) and 150 or savor_slider_r, ui.get(invert_aa) and 150 or savor_slider_g, ui.get(invert_aa) and 150 or savor_slider_b, ui.get(invert_aa) and 90 or alpha_faster)
	renderer.rectangle(safety_w + x_5, y_5, 4, 17, ui.get(invert_aa) and savor_slider_r or 150, ui.get(invert_aa) and savor_slider_g or 150, ui.get(invert_aa) and savor_slider_b or 150, ui.get(invert_aa) and alpha_faster or 90)
	renderer.rectangle(x_5 + 2, y_5, safety_w, 17, savor_box_r, savor_box_g, savor_box_b, savor_box_a)
	renderer.text(x_5 + 5, 2 + y_5, savor_format_r, savor_format_g, savor_format_b, savor_format_a, "", 0, safety_text)
	renderer.rectangle(x_6, y_6, max_val * 0.5 >= 10 and lc_wind + 21 or lc_wind + 7, 17, savor_box_r, savor_box_g, savor_box_b, while_ariel and 0 or savor_box_a)
	renderer.rectangle(x_6 - 2, y_6, 2, 17, savor_slider_r, savor_slider_g, savor_slider_b, while_ariel and 0 or savor_slider_a)
	renderer.text(x_6 + 5, 2 + y_6, savor_format_r, savor_format_g, savor_format_b, while_ariel and 0 or savor_format_a, "", 0, lc_text)
	renderer.gradient(max_val * 0.5 >= 10 and x_6 + lc_wind or x_6 + lc_wind, y_6 + 6, (max_val + YDL_real_global_choke / 2) / 2, 6, savor_slider_r, savor_slider_g, savor_slider_b, while_ariel and 0 or savor_slider_a, savor_slider_r, savor_slider_g, savor_slider_b, while_ariel and 0 or savor_slider_a, true)
	hk_dragger:drag(w, h * 1.1)
	hk_dragger_2:drag(wind + 5, height * 1.15)
	hk_dragger_3:drag(200 + 5, 100 * 1.15)
	hk_dragger_4:drag(200, 18 * 2)
	hk_dragger_5:drag(safety_w, 17)
	hk_dragger_6:drag(lc_wind, 17)
end

client.set_event_callback("paint", draw_blackbox_indicator)
client.set_event_callback("player_spawn", player_spawn)
client.set_event_callback("setup_command", command_fakelag)

client.set_event_callback("paint", function(Global_YDL_Hide_Menus_Short)
	ui.set_visible(invert_aa, ui.get(enabled_custom_aa))
	ui.set_visible(first_label, ui.get(enabled_custom_aa))
	ui.set_visible(manual_aa, ui.get(enabled_custom_aa))
	ui.set_visible(antiaim_dir, ui.get(enabled_custom_aa))
	ui.set_visible(chkbox_slowwalk, ui.get(enabled_custom_aa))
	ui.set_visible(enabled_indicator, ui.get(enabled_custom_aa))
	ui.set_visible(status_acitve_visible, ui.get(enabled_custom_aa))
	ui.set_visible(enabled_antiaim_exploit, ui.get(enabled_custom_aa))
	ui.set_visible(manual_left_dir, ui.get(enabled_custom_aa) and ui.get(manual_aa))
	ui.set_visible(real_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(manual_right_dir, ui.get(enabled_custom_aa) and ui.get(manual_aa))
	ui.set_visible(fake_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(text_starts, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(pulse_arrows, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(text_distance, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(arrows_starts, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(manual_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(limit_reference, ui.get(enabled_custom_aa) and ui.get(chkbox_slowwalk))
	ui.set_visible(rainbow_types, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(slider_slowwalk, ui.get(enabled_custom_aa) and ui.get(chkbox_slowwalk))
	ui.set_visible(manual_backward_dir, ui.get(enabled_custom_aa) and ui.get(manual_aa))
	ui.set_visible(information_l_4, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(freestanding_direction, ui.get(enabled_custom_aa) and ui.get(manual_aa))
	ui.set_visible(information_l_2, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(information_l_1, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(information_l_3, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(information_l_5, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(information_c_1, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(information_c_2, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(information_c_4, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(information_c_5, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(information_c_3, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(arrows_distance, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(real_desync_color, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(anims_type, ui.get(enabled_custom_aa) and ui.get(enabled_antiaim_exploit))
	ui.set_visible(fake_desync_color, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(manual_desync_color, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(enabled_box_indicator, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(arrows_indicator_types, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(enabled_circle_indicator, ui.get(enabled_custom_aa) and ui.get(enabled_indicator))
	ui.set_visible(pulse_types, ui.get(enabled_custom_aa) and ui.get(pulse_arrows) and ui.get(enabled_indicator))
	ui.set_visible(box_dh_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_tab_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(h_fl_scale_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(h_aa_scale_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(nem_slider_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_dh_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(h_fl_format_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_tab_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_slider_c_2, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_slider_c_1, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(h_aa_format_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(h_fl_scale_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_format_c_1, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_format_c_2, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(h_aa_scale_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(nem_slider_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(h_fl_format_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(lag_format_types, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(lag_arrows_status, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
end)

client.set_event_callback("paint", function(Global_YDL_Hide_Menus_Long)
	ui.set_visible(box_slider_label_1, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_slider_label_2, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(value_savor_box_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(h_aa_format_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(blackbox_line_type, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_format_label_1, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_format_label_2, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(value_savor_slider_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(blackbox_flags_type, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(blackbox_menu_type, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(value_savor_format_c, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(value_savor_box_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_format_c_disabled, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(value_savor_slider_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(remove_skeet_indicators, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(value_savor_format_label, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(box_format_label_disabled, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator))
	ui.set_visible(lag_arrows_types, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator) and ui.get(lag_arrows_status) == "Arrows Fluctuate")
	ui.set_visible(blackbox_gradient_1, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator) and ui.get(blackbox_line_type) == "Static Faded Color")
	ui.set_visible(blackbox_gradient_c_1, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator) and ui.get(blackbox_line_type) == "Static Faded Color")
	ui.set_visible(blackbox_gradient_2, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator) and ui.get(blackbox_line_type) == "Static Faded Color")
	ui.set_visible(blackbox_gradient_c_2, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator) and ui.get(blackbox_line_type) == "Static Faded Color")
	ui.set_visible(blackbox_line_status, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator) and ui.get(blackbox_line_type) == "Rainbow Faded Color")
	ui.set_visible(blackbox_gradient_rainbow_speed, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(enabled_box_indicator) and ui.get(blackbox_line_type) == "Rainbow Faded Color")
	visible_table(player_status_cond["Default"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Default" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Standing"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Standing" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Moving"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Moving" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Slow Motion"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Slow Motion" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["In Air"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "In Air" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Crouching"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Crouching" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Shooting"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Shooting" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Hide Shot"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Hide Shot" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Double Tap"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Double Tap" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Fake Duck"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Fake Duck" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Wall Peek"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Wall Peek" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Visible Peek"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Visible Peek" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["On Key"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "On Key" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Manual Left"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Manual Left" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond["Manual Right"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Manual Right" and ui.get(antiaim_dir) == "Left Desync")
	visible_table(player_status_cond_2["Default"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Default" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Standing"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Standing" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Moving"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Moving" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Slow Motion"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Slow Motion" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["In Air"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "In Air" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Crouching"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Crouching" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Shooting"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Shooting" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Hide Shot"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Hide Shot" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Double Tap"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Double Tap" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Fake Duck"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Fake Duck" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Wall Peek"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Wall Peek" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Visible Peek"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Visible Peek" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["On Key"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "On Key" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Manual Left"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Manual Left" and ui.get(antiaim_dir) == "Right Desync")
	visible_table(player_status_cond_2["Manual Right"], ui.get(enabled_custom_aa) and ui.get(status_acitve_visible) == "Manual Right" and ui.get(antiaim_dir) == "Right Desync")
	ui.set_visible(arrows_rainbow_speed, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and multi_select(ui.get(rainbow_types), "Real Angle Arrows") or ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and multi_select(ui.get(rainbow_types), "Fake Angle Arrows"))
	ui.set_visible(pulse_speed, ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(pulse_arrows) and multi_select(ui.get(pulse_types), "Real Angle Arrows") or ui.get(enabled_custom_aa) and ui.get(enabled_indicator) and ui.get(pulse_arrows) and multi_select(ui.get(pulse_types), "Fake Angle Arrows"))
end)

-- Creative Fake BKT Lua Indicators By YDL QQ3207523762 Thank For Your Use
-- Creative Custom AntiAim Coder By YDL QQ3207523762 Thank For Your Use
-- Creative Custom AntiAim Coder By YDL QQ3207523762 Thank For Your Use
-- Creative Custom AntiAim Coder By YDL QQ3207523762 Thank For Your Use
-- Creative Custom AntiAim Coder By YDL QQ3207523762 Thank For Your Use
-- Creative Custom AntiAim Coder By YDL QQ3207523762 Thank For Your Use
-- Creative Fake BKT Lua Indicators By YDL QQ3207523762 Thank For Your Use