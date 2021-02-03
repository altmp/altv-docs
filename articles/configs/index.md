# Config files in alt:V

This article will explain the different types of config files and the use of config files in alt:V.

## What are config files used for

Config files are the files that give alt:V information about your server configuration.<br>
In a config file you specify e.g. your server name, the amount of slots, the type of your resource etc.<br>
There are several different config files in alt:V, which all have their own set of configuration options, usage and location.

## Important rules about the config files

1. Every line only contains one configuration option
2. Every configuration option is a key value pair, so it starts with the `key`, then a `:` to seperate the key and the value, and after that the `value`
3. Lines are ended with a linebreak, commas at the end of every line are optional
4. Strings don't need to be inclosed in `"` or `'`, only when they contain special characters like `,` for example
5. Lines that start with a hashtag (`#`) are ignored and can be used for comments
6. Empty lines are ignored

## For advanced users

If you want to see for yourself how the config files get parsed or even want to use the config files that alt:V uses yourself,
you can take a look at the [GitHub repository](https://github.com/altmp/alt-config/blob/master/alt-config.h) for it.<br>
The config solution alt:V uses is a single C/C++ header file, so you should keep in mind that you probably need some experience
in the C programming language if you want to take a look at the source code of it yourself.
