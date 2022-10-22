--[[Double Tap Lua Creative By YDL QQ3207523762
Creative Time: 2020.11.6
Creative Function: DT Speed, TickBase Speed, Fixer DT AA, DT Fakelag Types, Fakelag Send Packet Types, Custom DT Types ,Better Clock Correction
Creative Indicators: YDL, Custom Text]]--

local line_goes_through_smoke

do
	local success, match = client.find_signature("client_panorama.dll", "\x55\x8B\xEC\x83\xEC\x08\x8B\x15\xCC\xCC\xCC\xCC\x0F\x57")

	if success and match ~= nil then
		local lgts_type = ffi.typeof("bool(__thiscall*)(float, float, float, float, float, float, short);")

		line_goes_through_smoke = ffi.cast(lgts_type, match)
	end
end

function math.round(number, precision)
	local mult = 10 ^ (precision or 0)

	return math.floor(number * mult + 0.5) / mult
end

local angle_c = {}
local angle_mt = {
	__index = angle_c
}

angle_mt.__call = function(angle, p_new, y_new, r_new)
	p_new = p_new or angle.p
	y_new = y_new or angle.y
	r_new = r_new or angle.r

	angle.p = p_new
	angle.y = y_new
	angle.r = r_new
end

local function angle(p, y, r)
	return setmetatable(
		{
			p = p or 0,
			y = y or 0,
			r = r or 0
		},
		angle_mt
	)
end

function angle_c:set(p, y, r)
	p = p or self.p
	y = y or self.y
	r = r or self.r

	self.p = p
	self.y = y
	self.r = r
end

function angle_c:offset(p, y, r)
	p = self.p + p or 0
	y = self.y + y or 0
	r = self.r + r or 0

	self.p = self.p + p
	self.y = self.y + y
	self.r = self.r + r
end

function angle_c:clone()
	return setmetatable(
		{
			p = self.p,
			y = self.y,
			r = self.r
		},
		angle_mt
	)
end

function angle_c:clone_offset(p, y, r)
	p = self.p + p or 0
	y = self.y + y or 0
	r = self.r + r or 0

	return angle(
		self.p + p,
		self.y + y,
		self.r + r
	)
end

function angle_c:clone_set(p, y, r)
	p = p or self.p
	y = y or self.y
	r = r or self.r

	return angle(
		p,
		y,
		r
	)
end

function angle_c:unpack()
	return self.p, self.y, self.r
end

function angle_c:nullify()
	self.p = 0
	self.y = 0
	self.r = 0
end

function angle_mt.__tostring(operand_a)
	return string.format("%s, %s, %s", operand_a.p, operand_a.y, operand_a.r)
end

function angle_mt.__concat(operand_a)
	return string.format("%s, %s, %s", operand_a.p, operand_a.y, operand_a.r)
end

function angle_mt.__add(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a + operand_b.p,
			operand_a + operand_b.y,
			operand_a + operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p + operand_b,
			operand_a.y + operand_b,
			operand_a.r + operand_b
		)
	end

	return angle(
		operand_a.p + operand_b.p,
		operand_a.y + operand_b.y,
		operand_a.r + operand_b.r
	)
end

function angle_mt.__sub(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a - operand_b.p,
			operand_a - operand_b.y,
			operand_a - operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p - operand_b,
			operand_a.y - operand_b,
			operand_a.r - operand_b
		)
	end

	return angle(
		operand_a.p - operand_b.p,
		operand_a.y - operand_b.y,
		operand_a.r - operand_b.r
	)
end

function angle_mt.__mul(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a * operand_b.p,
			operand_a * operand_b.y,
			operand_a * operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p * operand_b,
			operand_a.y * operand_b,
			operand_a.r * operand_b
		)
	end

	return angle(
		operand_a.p * operand_b.p,
		operand_a.y * operand_b.y,
		operand_a.r * operand_b.r
	)
end

function angle_mt.__div(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a / operand_b.p,
			operand_a / operand_b.y,
			operand_a / operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p / operand_b,
			operand_a.y / operand_b,
			operand_a.r / operand_b
		)
	end

	return angle(
		operand_a.p / operand_b.p,
		operand_a.y / operand_b.y,
		operand_a.r / operand_b.r
	)
end

function angle_mt.__pow(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			math.pow(operand_a, operand_b.p),
			math.pow(operand_a, operand_b.y),
			math.pow(operand_a, operand_b.r)
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			math.pow(operand_a.p, operand_b),
			math.pow(operand_a.y, operand_b),
			math.pow(operand_a.r, operand_b)
		)
	end

	return angle(
		math.pow(operand_a.p, operand_b.p),
		math.pow(operand_a.y, operand_b.y),
		math.pow(operand_a.r, operand_b.r)
	)
end

function angle_mt.__mod(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return angle(
			operand_a % operand_b.p,
			operand_a % operand_b.y,
			operand_a % operand_b.r
		)
	end

	if (type(operand_b) == "number") then
		return angle(
			operand_a.p % operand_b,
			operand_a.y % operand_b,
			operand_a.r % operand_b
		)
	end

	return angle(
		operand_a.p % operand_b.p,
		operand_a.y % operand_b.y,
		operand_a.r % operand_b.r
	)
end

function angle_mt.__unm(operand_a)
	return angle(
		-operand_a.p,
		-operand_a.y,
		-operand_a.r
	)
end

function angle_c:round_zero()
	self.p = math.floor(self.p + 0.5)
	self.y = math.floor(self.y + 0.5)
	self.r = math.floor(self.r + 0.5)
end

function angle_c:round(precision)
	self.p = math.round(self.p, precision)
	self.y = math.round(self.y, precision)
	self.r = math.round(self.r, precision)
end

function angle_c:round_base(base)
	self.p = base * math.round(self.p / base)
	self.y = base * math.round(self.y / base)
	self.r = base * math.round(self.r / base)
end

function angle_c:rounded_zero()
	return angle(
		math.floor(self.p + 0.5),
		math.floor(self.y + 0.5),
		math.floor(self.r + 0.5)
	)
end

function angle_c:rounded(precision)
	return angle(
		math.round(self.p, precision),
		math.round(self.y, precision),
		math.round(self.r, precision)
	)
end

function angle_c:rounded_base(base)
	return angle(
		base * math.round(self.p / base),
		base * math.round(self.y / base),
		base * math.round(self.r / base)
	)
end

local vector_c = {}
local vector_mt = {
	__index = vector_c,
}

vector_mt.__call = function(vector, x_new, y_new, z_new)
	x_new = x_new or vector.x
	y_new = y_new or vector.y
	z_new = z_new or vector.z

	vector.x = x_new
	vector.y = y_new
	vector.z = z_new
end

local function vector(x, y, z)
	return setmetatable(
		{
			x = x or 0,
			y = y or 0,
			z = z or 0
		},
		vector_mt
	)
end

function vector_c:set(x_new, y_new, z_new)
	x_new = x_new or self.x
	y_new = y_new or self.y
	z_new = z_new or self.z

	self.x = x_new
	self.y = y_new
	self.z = z_new
end

function vector_c:offset(x_offset, y_offset, z_offset)
	x_offset = x_offset or 0
	y_offset = y_offset or 0
	z_offset = z_offset or 0

	self.x = self.x + x_offset
	self.y = self.y + y_offset
	self.z = self.z + z_offset
end

function vector_c:clone()
	return setmetatable(
		{
			x = self.x,
			y = self.y,
			z = self.z
		},
		vector_mt
	)
end

function vector_c:clone_offset(x_offset, y_offset, z_offset)
	x_offset = x_offset or 0
	y_offset = y_offset or 0
	z_offset = z_offset or 0

	return setmetatable(
		{
			x = self.x + x_offset,
			y = self.y + y_offset,
			z = self.z + z_offset
		},
		vector_mt
	)
end

function vector_c:clone_set(x_new, y_new, z_new)
	x_new = x_new or self.x
	y_new = y_new or self.y
	z_new = z_new or self.z

	return vector(
		x_new,
		y_new,
		z_new
	)
end

function vector_c:unpack()
	return self.x, self.y, self.z
end

function vector_c:nullify()
	self.x = 0
	self.y = 0
	self.z = 0
end

function vector_mt.__tostring(operand_a)
	return string.format("%s, %s, %s", operand_a.x, operand_a.y, operand_a.z)
end

function vector_mt.__concat(operand_a)
	return string.format("%s, %s, %s", operand_a.x, operand_a.y, operand_a.z)
end

function vector_mt.__eq(operand_a, operand_b)
	return (operand_a.x == operand_b.x) and (operand_a.y == operand_b.y) and (operand_a.z == operand_b.z)
end

function vector_mt.__lt(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return (operand_a < operand_b.x) or (operand_a < operand_b.y) or (operand_a < operand_b.z)
	end

	if (type(operand_b) == "number") then
		return (operand_a.x < operand_b) or (operand_a.y < operand_b) or (operand_a.z < operand_b)
	end

	return (operand_a.x < operand_b.x) or (operand_a.y < operand_b.y) or (operand_a.z < operand_b.z)
end

function vector_mt.__le(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return (operand_a <= operand_b.x) or (operand_a <= operand_b.y) or (operand_a <= operand_b.z)
	end

	if (type(operand_b) == "number") then
		return (operand_a.x <= operand_b) or (operand_a.y <= operand_b) or (operand_a.z <= operand_b)
	end

	return (operand_a.x <= operand_b.x) or (operand_a.y <= operand_b.y) or (operand_a.z <= operand_b.z)
end

function vector_mt.__add(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a + operand_b.x,
			operand_a + operand_b.y,
			operand_a + operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x + operand_b,
			operand_a.y + operand_b,
			operand_a.z + operand_b
		)
	end

	return vector(
		operand_a.x + operand_b.x,
		operand_a.y + operand_b.y,
		operand_a.z + operand_b.z
	)
end

function vector_mt.__sub(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a - operand_b.x,
			operand_a - operand_b.y,
			operand_a - operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x - operand_b,
			operand_a.y - operand_b,
			operand_a.z - operand_b
		)
	end

	return vector(
		operand_a.x - operand_b.x,
		operand_a.y - operand_b.y,
		operand_a.z - operand_b.z
	)
end

function vector_mt.__mul(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a * operand_b.x,
			operand_a * operand_b.y,
			operand_a * operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x * operand_b,
			operand_a.y * operand_b,
			operand_a.z * operand_b
		)
	end

	return vector(
		operand_a.x * operand_b.x,
		operand_a.y * operand_b.y,
		operand_a.z * operand_b.z
	)
end

function vector_mt.__div(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a / operand_b.x,
			operand_a / operand_b.y,
			operand_a / operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x / operand_b,
			operand_a.y / operand_b,
			operand_a.z / operand_b
		)
	end

	return vector(
		operand_a.x / operand_b.x,
		operand_a.y / operand_b.y,
		operand_a.z / operand_b.z
	)
end

function vector_mt.__pow(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			math.pow(operand_a, operand_b.x),
			math.pow(operand_a, operand_b.y),
			math.pow(operand_a, operand_b.z)
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			math.pow(operand_a.x, operand_b),
			math.pow(operand_a.y, operand_b),
			math.pow(operand_a.z, operand_b)
		)
	end

	return vector(
		math.pow(operand_a.x, operand_b.x),
		math.pow(operand_a.y, operand_b.y),
		math.pow(operand_a.z, operand_b.z)
	)
end

function vector_mt.__mod(operand_a, operand_b)
	if (type(operand_a) == "number") then
		return vector(
			operand_a % operand_b.x,
			operand_a % operand_b.y,
			operand_a % operand_b.z
		)
	end

	if (type(operand_b) == "number") then
		return vector(
			operand_a.x % operand_b,
			operand_a.y % operand_b,
			operand_a.z % operand_b
		)
	end

	return vector(
		operand_a.x % operand_b.x,
		operand_a.y % operand_b.y,
		operand_a.z % operand_b.z
	)
end

function vector_mt.__unm(operand_a)
	return vector(
		-operand_a.x,
		-operand_a.y,
		-operand_a.z
	)
end

function vector_c:length2_squared()
	return (self.x * self.x) + (self.y * self.y);
end

function vector_c:length2()
	return math.sqrt(self:length2_squared())
end

function vector_c:length_squared()
	return (self.x * self.x) + (self.y * self.y) + (self.z * self.z);
end

function vector_c:length()
	return math.sqrt(self:length_squared())
end

function vector_c:dot_product(b)
	return (self.x * b.x) + (self.y * b.y) + (self.z * b.z)
end

function vector_c:cross_product(b)
	return vector(
		(self.y * b.z) - (self.z * b.y),
		(self.z * b.x) - (self.x * b.z),
		(self.x * b.y) - (self.y * b.x)
	)
end

function vector_c:distance2(destination)
	return (destination - self):length2()
end

function vector_c:distance(destination)
	return (destination - self):length()
end

function vector_c:distance_x(destination)
	return math.abs(self.x - destination.x)
end

function vector_c:distance_y(destination)
	return math.abs(self.y - destination.y)
end

function vector_c:distance_z(destination)
	return math.abs(self.z - destination.z)
end

function vector_c:in_range(destination, distance)
	return self:distance(destination) <= distance
end

function vector_c:round_zero()
	self.x = math.floor(self.x + 0.5)
	self.y = math.floor(self.y + 0.5)
	self.z = math.floor(self.z + 0.5)
end

function vector_c:round(precision)
	self.x = math.round(self.x, precision)
	self.y = math.round(self.y, precision)
	self.z = math.round(self.z, precision)
end

function vector_c:round_base(base)
	self.x = base * math.round(self.x / base)
	self.y = base * math.round(self.y / base)
	self.z = base * math.round(self.z / base)
end

function vector_c:rounded_zero()
	return vector(
		math.floor(self.x + 0.5),
		math.floor(self.y + 0.5),
		math.floor(self.z + 0.5)
	)
end

function vector_c:rounded(precision)
	return vector(
		math.round(self.x, precision),
		math.round(self.y, precision),
		math.round(self.z, precision)
	)
end

function vector_c:rounded_base(base)
	return vector(
		base * math.round(self.x / base),
		base * math.round(self.y / base),
		base * math.round(self.z / base)
	)
end

function vector_c:normalize()
	local length = self:length()

	-- Prevent possible divide-by-zero errors.
	if (length ~= 0) then
		self.x = self.x / length
		self.y = self.y / length
		self.z = self.z / length
	else
		self.x = 0
		self.y = 0
		self.z = 1
	end
end

function vector_c:normalized_length()
	return self:length()
end

function vector_c:normalized()
	local length = self:length()

	if (length ~= 0) then
		return vector(
			self.x / length,
			self.y / length,
			self.z / length
		)
	else
		return vector(0, 0, 1)
	end
end

function vector_c:to_screen(only_within_screen_boundary)
	local x, y = renderer.world_to_screen(self.x, self.y, self.z)

	if (x == nil or y == nil) then
		return nil
	end

	if (only_within_screen_boundary == true) then
		local screen_x, screen_y = client.screen_size()

		if (x < 0 or x > screen_x or y < 0 or y > screen_y) then
			return nil
		end
	end

	return vector(x, y)
end

function vector_c:magnitude()
	return math.sqrt(
		math.pow(self.x, 2) +
			math.pow(self.y, 2) +
			math.pow(self.z, 2)
	)
end

function vector_c:angle_to(destination)
	-- Calculate the delta of vectors.
	local delta_vector = vector(destination.x - self.x, destination.y - self.y, destination.z - self.z)

	-- Calculate the yaw.
	local yaw = math.deg(math.atan2(delta_vector.y, delta_vector.x))

	-- Calculate the pitch.
	local hyp = math.sqrt(delta_vector.x * delta_vector.x + delta_vector.y * delta_vector.y)
	local pitch = math.deg(math.atan2(-delta_vector.z, hyp))

	return angle(pitch, yaw)
end

function vector_c:lerp(destination, percentage)
	return self + (destination - self) * percentage
end

local function vector_internal_division(source, destination, m, n)
	return vector((source.x * n + destination.x * m) / (m + n),
		(source.y * n + destination.y * m) / (m + n),
		(source.z * n + destination.z * m) / (m + n))
end

function vector_c:trace_line_to(destination, skip_entindex)
	skip_entindex = skip_entindex or -1

	return client.trace_line(
		skip_entindex,
		self.x,
		self.y,
		self.z,
		destination.x,
		destination.y,
		destination.z
	)
end

function vector_c:trace_line_impact(destination, skip_entindex)
	skip_entindex = skip_entindex or -1

	local fraction, eid = client.trace_line(skip_entindex, self.x, self.y, self.z, destination.x, destination.y, destination.z)
	local impact = self:lerp(destination, fraction)

	return fraction, eid, impact
end

function vector_c:trace_line_skip_indices(destination, max_traces, callback)
	max_traces = max_traces or 10

	local fraction, eid = 0, -1
	local impact = self
	local i = 0

	while (max_traces >= i and fraction < 1 and ((eid > -1 and callback(eid)) or impact == self)) do
		fraction, eid, impact = impact:trace_line_impact(destination, eid)
		i = i + 1
	end

	return self:distance(impact) / self:distance(destination), eid, impact
end

function vector_c:trace_line_skip_class(destination, skip_classes, skip_distance)
	local should_skip = function(index, skip_entity)
		local class_name = entity.get_classname(index) or ""
		for i in 1, #skip_entity do
			if class_name == skip_entity[i] then
				return true
			end
		end

		return false
	end

	local angles = self:angle_to(destination)
	local direction = angles:to_forward_vector()

	local last_traced_position = self

	while true do  -- Start tracing.
		local fraction, hit_entity = last_traced_position:trace_line_to(destination)

		if fraction == 1 and hit_entity == -1 then  -- If we didn't hit anything.
			return 1, -1  -- return nothing.
		else  -- BOIS WE HIT SOMETHING.
			if should_skip(hit_entity, skip_classes) then  -- If entity should be skipped.
				-- Set last traced position according to fraction.
				last_traced_position = vector_internal_division(self, destination, fraction, 1 - fraction)

				-- Add a little gap per each trace to prevent inf loop caused by intersection.
				last_traced_position = last_traced_position + direction * skip_distance
			else  -- That's the one I want.
				return fraction, hit_entity, self:lerp(destination, fraction)
			end
		end
	end
end

function vector_c:trace_bullet_to(destination, eid)
	return client.trace_bullet(
		eid,
		self.x,
		self.y,
		self.z,
		destination.x,
		destination.y,
		destination.z
	)
end

function vector_c:closest_ray_point(ray_start, ray_end)
	local to = self - ray_start
	local direction = ray_end - ray_start
	local length = direction:length()

	direction:normalize()

	local ray_along = to:dot_product(direction)

	if (ray_along < 0) then
		return ray_start
	elseif (ray_along > length) then
		return ray_end
	end

	return ray_start + direction * ray_along
end

function vector_c:ray_divided(ray_end, ratio)
	return (self * ratio + ray_end) / (1 + ratio)
end

function vector_c:ray_segmented(ray_end, segments)
	local points = {}

	for i = 0, segments do
		points[i] = vector_internal_division(self, ray_end, i, segments - i)
	end

	return points
end

function vector_c:ray(ray_end, total_segments)
	total_segments = total_segments or 128

	local segments = {}
	local step = self:distance(ray_end) / total_segments
	local angle = self:angle_to(ray_end)
	local direction = angle:to_forward_vector()

	for i = 1, total_segments do
		table.insert(segments, self + (direction * (step * i)))
	end

	local src_screen_position = vector(0, 0, 0)
	local dst_screen_position = vector(0, 0, 0)
	local src_in_screen = false
	local dst_in_screen = false

	for i = 1, #segments do
		src_screen_position = segments[i]:to_screen()

		if src_screen_position ~= nil then
			src_in_screen = true

			break
		end
	end

	for i = #segments, 1, -1 do
		dst_screen_position = segments[i]:to_screen()

		if dst_screen_position ~= nil then
			dst_in_screen = true

			break
		end
	end

	if src_in_screen and dst_in_screen then
		return src_screen_position, dst_screen_position
	end

	return nil
end

function vector_c:ray_intersects_smoke(ray_end)
	if (line_goes_through_smoke == nil) then
		error("Unsafe scripts must be allowed in order to use vector_c:ray_intersects_smoke")
	end

	return line_goes_through_smoke(self.x, self.y, self.z, ray_end.x, ray_end.y, ray_end.z, 1)
end

function vector_c:inside_polygon2(polygon)
	local odd_nodes = false
	local polygon_vertices = #polygon
	local j = polygon_vertices

	for i = 1, polygon_vertices do
		if (polygon[i].y < self.y and polygon[j].y >= self.y or polygon[j].y < self.y and polygon[i].y >= self.y) then
			if (polygon[i].x + (self.y - polygon[i].y) / (polygon[j].y - polygon[i].y) * (polygon[j].x - polygon[i].x) < self.x) then
				odd_nodes = not odd_nodes
			end
		end

		j = i
	end

	return odd_nodes
end

function vector_c:draw_circle(radius, r, g, b, a, accuracy, width, outline, start_degrees, percentage)
	local accuracy = accuracy ~= nil and accuracy or 3
	local width = width ~= nil and width or 1
	local outline = outline ~= nil and outline or false
	local start_degrees = start_degrees ~= nil and start_degrees or 0
	local percentage = percentage ~= nil and percentage or 1

	local screen_x_line_old, screen_y_line_old

	for rot = start_degrees, percentage * 360, accuracy do
		local rot_temp = math.rad(rot)
		local lineX, lineY, lineZ = radius * math.cos(rot_temp) + self.x, radius * math.sin(rot_temp) + self.y, self.z
		local screen_x_line, screen_y_line = renderer.world_to_screen(lineX, lineY, lineZ)
		if screen_x_line ~= nil and screen_x_line_old ~= nil then

			for i = 1, width do
				local i = i - 1

				renderer.line(screen_x_line, screen_y_line - i, screen_x_line_old, screen_y_line_old - i, r, g, b, a)
			end

			if outline then
				local outline_a = a / 255 * 160

				renderer.line(screen_x_line, screen_y_line - width, screen_x_line_old, screen_y_line_old - width, 16, 16, 16, outline_a)

				renderer.line(screen_x_line, screen_y_line + 1, screen_x_line_old, screen_y_line_old + 1, 16, 16, 16, outline_a)
			end
		end

		screen_x_line_old, screen_y_line_old = screen_x_line, screen_y_line
	end
end

function vector_c:min(value)
	self.x = math.min(value, self.x)
	self.y = math.min(value, self.y)
	self.z = math.min(value, self.z)
end

function vector_c:max(value)
	self.x = math.max(value, self.x)
	self.y = math.max(value, self.y)
	self.z = math.max(value, self.z)
end

function vector_c:minned(value)
	return vector(
		math.min(value, self.x),
		math.min(value, self.y),
		math.min(value, self.z)
	)
end

function vector_c:maxed(value)
	return vector(
		math.max(value, self.x),
		math.max(value, self.y),
		math.max(value, self.z)
	)
end

function angle_c:to_forward_vector()
	local degrees_to_radians = function(degrees)
		return degrees * math.pi / 180
	end

	local sp = math.sin(degrees_to_radians(self.p))
	local cp = math.cos(degrees_to_radians(self.p))
	local sy = math.sin(degrees_to_radians(self.y))
	local cy = math.cos(degrees_to_radians(self.y))

	return vector(cp * cy, cp * sy, -sp)
end

function angle_c:to_up_vector()
	local degrees_to_radians = function(degrees)
		return degrees * math.pi / 180
	end

	local sp = math.sin(degrees_to_radians(self.p))
	local cp = math.cos(degrees_to_radians(self.p))
	local sy = math.sin(degrees_to_radians(self.y))
	local cy = math.cos(degrees_to_radians(self.y))
	local sr = math.sin(degrees_to_radians(self.r))
	local cr = math.cos(degrees_to_radians(self.r))

	return vector(cr * sp * cy + sr * sy, cr * sp * sy + sr * cy * -1, cr * cp)
end

function angle_c:to_right_vector()
	local degrees_to_radians = function(degrees)
		return degrees * math.pi / 180
	end

	local sp = math.sin(degrees_to_radians(self.p))
	local cp = math.cos(degrees_to_radians(self.p))
	local sy = math.sin(degrees_to_radians(self.y))
	local cy = math.cos(degrees_to_radians(self.y))
	local sr = math.sin(degrees_to_radians(self.r))
	local cr = math.cos(degrees_to_radians(self.r))

	return vector(sr * sp * cy * -1 + cr * sy, sr * sp * sy * -1 + -1 * cr * cy, -1 * sr * cp)
end

function angle_c:to_backward_vector()
	local degrees_to_radians = function(degrees)
		return degrees * math.pi / 180
	end

	local sp = math.sin(degrees_to_radians(self.p))
	local cp = math.cos(degrees_to_radians(self.p))
	local sy = math.sin(degrees_to_radians(self.y))
	local cy = math.cos(degrees_to_radians(self.y))

	return -vector(cp * cy, cp * sy, -sp)
end

function angle_c:to_left_vector()
	local degrees_to_radians = function(degrees)
		return degrees * math.pi / 180
	end

	local sp = math.sin(degrees_to_radians(self.p))
	local cp = math.cos(degrees_to_radians(self.p))
	local sy = math.sin(degrees_to_radians(self.y))
	local cy = math.cos(degrees_to_radians(self.y))
	local sr = math.sin(degrees_to_radians(self.r))
	local cr = math.cos(degrees_to_radians(self.r))

	return -vector(sr * sp * cy * -1 + cr * sy, sr * sp * sy * -1 + -1 * cr * cy, -1 * sr * cp)
end

function angle_c:to_down_vector()
	local degrees_to_radians = function(degrees)
		return degrees * math.pi / 180
	end

	local sp = math.sin(degrees_to_radians(self.p))
	local cp = math.cos(degrees_to_radians(self.p))
	local sy = math.sin(degrees_to_radians(self.y))
	local cy = math.cos(degrees_to_radians(self.y))
	local sr = math.sin(degrees_to_radians(self.r))
	local cr = math.cos(degrees_to_radians(self.r))

	return -vector(cr * sp * cy + sr * sy, cr * sp * sy + sr * cy * -1, cr * cp)
end

function angle_c:fov_to(source, destination)
	local fwd = self:to_forward_vector()
	local delta = (destination - source):normalized()
	local fov = math.acos(fwd:dot_product(delta) / delta:length())

	return math.max(0.0, math.deg(fov))
end

function angle_c:bearing(precision)
	local yaw = 180 - self.y + 90
	local degrees = (yaw % 360 + 360) % 360

	degrees = degrees > 180 and degrees - 360 or degrees

	return math.round(degrees + 180, precision)
end

function angle_c:start_degrees()
	local yaw = self.y
	local degrees = (yaw % 360 + 360) % 360

	degrees = degrees > 180 and degrees - 360 or degrees

	return degrees + 180
end

function angle_c:normalize()
	local pitch = self.p

	if (pitch < -89) then
		pitch = -89
	elseif (pitch > 89) then
		pitch = 89
	end

	local yaw = self.y

	while yaw > 180 do
		yaw = yaw - 360
	end

	while yaw < -180 do
		yaw = yaw + 360
	end

	return angle(pitch, yaw, 0)
end

function angle_c:normalized()
	if (self.p < -89) then
		self.p = -89
	elseif (self.p > 89) then
		self.p = 89
	end

	local yaw = self.y

	while yaw > 180 do
		yaw = yaw - 360
	end

	while yaw < -180 do
		yaw = yaw + 360
	end

	self.y = yaw
	self.r = 0
end

function vector_c.draw_polygon(polygon, r, g, b, a, segments)
	for id, vertex in pairs(polygon) do
		local next_vertex = polygon[id + 1]

		if (next_vertex == nil) then
			next_vertex = polygon[1]
		end

		local ray_a, ray_b = vertex:ray(next_vertex, (segments or 64))

		if (ray_a ~= nil and ray_b ~= nil) then
			renderer.line(
				ray_a.x, ray_a.y,
				ray_b.x, ray_b.y,
				r, g, b, a
			)
		end
	end
end

function vector_c.eye_position(eid)
	local origin = vector(entity.get_origin(eid))
	local duck_amount = entity.get_prop(eid, "m_flDuckAmount") or 0

	origin.z = origin.z + 46 + (1 - duck_amount) * 18

	return origin
end

local dragging = (function()local a={}local b,c,d,e,f,g,h,i,j,k,l,m,n,o;local p={__index={drag=function(self,...)local q,r=self:get()local s,t=a.drag(q,r,...)if q~=s or r~=t then self:set(s,t)end;return s,t end,set=function(self,q,r)local j,k=client.screen_size()ui.set(self.x_reference,q/j*self.res)ui.set(self.y_reference,r/k*self.res)end,get=function(self)local j,k=client.screen_size()return ui.get(self.x_reference)/self.res*j,ui.get(self.y_reference)/self.res*k end}}function a.new(u,v,w,x)x=x or 10000;local j,k=client.screen_size()local y=ui.new_slider("AA", "Fake lag",u.." pos",0,x,v/j*x)local z=ui.new_slider("AA", "Fake lag","\n"..u.." pos 2",0,x,w/k*x)ui.set_visible(y,false)ui.set_visible(z,false)return setmetatable({name=u,x_reference=y,y_reference=z,res=x},p)end;function a.drag(q,r,A,B,C,D,E)if globals.framecount()~=b then c=ui.is_menu_open()f,g=d,e;d,e=ui.mouse_position()i=h;h=client.key_state(0x01)==true;m=l;l={}o=n;n=false;j,k=client.screen_size()end;if c and i~=nil then if(not i or o)and h and f>q and g>r and f<q+A and g<r+B then n=true;q,r=q+d-f,r+e-g;if not D then q=math.max(0,math.min(j-A,q))r=math.max(0,math.min(k-B,r))end end end;table.insert(l,{q,r,A,B})return q,r,A,B end;return a end)()
local hk_dragger = dragging.new("Double Tap Indicators Daragger", 0, 485)
local ffi = require("ffi")
local http = require "gamesense/http"
local fakeduck = ui.reference("Rage", "Other", "Duck peek assist")
local double_tap, dt_hotkey = ui.reference("Rage", "Other", "Double tap")
local slow_walk, slow_hotkey =  ui.reference("AA", "Other", "Slow motion")
local double_tap_mode = ui.reference("Rage", "Other", "Double tap mode")
local doubletap_lag =  ui.reference("Rage", "Other", "Double tap fake lag limit")
local sv_urmaxticks =  ui.reference("Misc", "Settings", "sv_maxusrcmdprocessticks")
local lower_body =  ui.reference("AA", "Anti-aimbot angles", "Lower body yaw target")

local enabled_check_box = ui.new_checkbox("LUA", "A", "Enabled YuDi.Lua Advanced DoubleTap")
local doubletap_speed = ui.new_combobox("LUA", "A", "Select Double Tap Speed", "Safety Speed", "Faster Speed", "1 Ticks Faster Speed", "Adaptive Speed")
local disabled_correct = ui.new_checkbox("LUA", "A", "Disabled Clock Correction")
local indicator_types = ui.new_combobox("LUA", "A", "Double Tap Indicators Types", "Off", "YuDi.Lua Presets", "Custom Text")
local dt_active_color = ui.new_color_picker("LUA", "A", "\n Indicators Color", "0", "255", "255", "255")
local custom_text = ui.new_textbox("LUA", "A", "\n Custom Information Text")
local draw_circle = ui.new_checkbox("LUA", "A", "Draw Circle Cache Indicators")
local doubletap_types = ui.new_combobox("LUA", "A", "Custom Double Tap Types", "Standing", "Moving", "Slow Walk", "Jumping", "Crouching")
local standing_types = ui.new_combobox("LUA", "A", "Standing Types", "Offensive", "Defensive")
local moving_types = ui.new_combobox("LUA", "A", "Moving Types", "Offensive", "Defensive")
local slow_types = ui.new_combobox("LUA", "A", "Slow Walk Types", "Offensive", "Defensive")
local air_types = ui.new_combobox("LUA", "A", "Jumping Types", "Offensive", "Defensive")
local crouch_types = ui.new_combobox("LUA", "A", "Crouching Types", "Offensive", "Defensive")
ui.set(custom_text, "Lua By YuDi")

local normal_alpha = 272
local default_alpha = 120
local old_x, old_y, last_delay
local maximum_alpha = 226

local function contains(list, data)
	for i, v in pairs(list) do
		if(v == data) then return true end
	end

	return false
end

local function image_stuff()
	local M = {}
	local cache = {}
	local renderer_load_svg, renderer_texture, math_floor = renderer.load_svg, renderer.texture, math.floor
	local image_class = {}
	local image_mt = {__index = image_class}

	function image_class:measure(width, height)
		if width == nil and height == nil then
			return self.width, self.height
		elseif width == nil then
			height = height or self.height
		local width = math_floor(self.width * (height/self.height))
			return width, height
		elseif height == nil then
			width = width or self.width
		local height = math_floor(self.height * (width/self.width))
			return width, height
		else
			return width, height
		end
	end

	function image_class:draw(x, y, width, height, r, g, b, a, force_same_res_render)
		local width, height = self:measure(width, height)
		local id = width .. "_" .. height
		local texture = self.textures[id]
		if texture == nil then
			if ({next(self.textures)})[2] == nil or force_same_res_render then
				texture = renderer_load_svg(self.svg, width, height)
				if texture == nil then
					self.textures[id] = -1
				else
					self.textures[id] = texture
				end
			else
				texture = ({next(self.textures)})[2]
			end
		end

		if texture == nil or texture == -1 then
			return
		end

		if a > 0 then
			renderer_texture(texture, x, y, width, height, r, g, b, a)
		end

		return width, height
	end

	function M.load(data)
		local result = {}
		if cache[data] == nil then
		local header = data[-1]
			for image_name, image_data in pairs(data) do
				if image_name ~= -1 then
					local image = setmetatable({}, image_mt)
					image.name = image_name
					image.width = image_data[1]
					image.height = image_data[2]
					image.svg = image_data[3]
						if header ~= nil and image.svg:sub(0, 5) ~= "<?xml" then
							image.svg = header .. image.svg
						end

					image.textures = {}
					result[image_name] = image
				end
			end

			cache[data] = result
		else
			result = cache[data]
		end

		return result
	end

	return M
end

local function is_inside(a, b, x, y, w, h)
	return a >= x and a <= w and b >= y and b <= h
end

local client_get_can_exploit = function(localplayer, weapons, tickbase_correct)
	if weapons == nil then
		return
	end

	local tickbase = entity.get_prop(localplayer, "m_nTickBase")
	local curtime = globals.tickinterval() * (tickbase - tickbase_correct)
	if curtime < entity.get_prop(localplayer, "m_flNextAttack") then
		return false
	end
    
	if curtime < entity.get_prop(weapons, "m_flNextPrimaryAttack") then
		return false
	end
    
	return true
end

local weapon_names = {
    [1] = "weapon_deagle",
    [2] = "weapon_elite",
    [3] = "weapon_fiveseven",
    [4] = "weapon_glock",
    [7] = "weapon_ak47",
    [8] = "weapon_aug",
    [9] = "weapon_awp",
    [10] = "weapon_famas",
    [11] = "weapon_g3sg1",
    [13] = "weapon_galilar",
    [14] = "weapon_m249",
    [16] = "weapon_m4a1",
    [17] = "weapon_mac10",
    [19] = "weapon_p90",
    [23] = "weapon_mp5sd",
    [24] = "weapon_ump45",
    [25] = "weapon_xm1014",
    [26] = "weapon_bizon",
    [27] = "weapon_mag7",
    [28] = "weapon_negev",
    [29] = "weapon_sawedoff",
    [30] = "weapon_tec9",
    [31] = "weapon_taser",
    [32] = "weapon_hkp2000",
    [33] = "weapon_mp7",
    [34] = "weapon_mp9",
    [35] = "weapon_nova",
    [36] = "weapon_p250",
    [38] = "weapon_scar20",
    [39] = "weapon_sg556",
    [40] = "weapon_ssg08",
    [41] = "weapon_knifegg",
    [42] = "weapon_knife",
    [43] = "weapon_flashbang",
    [44] = "weapon_hegrenade",
    [45] = "weapon_smokegrenade",
    [46] = "weapon_molotov",
    [47] = "weapon_decoy",
    [48] = "weapon_incgrenade",
    [49] = "weapon_c4",
    [50] = "item_kevlar",
    [51] = "item_assaultsuit",
    [52] = "item_heavyassaultsuit",
    [55] = "item_defuser",
    [56] = "item_cutters",
    [57] = "weapon_healthshot",
    [59] = "weapon_knife_t",
    [60] = "weapon_m4a1_silencer",
    [61] = "weapon_usp_silencer",
    [63] = "weapon_cz75a",
    [64] = "weapon_revolver",
    [68] = "weapon_tagrenade",
    [69] = "weapon_fists",
    [70] = "weapon_breachcharge",
    [72] = "weapon_tablet",
    [74] = "weapon_melee",
    [75] = "weapon_axe",
    [76] = "weapon_hammer",
    [78] = "weapon_spanner",
    [80] = "weapon_knife_ghost",
    [81] = "weapon_firebomb",
    [82] = "weapon_diversion",
    [83] = "weapon_frag_grenade",
    [84] = "weapon_snowball",
    [512] = "weapon_knife_falchion",
    [514] = "weapon_knife_survival_bowie",
    [515] = "weapon_knife_butterfly",
    [516] = "weapon_knife_push",
    [503] = "weapon_knifegg",
    [522] = "weapon_knife_stiletto",
    [519] = "weapon_knife_ursus",
    [520] = "weapon_knife_gypsy_jackknife",
    [505] = "weapon_knife_flip",
    [506] = "weapon_knife_gut",
    [507] = "weapon_knife_karambit",
    [508] = "weapon_knife_m9_bayonet",
    [509] = "weapon_knife_tactical",
    [500] = "weapon_bayonet",
    [523] = "weapon_knife_widowmaker"
}

local weapons = {
    shots_1 = {ssg08 = 40, awp = 9,},
    shots_2 = {scar = 38, g3sg1 = 11, deagle = 1, glock = 4, p250 = 36, usp = 61,},
    shots_3 = {dual = 2, fiveseven = 3, ak47 = 7, aug = 8, famas = 10, m4a4 = 16, cz75 = 63,},
    shots_4 = {mp9 = 34, mp7 = 33, mac10 = 17, mp5 = 23,},
    knife_d = {knife1 = 41, knife2 = 42, flash = 43, f2 = 44, f3 = 45, f4 = 46, f5 = 47, f6 = 48, f7 = 81, f8 = 82, f9 = 83, k506 = 506, k507 = 507, k508 =        508, k509 = 509, k510 = 510, k511 = 511, k512 = 512, k513 = 513, k514 = 514, k515 = 515, k516 = 516, k517 = 517, k525 = 525,}
}

local cmove = {
	old_tickbase = 0,
	old_sim_time = 0,
	old_command_num = 0,
	skip_next_differ = false,
	charged_before = false,
	did_shift_before = false,
	can_shift_tickbase = 0,
	is_cmd_safe = true,
	last_charge = 0,
	validate_cmd = 0,
	lag_state = nil,
	delay = 0
}

local function exploit_crooked(e)
	local next_shift_amount = 0
	local should_break_tbc = false
	local localplayer = entity.get_local_player()
	if not localplayer or not entity.is_alive(localplayer) then
		return
	end

	if cmove.validate_cmd > 0 then
		cmove.validate_cmd = cmove.validate_cmd - 1
		local dt, dt_key = ui.get(double_tap), ui.get(dt_hotkey)
		if dt and dt_key then
			should_break_tbc = true
		end
	end

	::begin_command::
	local weapons = entity.get_player_weapon(localplayer)
	local ready_to_shift = client_get_can_exploit(localplayer, weapons, 13)
	local weapon_ready = client_get_can_exploit(localplayer, weapons, math.abs(- 1 - next_shift_amount))
	if ready_to_shift == true or weapon_ready == false and cmove.did_shift_before == true then
		next_shift_amount = 13
	else
		next_shift_amount = 0
	end

	local tickbase = entity.get_prop(localplayer, "m_nTickBase")
	if cmove.old_tickbase ~= 0 and tickbase < cmove.old_tickbase then
		if cmove.old_tickbase-tickbase > 11 then
			cmove.skip_next_differ = true
			cmove.charged_before = false
			cmove.can_shift_tickbase = false
		end
	end

	local difference = e.command_number - cmove.old_command_num
	if difference >= 11 and difference <= ui.get(sv_urmaxticks) then
		cmove.can_shift_tickbase = not cmove.skip_next_differ
		cmove.charged_before = cmove.can_shift_tickbase
		cmove.last_charge = difference+1
		cmove.is_cmd_safe = difference > 3 and math.abs(ui.get(sv_urmaxticks) - difference) <= 3
		cmove.delay = math.abs(ui.get(sv_urmaxticks) - cmove.last_charge)
	end

	cmove.can_shift_tickbase = ready_to_shift == false and false or cmove.charged_before
	cmove.old_tickbase = tickbase
	cmove.old_command_num = e.command_number
	cmove.skip_next_differ = false
	cmove.did_shift_before = next_shift_amount ~= 0
	cmove.can_shift_tickbase = cmove.can_shift_tickbase and 2 or 0
	if cmove.can_shift_tickbase == 0 and cmove.charged_before == true then
		cmove.can_shift_tickbase = 1
	end

	if cmove.can_shift_tickbase == 0 then
		cmove.last_charge = 0
	end
end

http.get("https://gist.githubusercontent.com/Moderian-170707/e8002b86016036243c96a494593cba07/raw/25805289659cc389510269680b03fab957853a25/svg_icon", function(success, response)
	if not success or response.status ~= 200 then
		return
	end

	local images_lib = image_stuff()
	local images_icons = images_lib.load(loadstring(response.body)())
	_, height = client.screen_size()
	local pos_size = {20 ,height/2}
	local screen_x, screen_y = pos_size[1], pos_size[2]

local function renderer_indicator(e)
	ui.set_visible(indicator_types, ui.get(enabled_check_box))
	ui.set_visible(disabled_correct, ui.get(enabled_check_box))
	ui.set_visible(doubletap_types, ui.get(enabled_check_box))
	ui.set_visible(doubletap_speed, ui.get(enabled_check_box))
	ui.set_visible(air_types, ui.get(enabled_check_box) and ui.get(doubletap_types) == "Jumping")
	ui.set_visible(slow_types, ui.get(enabled_check_box) and ui.get(doubletap_types) == "Slow Walk")
	ui.set_visible(moving_types, ui.get(enabled_check_box) and ui.get(doubletap_types) == "Moving")
	ui.set_visible(custom_text, ui.get(enabled_check_box) and ui.get(indicator_types) == "Custom Text")
	ui.set_visible(crouch_types, ui.get(enabled_check_box) and ui.get(doubletap_types) == "Crouching")
	ui.set_visible(standing_types, ui.get(enabled_check_box) and ui.get(doubletap_types) == "Standing")
	ui.set_visible(dt_active_color, ui.get(enabled_check_box) and ui.get(indicator_types) == "YuDi.Lua Presets" or ui.get(enabled_check_box) and ui.get(indicator_types) == "Custom Text")
	ui.set_visible(draw_circle, ui.get(enabled_check_box) and ui.get(indicator_types) == "YuDi.Lua Presets" or ui.get(enabled_check_box) and ui.get(indicator_types) == "Custom Text")

	local local_player = entity.get_local_player()
	local local_weapon = entity.get_player_weapon(local_player)
	local weapons_id = entity.get_prop(local_weapon, "m_iItemDefinitionIndex") or 0
	local weapons_item = weapons_id and bit.band(weapons_id, 0xFFFF) or 0
	local exploit_can = client_get_can_exploit(local_player, local_weapon, 13)
	local weapons_name = weapon_names[weapons_item] or ""

	if not ui.get(enabled_check_box) or not entity.is_alive(local_player) or not ui.get(double_tap) or not ui.get(dt_hotkey) then
		return
	end

	if ui.get(disabled_correct) then
		cvar["cl_clock_correction"]:set_int(0)
		cvar["cl_clock_correction_adjustment_max_amount"]:set_int(0)
		cvar["cl_clock_correction_adjustment_max_offset"]:set_int(0)
		cvar["cl_clock_correction_adjustment_min_offset"]:set_int(0)
		cvar["cl_clock_correction_force_server_tick"]:set_int(0)
		cvar["cl_clockdrift_max_ms"]:set_int(0)
	elseif not ui.get(disabled_correct) then
		cvar["cl_clock_correction"]:set_int(1)
		cvar["cl_clock_correction_adjustment_max_amount"]:set_int(200)
		cvar["cl_clock_correction_adjustment_max_offset"]:set_int(90)
		cvar["cl_clock_correction_adjustment_min_offset"]:set_int(10)
		cvar["cl_clock_correction_force_server_tick"]:set_int(999)
		cvar["cl_clockdrift_max_ms"]:set_int(150)
	end

	local vx, vy, vz = entity.get_prop(local_player, "m_vecVelocity")
	local velocity_speed = math.sqrt((vx * vx) + (vy * vy))
	local onground = (bit.band(entity.get_prop(local_player, "m_fFlags"), 1) == 1)
	local infiniteduck = (bit.band(entity.get_prop(local_player, "m_fFlags"), 2) == 2)
	local slowwalking = ui.get(slow_walk) and ui.get(slow_hotkey)

	if velocity_speed < 5 and not slowwalking and onground and not infiniteduck then 
		ui.set(double_tap_mode, ui.get(standing_types))
		ui.set(lower_body, "Eye yaw")
	elseif velocity_speed > 2 and not slowwalking and onground and not infiniteduck then
		ui.set(double_tap_mode, ui.get(moving_types))
	elseif velocity_speed > 2 and slowwalking and onground and not infiniteduck then
		ui.set(double_tap_mode, ui.get(slow_types))
	elseif onground and infiniteduck then
		ui.set(double_tap_mode, ui.get(crouch_types))
	elseif not onground then
		ui.set(double_tap_mode, ui.get(air_types))
	end

	if ui.get(doubletap_speed) == "Safety Speed" then
		ui.set(sv_urmaxticks, 17)
		ui.set(doubletap_lag, 1)
	elseif ui.get(doubletap_speed) == "Faster Speed" then
		ui.set(sv_urmaxticks, 18)
		ui.set(doubletap_lag, 1)
	elseif ui.get(doubletap_speed) == "1 Ticks Faster Speed" then
		ui.set(sv_urmaxticks, 19)
		ui.set(doubletap_lag, 1)
	elseif ui.get(doubletap_speed) == "Adaptive Speed" then
		ui.set(sv_urmaxticks, cmove.is_cmd_safe and 19 or 18)
		ui.set(doubletap_lag, cmove.is_cmd_safe and 1 or 2)
	end

	if ui.get(indicator_types) == "Off" then
		return
	end

	local color_r, color_g, color_b, color_a = ui.get(dt_active_color)
	local color_r_2, color_g_2, color_b_2, color_a_2 = ui.get(dt_active_color)
	if not exploit_can or not ui.get(double_tap) or not ui.get(dt_hotkey) or ui.get(fakeduck) then
		color_r, color_g, color_b = 150,150,150
		normal_alpha = normal_alpha - 22.6
		maximum_alpha = maximum_alpha - 22.6
		if normal_alpha < 46 then
			normal_alpha = 46
		end
	else
		if normal_alpha < color_a then
			if normal_alpha < 30 or maximum_alpha < 0 then
				normal_alpha = 46
				maximum_alpha = 0
			end

			normal_alpha = normal_alpha + 22.6
			maximum_alpha = maximum_alpha + 22.6
		end

		local _, _, _, color_a = 0,255,255,255
	end

	local x, y = hk_dragger:get()
	local global_text = string.format("DT [%s] | Tickbase(v): %s", ui.get(indicator_types) == "YuDi.Lua Presets" and "YuDi.Lua Doubletap" or ui.get(custom_text), ui.get(fakeduck) and "Off" or cmove.last_charge >= 16 and "YuDi.Lua" or cmove.last_charge)
	local h, w = 17, renderer.measure_text(nil, global_text) + 8
	renderer.rectangle(x - 1, y - 2, w + 1, 2, cmove.last_charge <= 15 and 255 or color_r, cmove.last_charge <= 15 and 167 or color_g, cmove.last_charge <= 15 and 38 or color_b, cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or color_a)
	renderer.rectangle(x - 1, y - 2, maximum_alpha / 226 * w + 1 <= 0.01 and 0 or maximum_alpha / 226 * w + 1, 2, color_r_2, color_g_2, color_b_2, cmove.last_charge >= 16 and color_a_2 or 0)
	renderer.rectangle(x-1, y, w+1, h, 0, 0, 0, 80)
	renderer.text(x+4, y + 2, 255, 255, 255, 255, "", 0, global_text)
	local stripped = weapons_name:gsub("weapon_", ""):gsub("item_", "")
	images_icons[stripped]:draw(x, y + h + 6, nil, 16, 255, 255, 255, ui.get(fakeduck) and 150 or exploit_can and 255 or 150)
	local width = images_icons[stripped]:measure()
	local widthb = images_icons["icon_headshot"]:measure()
	hk_dragger:drag(w, h*1.1)

	if contains(weapons.shots_2, weapons_id) then
		images_icons["bullet"]:draw(x + width / 2 + 7, y + h + 7, nil, 16, 255, 255, 255, ui.get(fakeduck) and 150 or cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
		images_icons["bullet"]:draw(x + width / 2 + widthb / 2 + 10, y + h + 7, nil, 16, 255, 255, 255, cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
	elseif contains(weapons.shots_1, weapons_id) then
		images_icons["icon_headshot"]:draw(x + width / 2 + 7, y + h + 7, nil, 16, 255, 255, 255, ui.get(fakeduck) and 150 or cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
	elseif contains(weapons.shots_3, weapons_id) then
		images_icons["bullet"]:draw(x + width / 2 + 7, y + h + 7, nil, 16, 255, 255, 255, ui.get(fakeduck) and 150 or cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
		images_icons["bullet"]:draw(x + width / 2 + widthb / 2 + 10, y + h + 7, nil, 16, 255, 255, 255, cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
		images_icons["bullet"]:draw(x + width / 2 + widthb / 2 + 10 + widthb / 2, y + h + 7, nil, 16, 255, 255, 255, cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
	elseif contains(weapons.shots_4, weapons_id) then
		images_icons["bullet"]:draw(x + width / 2 + 7, y + h + 7, nil, 16, 255, 255, 255, ui.get(fakeduck) and 150 or cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
		images_icons["bullet"]:draw(x + width / 2 + widthb / 2 + 10, y + h + 7, nil, 16, 255, 255, 255, cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
		images_icons["bullet"]:draw(x + width / 2 + widthb / 2 + 10 + widthb / 2 , y + h + 7, nil, 16, 255, 255, 255, cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
		images_icons["bullet"]:draw(x + width / 2 + widthb / 2 + 10 + widthb / 2 + widthb / 2, y + h + 7, nil, 16, 255, 255, 255, cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
	else
		images_icons["bullet"]:draw(x + width / 2 + 6, y + h + 6, nil, 16, 255, 255, 255, ui.get(fakeduck) and 150 or cmove.last_charge <= 15 and 1 + math.sin(math.abs(-math.pi + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 200 or maximum_alpha / 226 * 255)
	end
		renderer.circle_outline(x + 165, y + 32.5, 0, 0, 0, ui.get(draw_circle) and exploit_can and 255 or 0 or 0, 8.5, 1, maximum_alpha / 226 * 1, 6)
		renderer.circle_outline(x + 165, y + 32.5, 89, 119, 239, ui.get(draw_circle) and exploit_can and 255 or 0 or 0, 7.5, 1, maximum_alpha / 226 * 1, 3.5)
end

	client.set_event_callback("predict_command", exploit_crooked)
	client.set_event_callback("paint", renderer_indicator)
end)