#Return creation table if falls in water
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~ ~ water run give @p minecraft:crafting_table{display:{Name:'{"text":"Creation Table","color":"gold"}'},Creation_table_item:1b} 1
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~ ~ water run tellraw @a {"text":"Don't drop your creation table in the water!","color":"red"}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~ ~ water run kill @s

#Place creation table
    #summonn armor stand
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s align xz positioned ~0.5 ~ ~0.5 if block ~ ~-0.1 ~ #c-raft:valid_placement run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,DisabledSlots:16191, Tags:[Creation_Table]}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s align xz positioned ~0.5 ~ ~0.5 if block ~ ~-0.1 ~ #c-raft:valid_placement run scoreboard players set @e[tag=Creation_Table,distance=..2,limit=1] blockPlaced 0

    #Rotate armor stand relative to player
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s run execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}, distance=..2] run data modify entity @s Rotation set from entity @p Rotation
    
    #Get entity rotation
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s store result score @s Rotation run data get entity @s Rotation[0] 1
    #"Round" rotation
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s if score @s Rotation matches -135..-35 run teleport @s ~ ~ ~ -90 ~
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s if score @s Rotation matches -45..45 run teleport @s ~ ~ ~ 0 ~
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s if score @s Rotation matches 45..135 run teleport @s ~ ~ ~ 90 ~
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s if score @s Rotation matches 135..180 run teleport @s ~ ~ ~ 180 ~
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s if score @s Rotation matches -180..-135 run teleport @s ~ ~ ~ 180 ~

    #Make placement dependant on rotation of player
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s if block ~ ~-0.1 ~ #c-raft:valid_placement run setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"text": "Creation Table","color": "gold"}'}
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s positioned ^-1 ^ ^ if block ~ ~-1 ~ #c-raft:valid_placement run setblock ~ ~ ~ barrel[facing=up]{CustomName:'{"text": "Select Recipe","color": "dark_green"}'}
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s positioned ^-1 ^ ^ if block ~ ~-1 ~ #c-raft:valid_placement run scoreboard players set @s blockPlaced 1
execute as @e[tag=Creation_Table, limit=1, scores={blockPlaced=0}] at @s run teleport @s ~ ~ ~ ~90 ~

execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~-0.1 ~ #c-raft:valid_placement run kill @s
