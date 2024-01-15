# Text Label API

Since alt:V Update 15 there are classes for creating client side text labels. These client side text labels are easier to create and use, as they are automatically streamed on client side.

Text labels are texts that are visually created in 3D space and can be used for all sorts of things.

## Usage

[TextLabel class in JS API reference](https://docs.altv.mp/js/api/alt-client.TextLabel.html)<br>
[TextLabel class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.TextLabel.html)<br>

### Example

```js
alt.Font.register("/segoeuib.ttf");

const pos = alt.Player.local.pos;
const rot = alt.Player.local.rot.sub(0, 0, -Math.PI);
new alt.TextLabel("Test <i>label</i>!", "Segoe UI", 100, 1, pos, rot, alt.RGBA.white, 2, alt.RGBA.black, true, 10);
```

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
