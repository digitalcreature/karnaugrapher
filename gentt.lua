#!/usr/bin/env lua

math.randomseed(tonumber(arg[1]) or os.time())
incount = math.random(3, 5)
outcount = math.random(3, 5)
print(("abcdefghijk"):sub(1, incount))
print(("ABCDEFGHIJK"):sub(1, outcount))
for r = 1, math.pow(2, incount) do
	for o = 1, outcount do
		io.write(math.random(0, 1))
	end
	print()
end
