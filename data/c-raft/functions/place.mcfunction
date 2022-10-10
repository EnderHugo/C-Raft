#Return creation table if falls in water
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~ ~ water run give @p minecraft:crafting_table{display:{Name:'{"text":"Creation Table","color":"gold"}'},Creation_table_item:1b} 1
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~ ~ water run tellraw @a {"text":"Don't drop your creation table in the water!","color":"red"}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~ ~ water run kill @s

#Place creation table
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~-0.1 ~ stripped_oak_log run setblock ~ ~1 ~ barrel[facing=up]{CustomName:'{"text": "Select Recipe","color": "dark_green"}'}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~-0.1 ~ stripped_oak_log run setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"text": "Creation Table","color": "gold"}'}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s align xz positioned ~0.5 ~ ~0.5 if block ~ ~-0.1 ~ stripped_oak_log run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,DisabledSlots:16191, Tags:[Creation_Table]}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~-0.1 ~ stripped_oak_log run kill @s

execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~-0.1 ~ oak_log run setblock ~ ~1 ~ barrel[facing=up]{CustomName:'{"text": "Select Recipe","color": "dark_green"}'}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~-0.1 ~ oak_log run setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"text": "Creation Table","color": "gold"}'}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s align xz positioned ~0.5 ~ ~0.5 if block ~ ~-0.1 ~ oak_log run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,DisabledSlots:16191, Tags:[Creation_Table]}
execute as @e[nbt={Item:{id:"minecraft:crafting_table",tag:{Creation_table_item:1b}}}] at @s if block ~ ~-0.1 ~ oak_log run kill @s

# Make placement dependant on rotation of the armor stand relative to player, then rotate 90dgs if invalid placement