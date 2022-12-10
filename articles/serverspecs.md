# Server Specifications

## What should you buy?
When working with alt:V it's hard to determine what kind of server you should be expected to purchase when running a server.
Below are some general specifications with average player counts to help you determine what kind and type of server you need.

## Interesting Facts

These are facts and similarities seen across all servers.

- The average mid-tier server utilizes 6-42% of their CPU. This is based on players and other factors.
- The average mid-tier server has a player count of roughly 300-600 players at peak hours.
- The average mid-tier server has RAM usage less than 1.25GB.
- The average mid-tier server has around 8 cores.
- The average mid-tier server is clocked at 3.7ghz

## Minimum Server Specification

Based on these statistics one could assume the **minimum specifications** for a performant server **above 100 players**.

- CPU 3.2ghz
- 4 Cores
- 4 GB of RAM (Additional for Databases, etc.)
- Disk Space (Depends on Database and Script)

This will always be subject to change based on upcoming features or performance changes.

## Used ports

By default alt:V uses port 7788 (TCP & UDP) if no [CDN](~/articles/cdn.md) is used. If you are using a CDN, only UDP is used.
The port can be changed in the [server.toml](~/articles/configs/server.md).