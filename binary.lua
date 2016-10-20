binary = {}

--return o'th order bit in integer n
function binary.bit(n, o)
	local pow = math.pow(2, o + 1)
	return (n % pow) >= (pow / 2)
end
