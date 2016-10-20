truthtable = {}

function truthtable.load(file)
	print("LOADING TRUTH TABLE")
	local lines = file:lines()
	local t = {
		inputs = {add = table.insert},
		outputs = {add = table.insert},
	}
	for c in lines():gmatch("(%w)") do
		t.inputs:add(c)
		io.write(" "..c.." ")
	end
	io.write(" | ")
	for c in lines():gmatch("(%w)") do
		t.outputs:add(c)
		io.write(" "..c.." ")
	end
	print()
	print(string.rep("---", #t.inputs).."-+-"..string.rep("---", #t.outputs))
	t.rowcount = math.pow(2, #t.inputs)
	for r = 0, t.rowcount do
		local line = lines() or string.rep("0", #t.outputs)
		if r == t.rowcount then break end
		local row = {}
		local n = r
		for i, input in ipairs(t.inputs) do
			i = #t.inputs - i
			local pow = math.pow(2, i + 1)
			io.write(" "..((n % pow) < (pow / 2) and "0" or "1").." ")
		end
		io.write(" | ")
		for o, output in ipairs(t.outputs) do
			row[output] = not line:sub(o, o):match("[ 0]")
			io.write(" "..(row[output] and "1" or "0").." ")
		end
		print()
		t[r] = row
		r = r + 1
	end
end
