# Debugging RmlUi

This article describes basic steps of how to debug RmlUi.

> [!TIP]
> For debugging purposes the font `rmlui-debugger-font` can be used.
> This font doesn't has to be loaded but only contains a limited character set.

## Integrated debug tool

To inspect an RmlUi document alt:V has an integrated debugging tool, which can be activated via the F8 Console with the command **rmldebug**.

After entering the command, a bar with the following options will appear on the screen:

- Event Log
- Element Info
- Outlines

### Event Log

In the event log the different log levels can be activated and deactivated.\
If errors occur on the part of RmlUi, they are displayed in this window.

### Element Info

After activating the Element Info, an RmlUi element can be selected on the screen.\
On the right edge of the screen the respective properties of the element (Attributes, properties, events, ancestors and more) are displayed.\
Additionally there are buttons at the top of the screen, which can force different states (e.g. hover or focus) of the respective element.

### Outlines

If the outlines are activated, all RmlUi elements are outlined with a red box.