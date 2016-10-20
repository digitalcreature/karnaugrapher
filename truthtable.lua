truthtable = {}

function truthtable.load(file)
	local lines = file:lines()
	local t = {
		inputs = {add = table.insert},
		outputs = {add = table.insert},
	}
	for c in lines():gmatch("(%w)") do
		t.inputs:add(c)
	end
	for c in lines():gmatch("(%w)") do
		t.outputs:add(c)
	end
	t.rowcount = math.pow(2, #t.inputs)
	for r = 0, t.rowcount - 1 do
		local line = lines() or string.rep("0", #t.outputs)
		local row = {}
		local n = r
		for i, input in ipairs(t.inputs) do
			i = #t.inputs - i
			local pow = math.pow(2, i + 1)
		end
		for o, output in ipairs(t.outputs) do
			row[output] = not line:sub(o, o):match("[ 0]")
		end
		t[r] = row
	end
	return t
end

function truthtable.display(t, s)
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
	for _, c in ipairs(t.inputs) do
		io.write(" "..c.." ")
	end
	io.write(tostring	(s.vdiv))
	for _, c in ipairs(t.outputs) do
		io.write(" "..c.." ")
	end
	print()
	print(
		string.rep(tostring(s.hdiv), #t.inputs)
		..tostring(s.cdiv)
		..string.rep(tostring(s.hdiv), #t.outputs)
	)
	t.rowcount = math.pow(2, #t.inputs)
	for r = 0, t.rowcount - 1 do
		local n = r
		for i, input in ipairs(t.inputs) do
			i = #t.inputs - i
			local pow = math.pow(2, i + 1)
			io.write(" "..tostring(s[(n % pow) >= (pow / 2)]).." ")
		end
		io.write(tostring(s.vdiv))
		for o, output in ipairs(t.outputs) do
			local row = t[r]
			io.write(" "..tostring(s[row and row[output]]).." ")
		end
		print()
		t[r] = row
	end
end
