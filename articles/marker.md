# Marker API

Since alt:V Update 15 there are classes for creating client side markers. These client side markers are easier to create and use, as they are automatically streamed on client side.

Markers are symbols in 3D space that can be used to visually mark specific positions.

> [!WARNING]
> Nearest created markers are automatically streamed to the player as soon as they get near the defined streaming distance.
> 
> For performance reason markers are currently limited to 2000 streamed in at the same time.

## Usage

[Marker class in JS API reference](https://docs.altv.mp/js/api/alt-client.Marker.html)<br>
[Marker class in C# API reference](https://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.Marker.html)<br>

The look of an marker is defined by its type, see [MarkerTypes](https://docs.altv.mp/js/api/alt-client.MarkerType.html) for all available types.<br>

### Example

<img src="https://i.imgur.com/UwdrKCf.gif">

```js
// Create green rotating dollar sign marker
const marker = new alt.Marker(29, new alt.Vector3(0, 0, 71), new alt.RGBA(0, 128, 0, 255));
marker.rotate = true;
```

Example of a streamed marker which is only visible if you get in 100.0 of coordinate range.

```js
const marker = new alt.Marker(29, new alt.Vector3(0, 0, 71), new alt.RGBA(0, 128, 0, 255), true, 100.0);
```