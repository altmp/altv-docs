# Dimensions

In alt:V there exists a dimension system and it's implemented serverside. This system allows to have multiple players and vehicles on the same location without seeing each other. It's useful to implement eg Apartments, so you can have multiple Apartments on the same location, without interfiering with eachother.

The dimensions are represented as an int32 this means the lowest possible dimension is -2147483648, the default is 0 and the highest is 2147483647.

| Min Value   |              Max Value             |         Name           |   Description |
| ------ | :-------------------------------: | :-------------------------------: | :-------------------------------------------------------: |
|   0           |   0           |  General Dimension    | This Dimension can only see itself. |
|   1           |   2147483647  |   Private Dimension   | This Dimension can only see itself (1 can't see 0, 2 can't see 1, 0 can't see 1, 1 can't see -1)
| -2147483647   |   -1          |   Public Dimension    | This Dimension can see itself, the General Dimension (-1 can see 0, -2 can't see -1, 0 can't see -1, -1 can't see 1) |
|   -2147483648 |   -2147483648 |   Global Dimension    | This Dimension is special, see below. |

## Global Dimension

This dimension can be used to make entity visible in any normal dimension (public, general, private) or to retrieve entities from any dimension.

> [!WARNING]
> It is not recommended to set dimension of players to the global dimension.

### Examples (JS)

Make vehicle visible in any dimension.

```js
const vehicle = new alt.Vehicle('sultan2', 0, 5, 71, 0, 0, 0);
vehicle.dimension = alt.globalDimension;
```

Get vehicles in any dimension.

```js
const veh1 = new alt.Vehicle('sultan2', 0, 0, 0, 0, 0, 0);
veh1.dimension = 2;
const veh2 = new alt.Vehicle('sultan3', 10, 5, 0, 0, 0, 0);
veh2.dimension = -1;

// getEntitiesInRange won't return entities immediately so we need to wait some time
await alt.Utils.wait(1000);

// get all vehicles in any dimension around 0, 0, 0 within 100 units
const entities = alt.getEntitiesInRange(
    alt.Vector3.zero, // pos
    100, // range
    alt.globalDimension, // dimension
    2 // filter (alt.BaseObjectFilterType.Vehicle)
);
alt.log({ entities }); // { entities: [ Vehicle {}, Vehicle {} ] }
```
