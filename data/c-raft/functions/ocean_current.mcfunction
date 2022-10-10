#schedule change in current
execute as @e[tag=Map_controller, limit=1] at @s if score @s Scheduled = @s Zero run function c-raft:ocean_test

#schedule item spawning
execute as @e[tag=Item_spawner, limit=1] at @s if score @s Scheduled = @s Zero run function c-raft:item_test

#set ocean current
execute as @e[type=minecraft:item] store result score @s oceanX run scoreboard players get @e[tag=Map_controller,limit=1] oceanX
execute as @e[type=minecraft:item] store result score @s oceanY run scoreboard players get @e[tag=Map_controller,limit=1] oceanY
execute as @e[type=minecraft:item] store result score @s oceanZ run scoreboard players get @e[tag=Map_controller,limit=1] oceanZ

execute as @a store result score @s oceanX run scoreboard players get @e[tag=Map_controller,limit=1] oceanX
execute as @a store result score @s oceanY run scoreboard players get @e[tag=Map_controller,limit=1] oceanY
execute as @a store result score @s oceanZ run scoreboard players get @e[tag=Map_controller,limit=1] oceanZ

#move according to current
execute as @e[type=minecraft:item] at @s if block ~ ~ ~ minecraft:water store result entity @s Motion[0] double 0.05 run scoreboard players get @s oceanX 
execute as @e[type=minecraft:item] at @s if block ~ ~1 ~ minecraft:water store result entity @s Motion[1] double 0.01 run scoreboard players get @s oceanY 
execute as @e[type=minecraft:item] at @s if block ~ ~ ~ minecraft:water store result entity @s Motion[2] double 0.05 run scoreboard players get @s oceanZ

#delete far away items
execute as @e[type=minecraft:item, tag=] at @s if entity @p[distance=55..] run kill @s