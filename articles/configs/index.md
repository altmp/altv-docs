# Config files in alt:V

This article will explain the different types of config files and the use of config files in alt:V.

## What are config files used for

Config files are the files that give alt:V information about your server configuration.<br>
In a config file you specify e.g. your server name, the amount of slots, the type of your resource etc.<br>
There are several different config files in alt:V, which all have their own set of configuration options, usage and location.

## Important rules about the config files

1. The config is written in [TOML format](https://toml.io/en/)
2. Every line only contains one configuration option
3. Every configuration option is a key value pair, so it starts with the `key`, then a `=` to seperate the key and the value, and after that the `value`
4. Lines that start with a hashtag (`#`) are ignored and can be used for comments
5. Empty lines are ignored
