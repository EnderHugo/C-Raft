#clear objectives
scoreboard objectives remove blockPlaced

scoreboard objectives remove Rotation

scoreboard objectives remove offhandEmpty

scoreboard objectives remove openedBarrel

scoreboard objectives remove oceanX
scoreboard objectives remove oceanY 
scoreboard objectives remove oceanZ 

scoreboard objectives remove itemX 
scoreboard objectives remove itemY 
scoreboard objectives remove itemZ 
scoreboard objectives remove itemXMax 
scoreboard objectives remove itemYMax 
scoreboard objectives remove itemZMax 
scoreboard objectives remove -itemXMax 
scoreboard objectives remove -itemYMax 
scoreboard objectives remove -itemZMax 

scoreboard objectives remove South 
scoreboard objectives remove North 
scoreboard objectives remove West 
scoreboard objectives remove East 

scoreboard objectives remove Scheduled 

scoreboard objectives remove Zero 
scoreboard objectives remove Two 
scoreboard objectives remove Three 
scoreboard objectives remove Four 
scoreboard objectives remove Five 
scoreboard objectives remove Ten 
scoreboard objectives remove Negative1 

scoreboard objectives remove oceanRNG 

#start objectives
scoreboard objectives add blockPlaced trigger

scoreboard objectives add offhandEmpty trigger

scoreboard objectives add openedBarrel minecraft.custom:minecraft.open_barrel

scoreboard objectives add recipeMissing trigger

scoreboard objectives add oceanX dummy 
scoreboard objectives add oceanY dummy
scoreboard objectives add oceanZ dummy

scoreboard objectives add Rotation dummy 

scoreboard objectives add itemX dummy 
scoreboard objectives add itemY dummy
scoreboard objectives add itemZ dummy
scoreboard objectives add itemXMax dummy 
scoreboard objectives add itemYMax dummy
scoreboard objectives add itemZMax dummy
scoreboard objectives add -itemXMax dummy 
scoreboard objectives add -itemYMax dummy
scoreboard objectives add -itemZMax dummy

scoreboard objectives add South dummy
scoreboard objectives add North dummy
scoreboard objectives add West dummy
scoreboard objectives add East dummy

scoreboard objectives add Scheduled dummy

scoreboard objectives add Zero dummy
scoreboard objectives add Two dummy
scoreboard objectives add Three dummy
scoreboard objectives add Four dummy
scoreboard objectives add Five dummy
scoreboard objectives add Ten dummy
scoreboard objectives add Negative1 dummy

scoreboard objectives add oceanRNG dummy

#place storage hold barrel at origin
setblock 0 0 0 barrel

#set all armor stands to blockPlaced 1
scoreboard players set @e[tag=Creation_Table] blockPlaced 1

#start storages
data modify storage recipes dummy set value dummy 
data modify storage recipebooks dummy set value dummy 
data modify storage recipeproducts dummy set value dummy 
function c-raft:recipes_fill

#delete previous item spawner and replace them
kill @e[type=armor_stand,tag=Item_spawner]
summon armor_stand 30 136 0 {Marker:1b,Invisible:1b,Invulnerable:1b,DisabledSlots:16191,Tags:[Item_spawner],NoGravity:1b}

#delete previous map controller and replace them
kill @e[type=armor_stand,tag=Map_controller]
summon armor_stand 0 136 0 {Marker:1b,Invisible:1b,Invulnerable:1b,DisabledSlots:16191,Tags:[Map_controller],NoGravity:1b}

#load objectives into map controller
scoreboard players set @e[tag=Map_controller] oceanX 1
scoreboard players set @e[tag=Map_controller] oceanY 1
scoreboard players set @e[tag=Map_controller] oceanZ 1

scoreboard players set @e[tag=Map_controller] South 0
scoreboard players set @e[tag=Map_controller] North 1
scoreboard players set @e[tag=Map_controller] West 2
scoreboard players set @e[tag=Map_controller] East 3

scoreboard players set @e[tag=Map_controller] Zero 0
scoreboard players set @e[tag=Map_controller] Two 2
scoreboard players set @e[tag=Map_controller] Three 3
scoreboard players set @e[tag=Map_controller] Four 4
scoreboard players set @e[tag=Map_controller] Five 5
scoreboard players set @e[tag=Map_controller] Ten 10
scoreboard players set @e[tag=Item_spawner] Negative1 -1

scoreboard players set @e[tag=Map_controller] Scheduled 0

scoreboard players set @e[tag=Map_controller] oceanRNG 0

#load objectives into Item Spawner
scoreboard players set @e[tag=Item_spawner] itemX 30
scoreboard players set @e[tag=Item_spawner] itemY 0
scoreboard players set @e[tag=Item_spawner] itemZ 136

scoreboard players set @e[tag=Item_spawner] Zero 0
scoreboard players set @e[tag=Item_spawner] Two 2
scoreboard players set @e[tag=Item_spawner] Three 3
scoreboard players set @e[tag=Item_spawner] Four 4
scoreboard players set @e[tag=Item_spawner] Five 5
scoreboard players set @e[tag=Item_spawner] Ten 10
scoreboard players set @e[tag=Item_spawner] Negative1 -1

scoreboard players set @e[tag=Item_spawner] Scheduled 0

scoreboard players set @e[tag=Item_spawner] itemXMax 30
scoreboard players set @e[tag=Item_spawner] itemYMax 1
scoreboard players set @e[tag=Item_spawner] itemZMax 30
scoreboard players set @e[tag=Item_spawner] -itemXMax -30
scoreboard players set @e[tag=Item_spawner] -itemXMax -1
scoreboard players set @e[tag=Item_spawner] -itemXMax -30

#load objectives into players
scoreboard players set @a offhandEmpty 4
scoreboard players set @a Scheduled 0

#clear inventory and give starting items
clear @a
give @a minecraft:crafting_table{display:{Name:'{"text":"Creation Table","color":"gold"}'},Creation_table_item:1b} 1
give @a minecraft:wooden_axe{display:{Name:'{"text":"Wooden Hammer","color":"aqua"}'},Wooden_Hammer:1b} 1

#say starting message
tellraw @a {"text":"You are now playing [C]Raft!","color":"gold"}