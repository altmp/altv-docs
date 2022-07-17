# Introduction to RmlUi

This article describes what RmlUi is and the benefits of using it.

## What is RmlUi

RmlUi is a [open-source](https://github.com/mikke89/RmlUi), light-weight C++ library that supports XHTML1 and CSS2.\
Due to the direct implementation in the alt:V client as well as the lower function set, RmlUi has a much higher performance, which allows updates that take place every frame.\
Because of the fact that only CSS2 is supported, not all css functions are available.\
This may mean that existing CSS code for a CEF WebView might not work with RmlUi and may require customization.\
More information about this can be found in the [RmlUi documentation](https://mikke89.github.io/RmlUiDoc/pages/rcss.html).

## Comparison to CEF WebView

**Advantages**

- lower resource consumption
- direct control by the alt:V client, resulting in:
- better performance
- higher update rate

**Disadvantages**

- less functionality due to XHTML1 and CSS2 standards
- no support for UI frameworks (for example VueJS, React, Angular, ...)

## When to use RmlUi

Due to the lower functionality and the lack of support for UI frameworks, the use of RmlUi is recommended only for simple sites or sites that benefit from a higher update rate.\
For example, the display of [name tags](nametags.md) which are positioned relative to the respective entity requires a high update rate which is not possible using a CEF WebView. 

## Documentation

The programming language specific documentation can be found under the respective module documentation:

- JavaScript
  - [RmlDocument](http://docs.altv.mp/js/api/alt-client.RmlDocument.html)
  - [RmlElement](http://docs.altv.mp/js/api/alt-client.RmlElement.html)
- C#
  - [RmlDocument](http://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.RmlDocument.html)
  - [RmlElement](http://docs.altv.mp/cs/api/AltV.Net.Client.Elements.Entities.RmlElement.html)