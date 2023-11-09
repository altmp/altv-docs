# Text Label API

Since alt:V Update 15 there are classes for creating client side text labels. These client side text labels are easier to create and use, as they are automatically streamed on client side.
Text labels are texts that are visually created in 3D space and can be used for all sorts of things. Be sure to import the font you are trying to use into your [resource](https://docs.altv.mp/js/articles/create-your-first-resource.html).

## Usage

[TextLabel class in JS API reference](https://docs.altv.mp/js/api/alt-client.TextLabel.html)<br>
[TextLabel class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.TextLabel.html)<br>

### Example

JS Module
```javascript
const labelPos = new alt.Vector3(-4.75, 2.497, 71.217);
const labelRot = new alt.Vector3(0, 0, -0.253);
const labelColor = new alt.RGBA(255, 255, 255, 255);
const labelOutlineColor = new alt.RGBA(0, 0, 0, 80);
const labelFontSize = 32;
const labelFontScale = 2;
const labelOutlineWidth = .25;

alt.once('resourceStart', () => {
  alt.Font.register('mycustomfont.ttf');

  new alt.TextLabel('Welcome to alt:V v15', 'My font family', labelFontSize, labelFontScale, labelPos, labelRot, labelColor, labelOutlineWidth, labelOutlineColor);
});
```

C# Module
```cs
var labelPos = new Position(-4.75f, 2.497f, 71.217f);
var labelRot = new Rotation(0f, 0f, -0.253f);
var labelColor = new Rgba(255, 255, 255, 255);
var labelOutlineColor = new Rgba(0, 0, 0, 80);
var labelFontSize = 32f;
var labelFontScale = 2f;
var labelOutlineWidth = 0.25f;
        
Alt.OnAnyResourceStart += _ =>
{
  Alt.RegisterFont("mycustomfont.ttf");

  Alt.CreateTextLabel("Welcome to alt:V v15", "My font family", labelFontSize, labelFontScale, labelPos, labelRot, labelColor, labelOutlineWidth, labelOutlineColor, false, 0);
};
```
