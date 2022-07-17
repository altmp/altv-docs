# Nametag example

This article deals with name tags as RmlUi example.
All used files for this example can be found in the following [repository](https://github.com/deluvas1911/altv-rml-example).

## Requirements

- Some code editor (for example Visual Studio Code)
- Basic knowledge of HTML & CSS
- A font file (.ttf)
- Empty resource with `Client` subfolder and `Client/main.js` as entry point

## Creating the rml document

> [!TIP]
> In this example `arialbd.ttf` is used as font, which can be found in the repository mentioned at the beginning.

Creating an Rml document is relatively simple and, except for the leading `<rml>` tag and the XHTML1 standard, is no different from creating an .html file.\
We create the file `index.rml` in the `Client` subfolder and add the following content there:

```html
<!-- For RmlUi documents we have to begin our html with the <rml> tag --> 
<rml>
    <!-- Everything else is simply html based on XHTML1 standard -->
    <head>
        <title>Demo</title>
        <style>
            body, #nametag-container {
                /* The font-family needs to be contained in the font file we will load later */
                font-family: arial;
                font-weight: bold;
                font-style: normal;
                font-weight: bold;

                width: 100%;
                height: 100%;
            }

            .nametag {
                position: absolute;
                font-effect: outline(1px black);
                color: #FFFFFFFF;
                width: auto;
                height: auto;
                text-align: center;
                font-size: 20dp;
            }

            .hide {
                display: none;
            }

        </style>
    </head>
    <body>
    <!-- This is the container we will use later in our client script -->
    <div id="nametag-container"></div>
    </body>
</rml>
```

## Creating the client script

> [!TIP]
> Although JavaScript is used in this example, it can also be used with C# and other modules.
> Further information can be found in the respective modules documentation.

After we have created our `index.rml` we create our script file named `main.js` in the same folder.\
In this file we put the following content, which will be described in more detail by the comments:

```js
import * as alt from "alt-client";
import * as native from "natives";

// ---------------- Config ----------------
// showVehicleIds: `true` vehicles will also have nametags containing their id
// showPlayerIds: `true` player nametags will contain the id
// showPlayerNames: `true` player nametags will contain their name
// checkLoS: `true` line of sight is required to draw the nametags
// dynamicSize: `true` size increases or decreases depending on the distance to the entity
// controlKey: `79` toggle key for activating or deactivating the rml controls. 79 is the O key
// 
// NOTE: For players either id, name or both settings have to be enabled, else there will no nametags be drawn

const showVehicleIds = true;
const showPlayerIds = true;
const showPlayerNames = true;
const checkLoS = true;
const dynamicSize = true;
const controlKey = 79;

// --------------- Prototype --------------
// We use a custom prototype on the RmlElement to quickly check if its currently drawn or not

alt.RmlElement.prototype.shown = false;

// ---------------- Script ----------------
// All the code. More detailed instructions will be included to the lines

// For rml you have to load the required font so it can be used
alt.loadRmlFont("/Client/arialbd.ttf", "arial", false, true);
// Creating a new rml document. This is similar to creating a new WebView
const document = new alt.RmlDocument("/Client/index.rml");
// We're storing the nametag-container for further usage, e.g. adding and removing nametags
const container = document.getElementByID("nametag-container");
// We use a map to simplify the mapping of entity and RmlElement
const nameTags = new Map();
// This variable will store the id of our everyTick, so we can disable it as soon as there are no nametags to draw
let tickHandle = undefined;

// We will use the gameEntityCreate event to add new nametags to our container
alt.on("gameEntityCreate", (entity) => {
    // Create a <button> html element and store it in the variable rmlElement
    const rmlElement = document.createElement("button");
    // Set the id property of the html element
    rmlElement.id = entity.id.toString();
    // Add our classes to apply stylings
    rmlElement.addClass("nametag");
    rmlElement.addClass("hide");

    // As setup in the config on the top, we will draw different nametags depending on the config
    // If no configuration applies for the entity type we will destroy the RmlElement
    if (entity instanceof alt.Player) {
        if (showPlayerIds && !showPlayerNames)
            rmlElement.innerRML = `ID: ${entity.id}`;
        else if (showPlayerIds && showPlayerNames)
            rmlElement.innerRML = `ID: ${entity.id} | Name: ${entity.name}`;
        else if (!showPlayerIds && showPlayerNames)
            rmlElement.innerRML = `Name: ${entity.name}`;
        else {
            rmlElement.destroy();
            return;
        }
    } else if (entity instanceof alt.Vehicle && showVehicleIds)
        rmlElement.innerRML = `ID: ${entity.id}`;
    else {
        rmlElement.destroy();
        return;
    }

    // Adding the RmlElement and Entity to our map
    nameTags.set(entity, rmlElement);
    // Adding the RmlElement to our RmlDocument. As soon as the class "hide" gets removed it will get drawn
    container.appendChild(rmlElement);
    // We subscribe the click event so we can print out the entity coordinates if we want to
    rmlElement.on("click", printCoordinates);

    // If there is already an everyTick active we can just return, else we will start our everyTick
    if (tickHandle !== undefined) return;
    tickHandle = alt.everyTick(drawMarkers);
});

// Same as gameEntityCreate event, but here we will remove the nametags
alt.on("gameEntityDestroy", (entity) => {
    // We get the rmlElement for the entity from our map
    const rmlElement = nameTags.get(entity);
    // If there's nothing found, e.g. because the creation conditions didn't matched we can just return here
    if (rmlElement === undefined) return;
    // Removing the RmlElement from the container...
    container.removeChild(rmlElement);
    // ... and ending its existence.
    rmlElement.destroy();

    // If there are no more nametags left we stop the everyTick to save performance
    if (tickHandle === undefined || nameTags.size > 0) return;
    alt.clearEveryTick(tickHandle);
    tickHandle = undefined;
});

// We use the keyup event to enable or disable the controls
alt.on("keyup", (key) => {
    // If the key isn't our control key we don't need any further processing
    if (key !== controlKey) return;

    // Getting the current control state
    const currentState = alt.rmlControlsEnabled();
    if (currentState) {
        // And disabling the controls if it's already enabled...
        alt.toggleGameControls(true);
        alt.showCursor(false);
        alt.toggleRmlControls(false);
    } else {
        // Or enable if it's disabled
        alt.toggleGameControls(false);
        alt.showCursor(true);
        alt.toggleRmlControls(true);
    }
});

// This function gets called from the click event
// The event args can be found in the rmlui documentation: https://mikke89.github.io/RmlUiDoc/pages/rml/events.html
function printCoordinates(rmlElement, eventArgs) {
    // Here we access the id we prior set to the rmlElement
    const entity = alt.Entity.getByID(parseInt(rmlElement.id));
    alt.log("Entity Position", "X", entity.pos.x, "Y", entity.pos.y, "Z", entity.pos.z);
}

// This function gets called from our everyTick
function drawMarkers() {
    // We loop through all entities in our map
    nameTags.forEach((rmlElement, entity) => {
        // Get their position
        const {x, y, z} = entity.pos;

        // Check if they're on the screen and optionally if line of sight check is enabled if there's nothing between us
        if (!native.isSphereVisible(x, y, z, 0.0099999998) || (checkLoS && !native.hasEntityClearLosToEntity(alt.Player.local, entity, 17))) {
            // If we can't see it and the RmlElement is already hidden we can just return
            if (!rmlElement.shown) return;

            // Else we're going to hide it by adding the css class...
            rmlElement.addClass("hide");
            // ... and setting our custom property
            rmlElement.shown = false;
        } else {
            // Entity is visible, so we check if the RmlElement may be still hidden
            if (!rmlElement.shown) {
                // If yes we remove our hide class...
                rmlElement.removeClass("hide");
                // ... and set the shown property to true
                rmlElement.shown = true;
            }

            // Now we get the screen coordinates of the entity
            const {x: screenX, y: screenY} = alt.worldToScreen(x, y, z + 2);
            // And apply it to our RmlElement
            rmlElement.style["left"] = `${screenX}px`;
            rmlElement.style["top"] = `${screenY}px`;

            // If dynamic size is disabled we can simply return here ...
            if (!dynamicSize) return;
            // ... else we check the distance, in this example we will use a minimum size of 1dp and maximum size of 50dp
            // which gets applied based on the distance from 1 to 100 meter. Everything below or above will either use
            // 1 or 50 as font size.
            const fontSizeModificator = Math.min(entity.pos.distanceTo(alt.Player.local.pos) / 100, 1);
            const fontSize = (1 - fontSizeModificator) * 50;
            // And after calculating it we modify the style property to use the new font size
            rmlElement.style["font-size"] = `${fontSize}dp`;
        }
    });
}
```

## Summary

After we have created both the `index.rml` and the `main.js` as well as added our font file, the RmlUi resource is ready to use.

What is especially noticeable here is that HTML elements can be controlled directly via the client code and thus updates can take place without events.\
This is one of the reasons why RmlUi can achieve a higher performance.