using System;
using System.Collections.Generic;
using System.Text;

namespace PedModelsPageCreator
{
    public class Ped
    {
         public string Name { get; set;}
         public UInt32 Hash { get; set;}
         public Int32 SignedHash { get; set;}
         public string HexHash { get; set;}
         public string DlcName { get; set;}
         public string PropsName { get; set;}
         public string ClipDictionaryName { get; set;}
         public string BlendShapeFileName { get; set;}
         public string ExpressionSetName { get; set;}
         public string ExpressionDictionaryName { get; set;}
         public string ExpressionName { get; set;}
         public string Pedtype { get; set;}
         public string MovementClipSet { get; set;}
         public List<string> MovementClipSets { get; set;}
         public string StrafeClipSet { get; set;}
         public string MovementToStrafeClipSet { get; set;}
         public string InjuredStrafeClipSet { get; set;}
         public string FullBodyDamageClipSet { get; set;}
         public string AdditiveDamageClipSet { get; set;}
         public string DefaultGestureClipSet { get; set;}
         public string FacialClipsetGroupName { get; set;}
         public string DefaultVisemeClipSet { get; set;}
         public string SidestepClipSet { get; set;}
         public string PoseMatcherName { get; set;}
         public string PoseMatcherProneName { get; set;}
         public string GetupSetHash { get; set;}
         public string CreatureMetadataName { get; set;}
         public string DecisionMakerName { get; set;}
         public string MotionTaskDataSetName { get; set;}
         public string DefaultTaskDataSetName { get; set;}
         public string PedCapsuleName { get; set;}
         public string PedComponentSetName { get; set;}
         public string PedComponentClothName { get; set;}
         public string PedIKSettingsName { get; set;}
         public bool IsStreamedGfx { get; set;}
         public bool AmbulanceShouldRespondTo { get; set;}
         public bool CanRideBikeWithNoHelmet { get; set;}
         public bool CanSpawnInCar { get; set;}
         public bool IsHeadBlendPed { get; set;}
         public bool bOnlyBulkyItemVariations { get; set;}
         public string RelationshipGroup { get; set;}
         public string NavCapabilitiesName { get; set;}
         public string PerceptionInfo { get; set;}
         public string DefaultBrawlingStyle { get; set;}
         public string DefaultUnarmedWeapon { get; set;}
         public string Personality { get; set;}
         public string CombatInfo { get; set;}
         public string VfxInfoName { get; set;}
         public string AmbientClipsForFlee { get; set;}
         public string Radio1 { get; set;}
         public string Radio2 { get; set;}
         public double FUpOffset { get; set;}
         public double RUpOffset { get; set;}
         public double FFrontOffset { get; set;}
         public double RFrontOffset { get; set;}
         public double MinActivationImpulse { get; set;}
         public double HDDist { get; set;}
         public double TargetingThreatModifier { get; set;}
         public double KilledPerceptionRangeModifer { get; set;}
         public string Sexiness { get; set;}
         public string ExternallyDrivenDOFs { get; set;}
         public string PedVoiceGroup { get; set;}
         public string AnimalAudioObject { get; set;}
         public string AbilityType { get; set;}
         public string ThermalBehaviour { get; set;}
         public string DefaultSpawningPreference { get; set;}
         public double DefaultRemoveRangeMultiplier { get; set;}
    }
}
