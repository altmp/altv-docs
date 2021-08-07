using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Newtonsoft.Json;

namespace VehiclePageCreator
{
    class Program
    {
        static void Main(string[] args)
        {
            var depsFolder = "../../deps/gta-v-data-dumps/";
            var vehiclesClassesJson = depsFolder + "vehiclesClasses.json";
            var vehiclesJson = depsFolder + "vehicles.json";

            var vehiclesModelsFile = "../../../gta/articles/vehicle/models.md";

            /*
             * Read JSON files from gta-v-data-dumps by DurtyFree
             */

            if (!File.Exists(vehiclesClassesJson))
            {
                Console.WriteLine("Couldn't find " + vehiclesClassesJson + ". Are you running the project with 'dotnet run .\\generators-vehicle_models.csproj'?");
                Environment.Exit(1);
            }

            if (!File.Exists(vehiclesJson))
            {
                Console.WriteLine("Couldn't find " + vehiclesJson + ". Are you running the project with 'dotnet run .\\generators-vehicle_models.csproj'?");
                Environment.Exit(2);
            }

            using var readerVehicleClasses = new StreamReader(vehiclesClassesJson);
            var jsonVehicleClasses = readerVehicleClasses.ReadToEnd();
            var vehicleClasses = JsonConvert.DeserializeObject<List<string>>(jsonVehicleClasses);

            using var readerVehicles = new StreamReader(vehiclesJson);
            var jsonVehicles = readerVehicles.ReadToEnd();
            var vehicles = JsonConvert.DeserializeObject<List<Vehicle>>(jsonVehicles);

            var sortedVehiclesByName = vehicles.OrderBy(x => x.Name);

            /*
             * Generate Images
             */
            var gallery = File.CreateText(vehiclesModelsFile);

            gallery.WriteLine("<!--- This page gets generated with tools/deps/generators/vehicle_models -->");
            gallery.WriteLine("# Vehicle Models");
            foreach (var vehicleClass in vehicleClasses)
            {
                gallery.WriteLine("## " + vehicleClass);
                var vehiclesByClass = sortedVehiclesByName.Where(x => x.Class == vehicleClass);
                foreach (var vehicle in vehiclesByClass)
                {
                    if (vehicle.DlcName.ToLower() == "titleupdate")
                    {
                        gallery.WriteLine("![Missing image '" + vehicle.Name.ToLower() + ".png'](../../images/vehicle/models/" + vehicle.Name.ToLower() + ".png)<br/>");
                        gallery.WriteLine("**Name:** " + vehicle.Name + "<br/>");
                        gallery.WriteLine("**Hash:** " + vehicle.HexHash + "<br/>");
                        gallery.WriteLine("**Display Name:** " + vehicle.DisplayName + "<br/>");
                        gallery.WriteLine("<br/>");
                    }
                    else
                    {
                        gallery.WriteLine("![Missing image '" + vehicle.Name.ToLower() + ".png'](../../images/vehicle/models/" + vehicle.Name.ToLower() + ".png)<br/>");
                        gallery.WriteLine("**Name:** " + vehicle.Name + "<br/>");
                        gallery.WriteLine("**Hash:** " + vehicle.HexHash + "<br/>");
                        gallery.WriteLine("**Display Name:** " + vehicle.DisplayName + "<br/>");
                        gallery.WriteLine("**DLC:** " + vehicle.DlcName.ToLower() + "<br/>");
                        gallery.WriteLine("<br/>");
                    }
                }
            }

            gallery.WriteLine("<br/>Created with [GTA V Data Dumps from DurtyFree](https://github.com/DurtyFree/gta-v-data-dumps)<br/>");


            /*
             * Generate Snippets
             */

            
            gallery.WriteLine("# Snippets");

            gallery.WriteLine("## Javascript");
            gallery.WriteLine("```js");
            gallery.WriteLine("let VehicleModel {");

            var i = 0;
            foreach (var vehicle in sortedVehiclesByName)
            {
                if (i < sortedVehiclesByName.Count() - 1)
                    gallery.WriteLine($"\t{vehicle.Name.ToLower()}: {vehicle.HexHash},");
                else
                    gallery.WriteLine($"\t{vehicle.Name.ToLower()}: {vehicle.HexHash}");

                i++;
            }
            gallery.WriteLine("};");
            gallery.WriteLine("```");
            gallery.WriteLine("Created with [GTA V Data Dumps from DurtyFree](https://github.com/DurtyFree/gta-v-data-dumps)<br/>");

            gallery.WriteLine("");
            gallery.WriteLine("## Typescript");
            gallery.WriteLine("```ts");
            gallery.WriteLine("export enum VehicleModel {");

            i = 0;
            foreach (var vehicle in sortedVehiclesByName)
            {
                if (i < sortedVehiclesByName.Count() - 1)
                    gallery.WriteLine($"\t{vehicle.Name.ToLower()} = {vehicle.HexHash},");
                else
                    gallery.WriteLine($"\t{vehicle.Name.ToLower()} =  {vehicle.HexHash}");

                i++;
            }

            gallery.WriteLine("};");
            gallery.WriteLine("```");
            gallery.WriteLine("Created with [GTA V Data Dumps from DurtyFree](https://github.com/DurtyFree/gta-v-data-dumps)<br/>");

            gallery.Close();
            Console.WriteLine($"{vehiclesModelsFile} created for {vehicles.Count} vehicles.");

            Console.WriteLine("This tool is using data files from https://github.com/DurtyFree/gta-v-data-dumps");
        }
    }
}