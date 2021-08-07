using System;
using System.Collections.Generic;
using System.Text;

namespace VehiclePageCreator
{
    class Vehicle
    {
        public class DimensionsMinVector
        {
            public double X { get; set; }
            public double Y { get; set; }
            public double Z { get; set; }
        }

        public class DimensionsMaxVector
        {
            public double X { get; set; }
            public double Y { get; set; }
            public double Z { get; set; }
        }

        public class BoundingCenterVector
        {
            public double X { get; set; }
            public double Y { get; set; }
            public double Z { get; set; }
        }


        public string Name { get; set; }
        public string DisplayName { get; set; }
        public long Hash { get; set; }
        public int SignedHash { get; set; }
        public string HexHash { get; set; }
        public string DlcName { get; set; }
        public string HandlingId { get; set; }
        public string LayoutId { get; set; }
        public string Manufacturer { get; set; }
        public string ManufacturerDisplayName { get; set; }
        public string Class { get; set; }
        public string Type { get; set; }
        public string PlateType { get; set; }
        public string DashboardType { get; set; }
        public string WheelType { get; set; }
        public List<string> Flags { get; set; }
        public int Seats { get; set; }
        public int Price { get; set; }
        public int MonetaryValue { get; set; }
        public bool HasConvertibleRoof { get; set; }
        public bool HasSirens { get; set; }
        public List<string> Weapons { get; set; }
        public List<string> ModKits { get; set; }
        public DimensionsMinVector DimensionsMin { get; set; }
        public DimensionsMaxVector DimensionsMax { get; set; }
        public BoundingCenterVector BoundingCenter { get; set; }
        public double BoundingSphereRadius { get; set; }
        public object Rewards { get; set; }
        public double MaxBraking { get; set; }
        public double MaxBrakingMods { get; set; }
        public double MaxSpeed { get; set; }
        public double MaxTraction { get; set; }
        public double Acceleration { get; set; }
        public double Agility { get; set; }
        public double MaxKnots { get; set; }
        public double MoveResistance { get; set; }
    }
}