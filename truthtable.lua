require "binary"

truthtable = {}

function truthtable.load(file)
	local lines = file:lines()
	local tt = {
		inputs = {add = table.insert},
		outputs = {add = table.insert},
	}
	for c in lines():gmatch("(%w)") do
		tt.inputs:add(c)
	end
	for c in lines():gmatch("(%w)") do
		tt.outputs:add(c)
	end
	tt.rowcount = math.pow(2, #tt.inputs)
	for r = 0, tt.rowcount - 1 do
		local line = lines() or string.rep("0", #tt.outputs)
		local row = {}
		local n = r
		for i, input in ipairs(tt.inputs) do
			i = #tt.inputs - i
			local pow = math.pow(2, i + 1)
		end
		for o, output in ipairs(tt.outputs) do
			row[output] = not line:sub(o, o):match("[ 0]")
		end
		tt[r] = row
	end
	return tt
end

function truthtable.display(tt, s)
	local symbols = {
		[false] = "0",
		[true] = "1",
		hdiv = "---",
		vdiv = " | ",
		cdiv = "-+-",
	}
	for k, v in pairs(symbols) do
		symbols[k] = s[k] or symbols[k]
	end
	s = symbols
	for _, c in ipairs(tt.inputs) do
		io.write(" "..c.." ")
	end
	io.write(tostring	(s.vdiv))
	for _, c in ipairs(tt.outputs) do
		io.write(" "..c.." ")
	end
	print()
	print(
		string.rep(tostring(s.hdiv), #tt.inputs)
		..tostring(s.cdiv)
		..string.rep(tostring(s.hdiv), #tt.outputs)
	)
	tt.rowcount = math.pow(2, #tt.inputs)
	for r = 0, tt.rowcount - 1 do
		local n = r
		for i, input in ipairs(tt.inputs) do
			i = #tt.inputs - i
			local pow = math.pow(2, i + 1)
			io.write(" "..tostring(s[binary.bit(n, i)]).." ")
		end
		io.write(tostring(s.vdiv))
		for o, output in ipairs(tt.outputs) do
			local row = tt[r]
			io.write(" "..tostring(s[row and row[output]]).." ")
		end
		print()
		tt[r] = row
	end
end
