#Return creation table if falls in water
execute as @e[nbt={Item:{id:"minecraft:wooden_axe",tag:{Wooden_Hammer:1b}}}] at @s if block ~ ~ ~ water run give @p minecraft:wooden_axe{display:{Name:'{"text":"Wooden Hammer","color":"aqua"}'},Wooden_Hammer:1b} 1
execute as @e[nbt={Item:{id:"minecraft:wooden_axe",tag:{Wooden_Hammer:1b}}}] at @s if block ~ ~ ~ water run tellraw @a {"text":"Don't drop your wooden hammer in the water!","color":"red"}
execute as @e[nbt={Item:{id:"minecraft:wooden_axe",tag:{Wooden_Hammer:1b}}}] at @s if block ~ ~ ~ water run kill @s

#break creation table
execute as @e[nbt={Item:{id:"minecraft:wooden_axe",tag:{Wooden_Hammer:1b}}}] at @s align xz positioned ~0.5 ~-1 ~0.5 if entity @e[tag=Creation_Table, distance=..0.5] run setblock ~ ~ ~ air
execute as @e[nbt={Item:{id:"minecraft:wooden_axe",tag:{Wooden_Hammer:1b}}}] at @s align xz positioned ~0.5 ~-1 ~0.5 if entity @e[tag=Creation_Table, distance=..0.5] run particle block crafting_table ~ ~ ~ 0.5 1 0.5 0.2 100 normal @a
execute as @e[nbt={Item:{id:"minecraft:wooden_axe",tag:{Wooden_Hammer:1b}}}] at @s align xz positioned ~0.5 ~-1 ~0.5 if entity @e[tag=Creation_Table, distance=..0.5] run give @p minecraft:wooden_axe{display:{Name:'{"text":"Wooden Hammer","color":"aqua"}'},Wooden_Hammer:1b} 1
execute as @e[nbt={Item:{id:"minecraft:wooden_axe",tag:{Wooden_Hammer:1b}}}] at @s align xz positioned ~0.5 ~-1 ~0.5 if entity @e[tag=Creation_Table, distance=..0.5] run kill @s

execute as @e[tag=Creation_Table, scores={blockPlaced=1}] at @s if block ~ ~ ~ air run give @p minecraft:crafting_table{display:{Name:'{"text":"Creation Table","color":"gold"}'},Creation_table_item:1b} 1
execute as @e[tag=Creation_Table, scores={blockPlaced=1}] at @s if block ~ ~ ~ air run fill ^-1 ^ ^ ^ ^ ^ air
execute as @e[tag=Creation_Table, scores={blockPlaced=1}] at @s if block ~ ~ ~ air run kill @s