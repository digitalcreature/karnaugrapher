require "truthtable"

local tt = truthtable.load(io.stdin)
truthtable.display(tt, {
	[true] = "X",
	[false] = "-",
})
