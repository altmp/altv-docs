# Introduction

> [!CAUTION]
> Custom launchers that are required to connect to the server are only allowed if they are fully open source and the server is not listed on the masterlist.

As an alternative to the custom launcher, it is possible to obtain a branded launcher.

The branded launcher is available from the Patreon "Diamond" tier or higher and features several server-specific displays such as an RSS feed, launcher and UI background, logo, primary color, and server name.\
In order for a user to activate this branding, a "Apply server skin" checkbox is shown when connecting to the server, which is enabled by default.

This article explains what information is required and how to request it.

# Samples

You can check out the following examples for some of the available customizations:

- [Launcher background](~/altv-docs-assets/altv-docs-gta/images/customlauncher/launcher_splash.png)
- [Interface background and RSS feed](~/altv-docs-assets/altv-docs-gta/images/customlauncher/user_interface.png)
- [Loading screen](~/altv-docs-assets/altv-docs-gta/images/customlauncher/loading_screen.png)
- [Activate the skin](~/altv-docs-assets/altv-docs-gta/images/customlauncher/apply_skin.png)

# Requesting a launcher

To request a launcher, you must have an active Patreon membership at the "Diamond" level or higher.

The following data can be included optionally to customize the interface:
- **All images must be in PNG format**
- A launcher background with a resolution of 300x400 [[Example](~/altv-docs-assets/altv-docs-gta/images/customlauncher/launcher_splash.png)]
- A logo with a resolution of 128x128 [[Example](~/altv-docs-assets/altv-docs-gta/images/customlauncher/user_interface.png)]
- A UI background with a resolution of 1920x1080 or 3840x2160 [[Example](~/altv-docs-assets/altv-docs-gta/images/customlauncher/loading_screen.png)]
- A color to replace the primary color of the interface [[Example 1](~/altv-docs-assets/altv-docs-gta/images/customlauncher/user_interface.png)] [[Example 2](~/altv-docs-assets/altv-docs-gta/images/customlauncher/color_customization.png)]
- The link to an RSS feed. The exact format of the RSS feed is covered in the following topics." [[Example](~/altv-docs-assets/altv-docs-gta/images/customlauncher/user_interface.png)]

Once you have fulfilled all requirements and prepared the necessary media, join our [Discord server](https://discord.altv.mp/) and contact a member of the Public Relations team.

# RSS Feed

## Title

The title of the RSS feed is visible above the feed. If the 'title' property of the RSS feed is an empty string, the translation of 'Latest news' in the users language will be used instead.

## Item Properties

The following properties of the RSS feed entries are processed by the launcher:

| Property    | Required | Description                                                                                                            |
|-------------|----------|------------------------------------------------------------------------------------------------------------------------|
| title       | No       | Title of the post, displayed at the beginning of the post                                                              |
| link        | No       | Opens in the browser when the user clicks on the post                                                                  |
| pubDate     | Yes      | Date of publication of the post. Displayed at the end in the user's language-specific formatting                       |
| description | Yes      | Content of the post. Use of various HTML elements is allowed. The allowed elements are covered in the following topic. |
| dc:creator  | No       | Creator of the post. Allows the use of HTML.                                                                           |

## HTML usage

The following HTML elements are allowed and can be used in the RSS feed:\
address, article, aside, footer, header, h1, h2, h3, h4, h5, h6, hgroup, main, nav, section, blockquote, dd, div, dl, dt, figcaption, figure, hr, li, main, ol, p, pre, ul, a, abbr, b, bdi, bdo, br, cite, code, data, dfn, em, i, kbd, mark, q, rb, rp, rt, rtc, ruby, s, samp, small, span, strong, sub, sup, time, u, var, wbr, caption, col, colgroup, table, tbody, td, tfoot, th, thead, tr, img, del

## Special elements

> [!TIP]
> Unless otherwise specified, the display styles of the elements listed below follow the display style of Discord.

### Spoiler

```html
<span data-spoiler>content</span>
```

Displays a spoiler that can be revealed by the user clicking on it.

### Localized strings

```html
<!-- Localized string without arguments -->
<span data-localized>LOCALIZATION_KEY</span>

<!-- Localized string with arguments -->
<span data-localized="localization argument">LOCALIZATION_KEY</span>
```

A list of translated strings can be found in the [altv-locales](https://github.com/altmp/altv-locales/tree/master) repository.

The usage of the localized strings is only possible in the properties `description` and `dc:creator`.

### Timestamps

```html
<span data-timestamp="F">1675455031</span>
```

The timestamp behaves like a timestamp in Discord and displays the respective time in the user's timezone.\
The content of the span is a Unix timestamp and the possible [formats](https://discord.com/developers/docs/reference#message-formatting-timestamp-styles) are based on Discords syntax.

If no other format is specified, the "F" format is used by default.

### Mentions

```html
<span data-mention="255, 0, 0">@zziger</span>
```

Displays a mention. As the value of the attribute, a color in RGB syntax separated by a comma can be specified.\
If no value is specified, Discord's default mention color is used.

### Images

#### Emoji

```html
<img data-emoji src="https://emoji/icon/url.png" alt="emojiname">
```

Displays an image as a small inline element (1.375em height).\
Allowed in the description and dc:creator properties.

#### Image row

```html
<span data-images>
    <img src="https://image/one/url.png" alt="image one">
    <img src="https://image/two/url.png" alt="image two">
    <img src="https://image/three/url.png" alt="image three">
</span>
```

Displays the given images in a horizontally scrollable list. The scrollbar is only shown when the width exceeds the possible display. Recommended for example for galleries.

### Quote

```html
<blockquote>quote content</blockquote>
```

Displays the specified content as a quote.

### Code

#### Inline

```html
<code>Inline code</code>
```

Displays the specified text as code without line breaks.

#### Block

```html
<pre>
    <code>
        Multi line
        Code block
    </code>
</pre>
```
