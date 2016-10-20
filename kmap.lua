require "truthtable"
require "binary"

kmap = {}

local empty = {}

local function tree(d, p)
	if d > 0 then
		p = p or {}
		p[true] = {}
		tree(d - 1, p[true])
		p[false] = {}
		tree(d - 1, p[false])
		return p
	end
end

local function treeget(t, k, ...)
	if k ~= nil then
		return treeget(t[k], ...)
	else
		return t
	end
end

local function treeset(t, v, k1, k2, ...)
	if k2 ~= nil then
		treeset(t[k1], v, k2, ...)
	else
		t[k1] = v
	end
end

function kmap.build(tt)
	local km = tree(#tt.inputs - 1)
	for r = 0, math.pow(2, #tt.inputs) - 1 do
		local map = {}
		treeset(km, map, binary.bits(r, #tt.inputs))
		for _, output in ipairs(tt.outputs) do
			map[output] = tt[r][output]
		end
	end
	tt.kmap = km
	return km
end
