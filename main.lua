require "truthtable"
require "kmap"

local tt = truthtable.load(io.stdin)
truthtable.display(tt, {
	[true] = "X",
	[false] = "-",
})

local km = kmap.build(tt, "S")

local function f(km, d)
	d = d or 0
	local indent = (" "):rep(d)
	for k, v in pairs(km) do
		io.write(indent..tostring(k))
		if type(v) == "table" then
			print()
			f(v, d + 1)
		else
			print(" "..tostring(v))
		end
	end
end

f(km)
