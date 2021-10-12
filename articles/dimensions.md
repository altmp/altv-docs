# Dimensions

In alt:V there exists a dimension system and it's implemented serverside. This system allows to have multiple players and vehicles on the same location without seeing each other. It's useful to implement eg Apartments, so you can have multiple Apartments on the same location, without interfiering with eachother.

The dimensions are represented as an int32 this means the lowest possible dimension is -2147483648, the default is 0 and the highest is 2147483647.


| Min Value   |              Max Value             |         Name           |   Description |
| ------ | :-------------------------------: | :-------------------------------: | :-------------------------------------------------------: |
| -2147483647   |   -1          |   Public Dimension    | This Dimension can see itself, the General Dimension and the Global Dimension (-1 can see 0, -2 can't see -1, 0 can't see -1, -1 can't see 1) |
|   0           |   0           |  General Dimension    | This Dimension can only see itself. |
|   -2147483648 |   -2147483648 |   Global Dimension    | This Dimension can only see itself. |
|   1           |   2147483647  |   Private Dimension   | This Dimension can only see itself and the Global Dimension (1 can't see 0, 2 can't see 1, 0 can't see 1, 1 can't see -1)