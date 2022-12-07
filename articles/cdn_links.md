# CDN Links

Here you can find the CDN-Links(=Content Delivery Network) for the alt:V files. It's recommended to use the [Downloads-Page](https://altv.mp/#/downloads) where the files get automatically bundled for you.

Valid values for ${BRANCH} are: **release**, **rc** and **dev**.

update.json file contains build number, file locations and sha1 hashes.

## Link Generator

<p>You can also use this Generate to create the needed links, just select the components you need and if you need the links for the update.json.
<div id="CDN_Link_Generator-interface" style="display: flex; justify-content: space-between; max-width: 800px;"> </div>
</br>
<div id="CDN_Link_Generator-links"> </div>

<style>
label {
    display: block;
}
</style>
<script>
    const branchArray = ["release", "rc", "dev"];
    const osArray = ["x64_win32", "x64_linux"];

    document.getElementById("CDN_Link_Generator-interface").innerHTML = generateInterface();

    /**
     * @returns {string}
     */
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
        interfaceStr += "<div><input type='checkbox' id='js-bytecode' name='js-bytecode' value='js-bytecode'><label for='js-bytecode'>js-bytecode-module</label></div>";
        interfaceStr += "<div><input type='checkbox' id='update' name='update' value='update'><label for='update'>update.json</label></div>";

        interfaceStr += "<div><button id='generate' onclick='generate()'>Generate Links</button></div>";

        interfaceStr += "</br>";

        return interfaceStr;
    }

    /**
     * @returns {void}
     */
    function generate()
    {
        let branch = Number.parseInt(document.getElementById("branch").value, 10);
        let os = Number.parseInt(document.getElementById("os").value, 10);
        let update = document.getElementById("update").checked;
        let server = document.getElementById("server").checked;
        let voice = document.getElementById("voice").checked;
        let csharp = document.getElementById("csharp").checked;
        let javascript = document.getElementById("javascript").checked;
        let bytecodeModule = document.getElementById("js-bytecode").checked;

        document.getElementById("CDN_Link_Generator-links").innerHTML = generateLinks([server, voice, csharp, javascript, bytecodeModule],branch,os,update);
    }

    /**
     * @param {boolean[]} selection
     * @param {number} branchIndex
     * @param {number} osIndex
     * @param {boolean} listUpdate
     * @returns {string}
     */
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

        if (selection[4]) {
            returnStr += generateJSBytecodeLinks(branchIndex, osIndex, listUpdate);
        }

        if(!selection[0] && !selection[1] && !selection[2] && !selection[3] && !selection[4])
            returnStr += "You didn't select any components :(";

        returnStr += "<\/pre>";

        return returnStr;
    }

    /**
     * @param {number} branchIndex
     * @param {number} osIndex
     * @param {boolean} listUpdate
     * @returns {string}
     */
    function generateServerLinks(branchIndex, osIndex, listUpdate)
    {
        let returnStr = "";

        if(listUpdate)
            returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>"
            returnStr += "https://cdn.altv.mp/data/" + branchArray[branchIndex] + "/update.json</br>"

        if(osIndex === 0)
            returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/altv-server.exe</br>";
        else
            returnStr += "https://cdn.altv.mp/server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/altv-server</br>";

        returnStr += "https://cdn.altv.mp/data/" + branchArray[branchIndex] + "/data/vehmodels.bin</br>";
        returnStr += "https://cdn.altv.mp/data/" + branchArray[branchIndex] + "/data/vehmods.bin</br>"
        returnStr += "https://cdn.altv.mp/data/" + branchArray[branchIndex] + "/data/clothes.bin</br>"
        returnStr += "https://cdn.altv.mp/data/" + branchArray[branchIndex] + "/data/pedmodels.bin</br>"

        return returnStr;
    }

    /**
     * @param {number} branchIndex
     * @param {number} osIndex
     * @param {boolean} listUpdate
     * @returns {string}
     */
    function generateVoiceServerLinks(branchIndex, osIndex, listUpdate)
    {
        let returnStr = "";

        if(listUpdate)
            returnStr += "https://cdn.altv.mp/voice-server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>";

        if(osIndex === 0)
            returnStr += "https://cdn.altv.mp/voice-server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/altv-voice-server.exe</br>";
        else
            returnStr += "https://cdn.altv.mp/voice-server/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/altv-voice-server</br>";

        return returnStr;
    }

    /**
     * @param {number} branchIndex
     * @param {number} osIndex
     * @param {boolean} listUpdate
     * @returns {string}
     */
    function generateCSLinks(branchIndex, osIndex, listUpdate)
    {
        let returnStr = "";

        if(listUpdate)
            returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>";

        returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/AltV.Net.Host.dll</br>";
        returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/AltV.Net.Host.runtimeconfig.json</br>";

        if(osIndex === 0)
            returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/csharp-module.dll</br>";
        else
            returnStr += "https://cdn.altv.mp/coreclr-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/libcsharp-module.so</br>";

        return returnStr;
    }

    /**
     * @param {number} branchIndex
     * @param {number} osIndex
     * @param {boolean} listUpdate
     * @returns {string}
     */
    function generateJSLinks(branchIndex, osIndex, listUpdate)
    {
        let returnStr = "";

        if(listUpdate)
            returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>";

        if(osIndex === 0)
            returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-module/libnode.dll</br>";
        else
            returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-module/libnode.so.102</br>";

        if(osIndex === 0)
            returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-module/js-module.dll</br>";
        else
            returnStr += "https://cdn.altv.mp/js-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-module/libjs-module.so</br>";

        return returnStr;
    }

    /**
     * @param {number} branchIndex
     * @param {number} osIndex
     * @param {boolean} listUpdate
     * @returns {string}
     */
    function generateJSBytecodeLinks(branchIndex, osIndex, listUpdate)
    {
        let returnStr = "";

        if(listUpdate)
            returnStr += "https://cdn.altv.mp/js-bytecode-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/update.json</br>";

        if(osIndex === 0)
            returnStr += "https://cdn.altv.mp/js-bytecode-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/js-bytecode-module.dll</br>";
        else
            returnStr += "https://cdn.altv.mp/js-bytecode-module/" + branchArray[branchIndex] + "/" + osArray[osIndex] + "/modules/libjs-bytecode-module.so</br>";

        return returnStr;
    }
</script>
## Linux Server

CoreClr/C# Module
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/update.json
>https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/AltV.Net.Host.dll
>https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/AltV.Net.Host.runtimeconfig.json
>https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/modules/libcsharp-module.so
>```

JS Module
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/update.json
>https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libjs-module.so
>https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libnode.so.102
>```

JS Bytecode Module
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/js-bytecode-module/${BRANCH}/x64_linux/update.json
>https://cdn.altv.mp/js-bytecode-module/${BRANCH}/x64_linux/modules/libjs-bytecode-module.so
>```

Voice Server
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/voice-server/${BRANCH}/x64_linux/update.json
>https://cdn.altv.mp/voice-server/${BRANCH}/x64_linux/altv-voice-server
>```

Server
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/server/${BRANCH}/x64_linux/update.json
>https://cdn.altv.mp/server/${BRANCH}/x64_linux/altv-server
>https://cdn.altv.mp/data/${BRANCH}/update.json
>https://cdn.altv.mp/data/${BRANCH}/data/vehmodels.bin
>https://cdn.altv.mp/data/${BRANCH}/data/vehmods.bin
>https://cdn.altv.mp/data/${BRANCH}/data/clothes.bin
>https://cdn.altv.mp/data/${BRANCH}/data/pedmodels.bin
>```

Other Stuff
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/others/server.cfg
>https://cdn.altv.mp/others/start.sh
>https://cdn.altv.mp/samples/resources.zip
>```

## Windows Server

CoreClr/C# Module
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_win32/update.json
>https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_win32/AltV.Net.Host.dll
>https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_win32/AltV.Net.Host.runtimeconfig.json
>https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_win32/modules/csharp-module.dll
>```

JS Module
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/js-module/${BRANCH}/x64_win32/update.json
>https://cdn.altv.mp/js-module/${BRANCH}/x64_win32/modules/js-module/js-module.dll
>https://cdn.altv.mp/js-module/${BRANCH}/x64_win32/modules/js-module/libnode.dll
>```

JS Bytecode Module
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/js-bytecode-module/${BRANCH}/x64_win32/update.json
>https://cdn.altv.mp/js-bytecode-module/${BRANCH}/x64_win32/modules/js-bytecode-module.dll
>```

Voice Server
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/voice-server/${BRANCH}/x64_win32/update.json
>https://cdn.altv.mp/voice-server/${BRANCH}/x64_win32/altv-voice-server.exe
>```

Server
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/server/${BRANCH}/x64_win32/update.json
>https://cdn.altv.mp/server/${BRANCH}/x64_win32/altv-server.exe
>https://cdn.altv.mp/data/${BRANCH}/update.json
>https://cdn.altv.mp/data/${BRANCH}/data/vehmodels.bin
>https://cdn.altv.mp/data/${BRANCH}/data/vehmods.bin
>https://cdn.altv.mp/data/${BRANCH}/data/clothes.bin
>https://cdn.altv.mp/data/${BRANCH}/data/pedmodels.bin
>```

Other Stuff
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/others/server.cfg
>https://cdn.altv.mp/others/start.sh
>https://cdn.altv.mp/samples/resources.zip
>```

## Client
> [!div class="nohljsln"]
>```yaml
>https://cdn.altv.mp/client/${BRANCH}/x64_win32/update.json
>https://cdn.altv.mp/client/${BRANCH}/x64_win32/altv.exe
>```