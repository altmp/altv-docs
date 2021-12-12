function joaat(s) {
	const k = s.toLowerCase();
	let h, i;

	for (h = i = 0; i < k.length; i++) {
		h += k.charCodeAt(i);
		h += (h << 10);
		h ^= (h >>> 6);
	}

	h += (h << 3);
	h ^= (h >>> 11);
	h += (h << 15);

	return (h >>> 0);
}

function toHex(n){
	let h = n.toString(16);
	return "0x" + h.toUpperCase();
}

function modulo(a, b)
{
    return a - Math.floor(a/b)*b;
}

function ToInteger(x) {
    x = Number(x);
    return x < 0 ? Math.ceil(x) : Math.floor(x);
}

function ToUint32(x)
{
    return modulo(ToInteger(x), Math.pow(2, 32));
}

function ToInt32(x)
{
    let uint32 = ToUint32(x);

    if (uint32 >= Math.pow(2, 31))
        return uint32 - Math.pow(2, 32)

    return uint32;
}