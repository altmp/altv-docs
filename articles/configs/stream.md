# The `stream.toml` configuration file

The `stream.toml` configuration file is needed for every dlc resource, e.g. a new vehicle. It has some configuration options like the GXT values and meta files.

Here is a list of all configuration options for the `stream.toml` and what they are used for:
```toml
# An array containing all files that should be loaded for this dlc
files = [
    # You can also use glob patterns to give access to a whole directory
    "stream/assets/*"
]
# The meta files your dlc uses
[meta]
"stream/carcols.meta" = "CARCOLS_FILE"
"stream/vehicles.meta" = "VEHICLE_METADATA_FILE"
"stream/handling.meta" = "HANDLING_FILE"

# The GXT entries for your dlc
[gxt]
"myveh" = "My vehicle"

```
