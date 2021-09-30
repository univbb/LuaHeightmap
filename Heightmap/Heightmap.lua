--[[
	@author univb
	@since July 16th, 2021

	@desc 2D Heightmap class

	@constructor
	-- Heightmap.new(frequency: Number, size: Number: seed: Number)

	@methods
	-- Heightmap:Repeat(): Table
	-- Heightmap:Get(): Table
]]
-- * Class
local Heightmap = {}
Heightmap.__index = Heightmap


function Heightmap.new(frequency, x, y, seed)
	local self = setmetatable({
		Frequency = frequency,
		X = x,
		Y = y,
		Seed = seed
	}, Heightmap)

	self:_generate()

	return self
end


function Heightmap:Get()
	return self._heightmap
end


function Heightmap:Repeat()
	self:_generate()

	return self:Get()
end


function Heightmap:_generate()
	self._heightmap = {}
	for x = 1, self.X, 1 do
		local hx = {}
		self._heightmap[x] = hx
		for z = 1, self.Y, 1 do
			local y = math.noise((x + self.Seed) / self.Frequency, (z + self.Seed) / self.Frequency)

			hx[z] = math.clamp(y + 0.5, 0, 1)
		end
	end
end


return Heightmap
