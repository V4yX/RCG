function RandomCharTable()
	local charTable = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

	if math.random(1, 2) == 2 then
		return charTable:lower()
	end

	return charTable
end

function GetNumberTable(str: string)
	local strLength = #str
	local resultTable = {}

	for i = strLength, 1, -2 do
		table.insert(resultTable, string.sub(str, math.max(i - 1, 1), i))
	end

	local result = {}

	for i = #resultTable, 1, -1 do
		table.insert(result, resultTable[i])
	end

	return result
end

function GetNumbersBySize(n: number, s: number)
	if #tostring(1) > 1 then return 0 end
	local r = ''

	for i = 1, s, 1 do
		r = r..n
	end

	return tonumber(r)
end

function RandomCodeGenerator(brackets: boolean?)
	local currentTick = tick()

	local t = GetNumberTable(string.sub(tostring(currentTick), 1, 10))

	local m = math.random()
	local u = GetNumberTable(string.sub(tostring(m), 3, #tostring(m)))

	local v = math.random(111111, 999999)

	local task1 = {}

	for i,v in t do

		local charTable = RandomCharTable()

		table.insert(task1, string.sub(charTable, math.floor(v * 1.5) % #charTable, math.floor(v * 1.5) % #charTable))
	end

	local task2 = {}

	for i,v in u do
		local charTable = RandomCharTable()

		table.insert(task2, string.sub(charTable, math.floor(v * 1.5) % #charTable, math.floor(v * 1.5) % #charTable))
	end

	local k = `{table.concat(task2)}.{table.concat(task1)}.{v}`

	if brackets then
		return '{'..k..'}'
	end

	return k
end

print(RandomCodeGenerator(false)) -- xxxxxxxx.xxxxx.000000
