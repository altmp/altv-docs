# Text Label API

Since alt:V Update 15 there are classes for creating client side text labels. These client side text labels are easier to create and use, as they are automatically streamed on client side.
Text labels are texts that are visually created in 3D space and can be used for all sorts of things. Be sure to import the font you are trying to use into your [resource](https://docs.altv.mp/js/articles/create-your-first-resource.html).

## Usage

[TextLabel class in JS API reference](https://docs.altv.mp/js/api/alt-client.TextLabel.html)<br>
[TextLabel class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.TextLabel.html)<br>

## Server structure

We'll go on by explaining the general server structure and how to add a custom font. This below is just a example, you can also import a font inside your resource directory by using relative path.

```
server/
├── cache/
├── data/
├── modules/
├── resources/
    ├── resource1/
    ├── segoeuib.ttf
├── altv-server.exe
├── libnode.dll
├── server.toml
```

### Example

# [JS Module](#tab/tab1-0)
```js
const labelPos = new alt.Vector3(-4.75, 2.497, 71.217);
const labelRot = new alt.Vector3(0, 0, -0.253);
const labelColor = new alt.RGBA(255, 255, 255, 255);
const labelOutlineColor = new alt.RGBA(0, 0, 0, 80);
const labelFontSize = 32;
const labelFontScale = 2;
const labelOutlineWidth = .25;

alt.once('resourceStart', () => {
  alt.Font.register('mycustomfont.ttf');

  new alt.TextLabel('Welcome to alt:V v16', 'Segoe UI', labelFontSize, labelFontScale, labelPos, labelRot, labelColor, labelOutlineWidth, labelOutlineColor);
});
```
# [C# Module](#tab/tab1-1)
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

  Alt.CreateTextLabel("Welcome to alt:V v16", "Segoe UI", labelFontSize, labelFontScale, labelPos, labelRot, labelColor, labelOutlineWidth, labelOutlineColor, false, 0);
};
```
***

## Formatting

To achieve multicolored or styled text, or to include an image, Text Label API supports simple formatting, which is done through a set of XML tags.

> [!WARNING]
> Tags without a closing tag should end with `/>`.<br>
> For example: `<br />`, `<img src="..." />`

## Available formatting tags:

### `font`

Sets font parameters for text inside.

#### Attributes:

| Name         | Required? | Description               | Format              | Example    |
| ------------ | --------- | ------------------------- | ------------------- | ---------- |
| size         | no        | Font size (in pixels)     | float               | `16.0`     |
| color        | no        | Text color                | HEX color without # | `FF0000`   |
| outlineColor | no        | Outline color             | HEX color without # | `00FF00`   |
| outline      | no        | Outline width (in pixels) | float               | `5.0`      |
| face         | no        | Font name                 | string              | `Segoe UI` |
| weight       | no        | Font weight               | int                 | `500`      |

#### Example:

```xml
Nice <font color="FF0000">red</font> text!
```

### `img`

Allows to insert an image into the text.

#### Attributes:

| Name     | Required? | Description        | Format | Example     |
| -------- | --------- | ------------------ | ------ | ----------- |
| src      | yes       | Image path[^1]     | string | `/test.png` |
| width    | no        | Image width        | float  | `60`        |
| height   | no        | Image height       | float  | `80`        |
| baseline | no        | Image baseline[^2] | float  | `0.1`       |

[^1]: Image path is resolved from the creating resource, or asset pack. For example:
    `/test.png` - test.png in the root of creating resource;
    `@demo/test.png` - test.png in the root of asset-pack resource named `demo`

[^2]: Baseline determines which location on image (relative to height, 0.0 is top edge, 1.0 is bottom edge) will be located om the text baseline (bottom text line) level.
    This parameter can be used to align image to the surrounding text. By default baseline is set to `0.5`.

#### Supported image formats:

- `png`
- `jpg`
- `bmp`
- `tga`

#### Example:

```xml
alt:V Multiplayer <img src="@demo/logo.png" width="80" baseline="0.9" />
```

### `b`

Makes text **bold** (font weight 700). Has more priority than `font`.

#### Example:

```xml
This text is <b>bold</b>
```

### `i`

Makes text display as _italic_.

#### Example:

```xml
This text is <i>italic</i>
```

### `s`

Makes text display as crossed out (strikethrough: ~~example~~).

```xml
This text is <s>crossed out</s>
```

### `u`

Displays a <u>line under the text</u>

```xml
This text is <u>underlined</u>
```

### `br`

Inserts a newline character. Added for convinience, normal newline character is also supported.

```xml
Line 1<br />Line 2
Line 3
```