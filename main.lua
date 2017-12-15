function love.load()
	TileSet = love.graphics.newImage('res/countryside.png')
	tileW, tileH = 32, 32
	local tileSetW, tileSetH = TileSet:getWidth(), TileSet:getHeight()
	
	-- Quads = {}
	-- Quads[1] = love.graphics.newQuad(0,   0, tileW, tileH, tileSetW, tileSetH)
	-- Quads[2] = love.graphics.newQuad(32,  0, tileW, tileH, tileSetW, tileSetH)
	-- Quads[3] = love.graphics.newQuad(0,  32, tileW, tileH, tileSetW, tileSetH)
	-- Quads[4] = love.graphics.newQuad(32, 32, tileW, tileH, tileSetW, tileSetH)
	--[[		1 grass
		2 box 
		3 flower
		4 boxtop
	]]
	TileTable = {
		{4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4},
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 4},
		{4, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 4},
		{4, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4},
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4},
		{4, 1, 1, 4, 1, 1, 1, 1, 1, 2, 2, 1, 1, 4, 1, 1, 1, 4, 1, 4, 2, 2, 1, 1, 4},
		{4, 1, 1, 4, 1, 1, 1, 1, 4, 3, 3, 4, 1, 2, 1, 1, 1, 2, 1, 4, 1, 1, 1, 1, 4},
		{4, 1, 1, 4, 1, 1, 1, 1, 4, 3, 3, 4, 1, 1, 4, 1, 4, 1, 1, 4, 2, 2, 1, 1, 4},
		{4, 1, 1, 4, 1, 1, 1, 1, 4, 3, 3, 4, 1, 1, 2, 1, 2, 1, 1, 4, 1, 1, 1, 1, 4},		
		{4, 1, 1, 4, 1, 1, 1, 1, 2, 3, 3, 2, 1, 1, 1, 4, 1, 1, 1, 4, 1, 1, 1, 1, 4},
		{4, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 3, 1, 2, 2, 2, 1, 1, 4},
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4},
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 2, 4, 1, 1, 1, 1, 1, 1, 1, 4},
		{4, 1, 1, 1, 1, 1, 1, 1, 4, 3, 4, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4},
		{4, 1, 1, 3, 1, 1, 1, 1, 2, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 4},
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 3, 1, 4},
		{4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4},
		{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
	}
	
	
	
	local quadInfos = {
		{' ',  0,  0},  -- 1 grass
		{'#', 32,  0},  -- 2 box
		{'*',  0, 32},  -- 3 flower
		{'^', 32, 32},  -- 4 boxTop
	}
	
	-- Quads = {}
	-- for i, info in ipairs(quadInfos) do
		-- Quads[i] = love.graphics.newQuad(info[1], info[2], tileW, tileH, tileSetW, tileSetH)
	-- end
	
	Quads = {}
	for _, info in ipairs(quadInfos) do
		Quads[info[1]] = love.graphics.newQuad(info[2], info[3], tileW, tileH, tileSetW, tileSetH)
	end
	
	tileString = [[
^#######################^
^                    *  ^
^  *                    ^
^              *        ^
^                       ^
^    ##  ^##  ^## ^ ^   ^
^   ^  ^ ^  ^ ^   ^ ^   ^
^   ^  ^ ^ *# ^   ^ ^   ^
^   ^  ^ ^##  ^## # #   ^
^   ^  ^ ^  ^ ^    ^  * ^
^ * ^  ^ ^  ^ ^    ^    ^
^   #  # ^* # ^  * ^    ^
^    ##  ###  ###  #    ^
^                       ^
^   *****************   ^
^                       ^
^  *                  * ^
#########################
]]
	TileTable = {}
	local width = #tileString:gmatch("[^\n]+")
	for x = 1, width, 1 do TileTable[x] = {} end
	
	local rowIndex, columnIndex = 1, 1
	for row in tileString:gmatch("[^\n]") do
		assert(#row == width, 'Map not align')
		columnIndex = 1
		for character in row:gmatch(".") do 
			TileTable[columnIndex][rowIndex] = character
			columnIndex = columnIndex + 1
		end
		rowIndex = rowIndex + 1
	end
	
end

function love.update(dt)
end

function love.draw()
	for rowIndex = 1, #TileTable do
		local row = TileTable[rowIndex]
		for columnIndex = 1, #row do
			local number = row[columnIndex]
			love.graphics.draw(TileSet, Quads[number],(columnIndex - 1) * tileW,(rowIndex - 1) * tileH)
		end
	end
end 