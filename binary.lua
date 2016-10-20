binary = {}

--return o'th order bit in integer n
function binary.bit(n, o)
	local pow = math.pow(2, o)
	return (n % pow) >= (pow / 2)
end

local function highestorder(n)
	local o = 0;
	while math.pow(2, o) <= n do
		o = o + 1
	end
	return o
end

function binary.bits(n, o)
	o = o or highestorder(n)
	if o > 0 then
		return binary.bit(n, o), binary.bits(n, o - 1)
	end
end
