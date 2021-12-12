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

/**
 * CDN Link Scripts
 */
const branchArray = ["release", "rc", "dev"];
const osArray = ["x64_win32", "x64_linux"];

document.getElementById("CDN_Link_Generator-interface").innerHTML = generateInterface();

function generateInterface()
{
	let interfaceStr = "";

	interfaceStr += "<div><select name='branch' id='branch'>";
	for(let i=0; i < branchArray.length; i++)
	{
		interfaceStr += "<option value='" + i + "'>" + branchArray[i] + "</option>"
	}
	interfaceStr += "</select></div>";

	interfaceStr += "<div><select name='os' id='os'>";
	for(let i=0; i < osArray.length; i++)
	{
		interfaceStr += "<option value='" + i + "'>" + osArray[i] + "</option>"
	}
	interfaceStr += "</select></div>";

	interfaceStr += "<div><input type='checkbox' id='server' name='server' value='server'><label for='server'>server</label></div>";
	interfaceStr += "<div><input type='checkbox' id='voice' name='voice' value='voice'><label for='voice'>voice</label></div>";
	interfaceStr += "<div><input type='checkbox' id='csharp' name='csharp' value='csharp'><label for='csharp'>csharp-module</label></div>";
	interfaceStr += "<div><input type='checkbox' id='javascript' name='javascript' value='javascript'><label for='javascript'>js-module</label></div>";
	interfaceStr += "<div><input type='checkbox' id='update' name='update' value='update'><label for='update'>update.json</label></div>";

	interfaceStr += "<div><button id='generate' onclick='generate()'>Generate Links</button></div>";

	interfaceStr += "</br>";

	return interfaceStr;
}

function generate()
{
	let branch = document.getElementById("branch").value;
	let os = document.getElementById("os").value;
	let update = document.getElementById("update").checked;
	let server = document.getElementById("server").checked;
	let voice = document.getElementById("voice").checked;
	let csharp = document.getElementById("csharp").checked;
	let javascript = document.getElementById("javascript").checked;

	document.getElementById("CDN_Link_Generator-links").innerHTML = generateLinks([server, voice, csharp, javascript],branch,os,update);
}

function generateLinks(selection, branchIndex, osIndex, listUpdate)
{
	let returnStr = "";
	returnStr += "<pre>";

	if(selection[0])
		returnStr += generateServerLinks(branchIndex, osIndex, listUpdate);

	if(selection[1])
		returnStr += generateVoiceServerLinks(branchIndex, osIndex, listUpdate);

	if(selection[2])
		returnStr += generateCSLinks(branchIndex, osIndex, listUpdate);

	if(selection[3])
		returnStr += generateJSLinks(branchIndex, osIndex, listUpdate);

	if(!selection[0] && !selection[1] && !selection[2] && !selection[3])
		returnStr += "You didn't select any components :(";

	returnStr += "</pre>";

	return returnStr;
}

function generateServerLinks(branchIndex, osIndex, listUpdate)
{
	let returnStr = "";

	if(listUpdate)
		returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>"

	if(osIndex == 0)
        returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/altv-server.exe</br>";
	else
        returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/altv-server</br>";

    returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/data/vehmodels.bin</br>";
    returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/data/vehmods.bin</br>"
    returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/data/clothes.bin</br>"

	return returnStr;
}

function generateVoiceServerLinks(branchIndex, osIndex, listUpdate)
{
    let returnStr = "";

    if(listUpdate)
        returnStr += "https://cdn.altv.mp/voice-server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>";

    if(osIndex == 0)
		returnStr += "https://cdn.altv.mp/voice-server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/altv-voice-server.exe</br>";
    else
        returnStr += "https://cdn.altv.mp/voice-server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/altv-voice-server</br>";

    return returnStr;
}

function generateCSLinks(branchIndex, osIndex, listUpdate)
{
    let returnStr = "";

    if(listUpdate)
        returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>";

    returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/AltV.Net.Host.dll</br>";
    returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/AltV.Net.Host.runtimeconfig.json</br>";

    if(osIndex == 0)
        returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/csharp-module.dll</br>";
    else
        returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/libcsharp-module.so</br>";

    return returnStr;
}

function generateJSLinks(branchIndex, osIndex, listUpdate)
{
	let returnStr = "";

    if(listUpdate)
        returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>";

    if(osIndex == 0)
        returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-module/libnode.dll</br>";
    else
        returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-module/libnode.so.83</br>";

	if(osIndex == 0)
		returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-module/js-module.dll</br>";
    else
        returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-module/libjs-module.so</br>";

    return returnStr;
}