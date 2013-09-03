if SERVER then
   resource.AddFile("materials/VGUI/ttt/icon_mac.vmt")
end

if SERVER then
   AddCSLuaFile( "shared.lua" )
end

if CLIENT then
   SWEP.PrintName = "S.E.W12"
   SWEP.Slot      = 6 -- add 1 to get the slot number key
   SWEP.Icon = "VGUI/ttt/icon_mac"

   SWEP.ViewModelFOV  = 72
   SWEP.ViewModelFlip = false
   
   SWEP.EquipMenuData = {
      type = "Swift Elimination Weaponry",
      desc = "Allows for swift elimination of target"
   };
end

SWEP.Base = "weapon_tttbase"

--- Standard GMod values

SWEP.HoldType			= "ar2"

SWEP.Primary.Delay       = 0.08
SWEP.Primary.Recoil      = 1.5
SWEP.Primary.Automatic   = true
SWEP.Primary.Damage      = 10
SWEP.Primary.Cone        = 0.025
SWEP.Primary.Ammo        = "item_ammo_smg1_ttt"
SWEP.Primary.ClipSize    = 25
SWEP.Primary.ClipMax     = 75
SWEP.Primary.DefaultClip = 25
SWEP.Primary.Sound       = Sound( "Weapon_SMG1.Special1" )

SWEP.IronSightsPos = Vector( 6.05, -5, 2.4 )
SWEP.IronSightsAng = Vector( 2.2, -0.1, 0 )

SWEP.ViewModel  = "models/weapons/v_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_rif_famas.mdl"

--- TTT --
SWEP.Kind = WEAPON_EQUIP1
SWEP.AutoSpawnable = false
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.CanBuy = { ROLE_DETECTIVE }
SWEP.InLoadoutFor = nil
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = true

function SWEP:GetHeadshotMultiplier(victim, dmginfo)
   local att = dmginfo:GetAttacker()
   if not IsValid(att) then return 2 end

   local dist = victim:GetPos():Distance(att:GetPos())
   local d = math.max(0, dist - 150)

   -- decay from 3.2 to 1.7
   return 1.7 + math.max(0, (1.5 - 0.002 * (d ^ 1.25)))
end