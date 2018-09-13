----------------------------------
--      Augmented Gear          --
----------------------------------  
    --[[
        When adding in Augmented gear follow 
        these simple guidelines
        gearNameSimple = {}
        gear.name = {
            name="item_name",
            augments={'augment1', 'augment2', 'augment3'}
        }
         
        and when adding gear to sets add in as 
        gear.name,
        this way GearSwap knows what item to put in there
         
        1 Dexterity is .75 accuracy
        1 Strength is .75 Attack
    ]]
----------------------------------------------------------------------
--                          Augmented Capes                         --
----------------------------------------------------------------------
    Suc = {}
	Ghost = {}
    Rosmerta = {}
	Nant = {}
-----------------------
--  Red Mage Capes   --
-----------------------
    Suc.MDT = {
		name="Sucellos's Cape", 
		augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Magic dmg. taken-10%'}
	}
	Suc.PDT = { 
		name="Sucellos's Cape", 
		augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}
	}
	Suc.WSD = { 
		name="Sucellos's Cape", 
		augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Magic dmg. taken-10%'}
	}
    Suc.MndMAC = {
		name="Sucellos's Cape", 
		augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Mag. Evasion+15'}
	}
	Suc.MAB = {
		name="Sucellos's Cape", 
		augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10'}
	}
	Ghost.EncDur = {
		name="Ghostfyre Cape", 
		augments={'Enfb.mag. skill +6','Enha.mag. skill +6','Mag. Acc.+1','Enh. Mag. eff. dur. +19'}
	}
--------------------------
--  Blue Mage Capes     --
--------------------------
    Rosmerta.TP = {
        name="Rosmerta's Cape", 
        augments={'DEX+17','Accuracy+20 Attack+20','DEX+3','"Dual Wield"+10'}
    }
--------------------------
--  Geomancer Capes     --
--------------------------
	Nant.FC = {
		name="Nantosuelta's Cape", 
		augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10'}
	}
----------------------------------------------------------------------
--                          Augmented Valor                         --
--                      WAR/PLD/DRK/SAM/DRG/BST                     --
----------------------------------------------------------------------
    Valor = {}
    Valor.Head ={}
    Valor.Body = {}
    Valor.Hands = {}
    Valor.Legs = {}
    Valor.Feet = {} 
    ------------------
    --  Valor Head  --
    ------------------
    
    ------------------
    --  Valor Body  --
    ------------------
    
    ------------------
    --  Valor Hand  --
    ------------------
    
    ------------------
    --  Valor Legs  --
    ------------------
    
    ------------------
    --  Valor Feet  --
    ------------------
    
----------------------------------------------------------------------
--                          Augmented Odyss.                        --
--                            WAR/PLD/DRK                           --
----------------------------------------------------------------------
    Odyssean = {}
	Odyssean.Helm = {}
    Odyssean.Body = {}
    Odyssean.Hands = {}
    Odyssean.Legs = {}
    Odyssean.Feet = {}
    ------------------
    --  Odyss. Head --
    ------------------
    
    ------------------
    --  Odyss. Body --
    ------------------
    
    ------------------
    --  Odyss. Hand --
    ------------------
    
    ------------------
    --  Odyss. Legs --
    ------------------
    
    ------------------
    --  Odyss. Feet --
    ------------------
    
----------------------------------------------------------------------
--                          Augmented Herc                          --
--              MNK/THF/RNG/NIN/BLU/COR/PUP/DNC/RUN                 --
----------------------------------------------------------------------
    Herc = {}
    Herc.Head = {}
    Herc.Body = {}
    Herc.Hands = {}
    Herc.Legs = {}
    Herc.Feet = {}
    ------------------
    --  Herc Head   --
    ------------------
    
    ------------------
    --  Herc Body   --
    ------------------
    
    ------------------
    --  Herc Hand   --
    ------------------

    ------------------
    --  Herc Legs   --
    ------------------
    
    ------------------
    --  Herc Feet   --
    ------------------
    
----------------------------------------------------------------------
--                          Augmented Merl.                         --
--
----------------------------------------------------------------------
    Merl = {}
    Merl.Head = {}
    Merl.Body = {}
    Merl.Hands = {}
    Merl.Legs = {}
    Merl.Feet = {}
    ------------------
    --  Merl. Head  --
    ------------------
     
    ------------------
    --  Merl. Body  --
    ------------------
     
    ------------------
    --  Merl. Hand  --
    ------------------
     
    ------------------
    --  Merl. Legs  --
    ------------------
     
    ------------------
    --  Merl. Feet  --
    ------------------
    Merl.Feet.Burst = {
		name="Merlinic Crackows", 
		augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+6%','INT+4'}
	} 
----------------------------------------------------------------------
--                          Augmented Chir.                         --
--
----------------------------------------------------------------------
    Chir = {}
    Chir.Head = {}
    Chir.Body = {}
    Chir.Hands = {}
    Chir.Legs = {}
    Chir.Feet = {}
    ------------------
    --  Chir. Head  --
    ------------------
    Chir.Head.Acc = {
		name="Chironic Hat", 
		augments={'Accuracy+19 Attack+19','"Dbl.Atk."+2','CHR+6','Accuracy+13','Attack+13'}
	}
    ------------------
    --  Chir. Body  --
    ------------------
     
    ------------------
    --  Chir. Hand  --
    ------------------
     
    ------------------
    --  Chir. Legs  --
    ------------------
    Chir.Legs.MAC = {
		name="Chironic Hose", 
		augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Spell interruption rate down -2%','MND+15','Mag. Acc.+6','"Mag.Atk.Bns."+4',}
	}
    ------------------
    --  Chir. Feet  --
    ------------------
	Chir.Feet.MAB = { 
        name="Chironic Slippers", 
		augments={'Rng.Atk.+8','"Blood Boon"+3','"Treasure Hunter"+2','Mag. Acc.+13 "Mag.Atk.Bns."+13'}
    }

--------------------------------------------------------------------------
--                        Augmented Escha Gear                          --
--------------------------------------------------------------------------
	Kyakus = {}
	Vanya = {}
	Gende = {}
	Telc={}
	Taeon={}
	Carmine={}
	Kyakus.Head ={}
	Kyakus.Body ={}
	Kyakus.Hands ={}
	Kyakus.Legs ={}
	Kyakus.Feet ={}
	Vanya.Head = {}
	Vanya.Body = {}
	Vanya.Hands = {}
	Vanya.Legs = {}
	Vanya.Feet = {}
	Gende.Feet = {}
	Telc.Head = {}
	Telc.Body = {}
	Telc.Legs = {}
	Taeon.Head = {}
	Taeon.Hands = {}
	Taeon.Legs = {}
	Taeon.Feet = {}
	Carmine.Legs = {}
	---------------
    --   Head    --
    ---------------
    Vanya.Head.Heals = {
		name="Vanya Hood", 
		augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3'}
	} 
	Telc.Head.EncDur = {
		name="Telchine Cap", 
		augments={'Accuracy+15','Enmity-3','Enh. Mag. eff. dur. +8'}
	}
	Taeon.Head.TP = {
		name="Taeon Chapeau", 
		augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}
	}
	Taeon.Head.Crit = {
		name="Taeon Chapeau", 
		augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%'}
	}
    --------------
    --  Body    --
    --------------
    Vanya.Body.CST = {
		name="Kaykaus Bliaut", 
		augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}
	}
	Kyakus.Body.CST ={
		name="Kaykaus Bliaut", 
		augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5'}
	}
	Telc.Body.EncDur = {
		name="Telchine Chas.", 
		augments={'Mag. Evasion+25','Enh. Mag. eff. dur. +9'}
	}
    --------------
    --  Hand    --
    --------------
	Kyakus.Hands.MAC ={
		name="Kaykaus Cuffs", 
		augments={'MP+60','MND+10','Mag. Acc.+15'}
	}
	Vanya.Hands = {
		
	}
	Taeon.Hands.TP = {
		name="Taeon Gloves", 
		augments={'Accuracy+25','"Triple Atk."+2','DEX+10'}
	}
	--------------
    --  Legs    --
    --------------
	Telc.Legs.EncDur = {
		name="Telchine Braconi", 
		augments={'Accuracy+15 Attack+15','Enh. Mag. eff. dur. +10'}
	}
	Taeon.Legs.TP = {
		name="Taeon Tights", 
		augments={'Accuracy+22','"Triple Atk."+2','DEX+10',}
	}
	Taeon.Legs.Crit = {
		name="Taeon Tights", 
		augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%'}
	}
	Carmine.Legs.DW = {
		name="Carmine Cuisses +1", 
		augments={'Accuracy+20','Attack+12','"Dual Wield"+6'}
	}
	Carmine.Legs.MND = {
		name="Carmine Cuisses +1", 
		augments={'Accuracy+12','DEX+12','MND+20'}
	}
	--------------
    --  Feet    --
    --------------
	Vanya.Feet.CST = {
		name="Vanya Clogs", 
		augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}
	}
	Gende.Feet.PDT = {
		name="Gende. Galosh. +1", 
		augments={'Phys. dmg. taken -3%','Magic dmg. taken -1%','Song recast delay -1',}
	}
	Taeon.Feet.TP = {
		name="Taeon Boots", 
		augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}
	}
--------------------------------------------------------------------------
--                      Augmented Sinister Reign                        --
--------------------------------------------------------------------------
    Samnuha = {}
	Lengo = {}
	Medium = {}
	Jumalik = {}
	Leyline = {}
	Floarl = {}
    ------------------
    --  SR. Head    --
    ------------------
     
    ------------------
    --  SR. Body    --
    ------------------
     
    ------------------
    --  SR. Hand    --
    ------------------
    Leyline.FC = {
		name="Leyline Gloves", 
		augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2'}
	}
    ------------------
    --  SR. Legs    --
    ------------------
    Samnuha.Legs = { 
        name="Samnuha Tights", 
        augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2'}
    }
	Lengo.Legs = {
		name="Lengo Pants", 
		augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1'}
	}
    ------------------
    --  SR. Feet    --
    ------------------
	Medium.Feet = {
		name="Medium's Sabots", 
		augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%'}
	}
--------------------------------------------------------------------------
--                                Misc.                                 --
--------------------------------------------------------------------------	
	ege = { }
	ege.FC = { 
		name="Egeking", 
		augments={'Accuracy+50','Mag. Acc.+30','"Fast Cast"+8'}
	}