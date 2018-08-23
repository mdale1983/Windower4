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
    Niht = {}
    Ankou = {}
    Rosmerta = {}
	Nant = {}
--------------------------
--  Dark Knight Capes   --
--------------------------
    Niht.DarkMagic = {
        name="Niht Mantle", 
        augments={'Attack+12','Dark magic skill +10', '"Drain" and "Aspir" potency +15', 'Weapon skill damage +3%'
    }}
    Ankou.TP = {
        name="Ankou's mantle",
        augments ={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10'}
    }
    Ankou.StrWS = {
        name="Ankou's mantle",
        augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%'}
    }
    Ankou.VitWS = {
        name="Ankou's mantle",
        augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%'}
    }
--------------------------
--  Blue Mage Capes     --
--------------------------
    Rosmerta.TP = {
        name="Rosmerta's Cape", 
        augments={'DEX+17','Accuracy+20 Attack+20','DEX+3','"Dual Wield"+10'}
    }
--
--
--
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
    Valor.Head.TP = {
        name="Valorous Mask", 
        augments={'Accuracy+17 Attack+17','"Store TP"+3','Accuracy+15'}
    }
    Valor.Head.WS = {
        name="Valorous Mask", 
        augments={'Accuracy+21','Weapon skill damage +3%','STR+10','Attack+12'}  
    }
    ------------------
    --  Valor Body  --
    ------------------
    Valor.Body.TP = {
        name="Valorous mail",
        augments = {'Accuracy+21 Attack+21','Magic dmg. taken -4%','DEX+9','Accuracy+11','Attack+13'}
    }
    ------------------
    --  Valor Hand  --
    ------------------
    Valor.Hands.TP = {
        name="Valorous mitts", 
        augments={'Accuracy+24 Attack+24','DEX+14','Accuracy+13'}
    }
    Valor.Hands.WS = {
        name="Valorous mitts",
        augments={'Attack+23','Weapon skill damage +3%','STR+13','Accuracy+10'}
    }
    ------------------
    --  Valor Legs  --
    ------------------
    Valor.Legs.TP = {
        name="Valor. Hose",
        augments={'Accuracy+28','"Dbl.Atk."+2','DEX+9','Attack+3'}
    }
    Valor.Legs.WS = {
        name="Valor. Hose", 
        augments={'Accuracy+13 Attack+13','Weapon skill damage +4%'}
    }
    Valor.Legs.DA = { 
    --For Aftermath Set--
        name="Valor. Hose",
        augments={'Accuracy+29','"Dbl.Atk."+5','VIT+5'}
    }
    ------------------
    --  Valor Feet  --
    ------------------
    Valor.Feet.TP = {
        name="Valorous Greaves", 
        augments={'Accuracy+21 Attack+21','"Store TP"+3','DEX+7','Accuracy+14'}
    }
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
    Odyssean.Helm.VitWS = {
		name="Odyssean Helm", 
		augments={'Accuracy+23','Weapon skill damage +1%','VIT+5','Attack+14'}
	}
    ------------------
    --  Odyss. Body --
    ------------------
    Odyssean.Body.FC = {
        name="Odyssean chestplate",
        augments={'STR+9', 'Attack+11', '"Fast Cast"+2'}
    }
    Odyssean.Body.WS = {
        name="Odyssean chestplate",
        augments={'Accuracy+30','Weapon skill damage +4%','DEX+5','Attack+12'}
    }
    ------------------
    --  Odyss. Hand --
    ------------------
    Odyssean.Hands.FC = {
        name="Odyssean gauntlets",
        augments={'VIT+7', 'Accuracy+12', 'Attack+12', '"Fast Cast"+5'}
    }
    Odyssean.Hands.WS = {
        name="Odyssean gauntlets",
        augments={'Accuracy+24','Weapon skill damage +2%','STR+12','Attack+13'} 
    }
	Odyssean.Hands.VitWS = {
		name="Odyssean gauntlets",
        augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','VIT+5'} 
	}
    ------------------
    --  Odyss. Legs --
    ------------------
    Odyssean.Legs.TP = {
        name="Odyssean Cuisses", 
        augments={'Accuracy+25 Attack+25','"Store TP"+3','Accuracy+10'}
    }
	Odyssean.Legs.StrWS = {
        name="Odyssean Cuisses", 
        augments={'Accuracy+19 Attack+19','Weapon skill damage +3%','STR+7','Attack+2'}
    }
	Odyssean.Legs.VitWS = {
		name="Odyssean Cuisses", 
		augments={'Accuracy+14','Weapon skill damage +2%','VIT+10','Attack+8'}
	}
    ------------------
    --  Odyss. Feet --
    ------------------
    Odyssean.Feet.FC = {
        name="Odyssean Greaves", 
        augments={'Mag. Acc.+22','INT+12','"Mag.Atk.Bns."+11'}
    }
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
    Herc.Head.MAB = {
        name="Herculean Helm", 
        augments={'"Mag.Atk.Bns."+16','Weapon skill damage +3%','AGI+7','Rng.Atk.+2'}
    }
    ------------------
    --  Herc Body   --
    ------------------
    Herc.Body.TP = {
         name="Herculean Vest", 
         augments={'"Store TP"+1','DEX+6','Accuracy+9'}
    }
	Herc.Body.MAB = {
         name="Herculean Vest", 
         augments={'"Mag.Atk.Bns."+25','Crit. hit damage +3%','Weapon skill damage +7%'}	
	}
    ------------------
    --  Herc Hand   --
    ------------------
    Herc.Hands.PDT = {
        name="Herculean Gloves", 
        augments={'Accuracy+30','Phys. dmg. taken -3%','STR+1'}
    }
    Herc.Hands.TP = { 
        name="Herculean Gloves", 
        augments={'Accuracy+27','"Counter"+1','DEX+10','Attack+9'}
    }
	Herc.Hands.MAB = { 
        name="Herculean Gloves", 
        augments={'"Mag.Atk.Bns."+20','Weapon skill damage +4%','Mag. Acc.+15'}
    }
	Herc.Hands.WS = { 
        name="Herculean Gloves", 
        augments={'Accuracy+17 Attack+17','"Triple Atk."+3','STR+3','Accuracy+10','Attack+11'}
    }
    ------------------
    --  Herc Legs   --
    ------------------
    Herc.Legs.TP = {
        name="Herculean Trousers", 
        augments={'Accuracy+20 Attack+20','"Triple Atk."+1','VIT+2','Accuracy+7','Attack+8'}
    }
	Herc.Legs.MAB = {
        name="Herculean Trousers", 
        augments={'"Mag.Atk.Bns."+20','Weapon skill damage +3%','Rng.Atk.+11'}
    }
	Herc.Legs.WS = {
        name="Herculean Trousers", 
        augments={'Accuracy+17 Attack+17','"Triple Atk."+3','STR+10','Attack+5'}
    }
    ------------------
    --  Herc Feet   --
    ------------------
    Herc.Feet.TP = { 
        name="Herculean Boots", 
        augments={'Accuracy+21 Attack+21','Crit.hit rate+1','STR+4','Accuracy+15','Attack+9'}
    }
	Herc.Feet.PDT = { 
        name="Herculean Boots", 
        augments={'Accuracy+26','Damage taken-3%','DEX+8','Attack+3'}
    }
	Herc.Feet.WS = { 
        name="Herculean Boots", 
        augments={'Accuracy+22','"Triple Atk."+2','STR+3','Attack+15'}
    }
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
     
    ------------------
    --  Chir. Body  --
    ------------------
     
    ------------------
    --  Chir. Hand  --
    ------------------
     
    ------------------
    --  Chir. Legs  --
    ------------------
     
    ------------------
    --  Chir. Feet  --
    ------------------
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
     
    ------------------
    --  SR. Legs    --
    ------------------
    Samnuha.Legs = { 
        name="Samnuha Tights", 
        augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2'}
    }
	Lengo.Legs = {
		name="Lengo Pants", 
		augments={'INT+5','Mag. Acc.+4','"Mag.Atk.Bns."+1','"Refresh"+1'}
	}
    ------------------
    --  SR. Feet    --
    ------------------
	Medium.Feet = {
		name="Medium's Sabots", 
		augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%'}
	}