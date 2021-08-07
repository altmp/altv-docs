# Ped Models Page Generator
This tool generates the docs page for ped models. It read the json files from [GTA V Data Dumps from DurtyFree](https://github.com/DurtyFree/gta-v-data-dumps) and parses the data. The generated page will be deployed to `gta/articled/ped/models.md` and the images need to be located at `gta/images/ped/models/`.

## How to run this tool
- Install at least .NET 5.0
- Clone and update all submodules in `deps/gta-v-data-dumps/`
- Go to this folder (`tools/generators/ped_models/`)
- Open a terminal and execute `dotnet run generators-ped_models.csproj`