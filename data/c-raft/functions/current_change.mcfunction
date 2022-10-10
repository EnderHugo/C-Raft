#roll them bones
execute as @e[tag=Map_controller, limit=1] store result score @s oceanRNG run loot spawn ~ ~-2 ~ loot c-raft:1r4

#set direction
execute as @e[tag=Map_controller, limit=1] at @s if score @s oceanRNG = @s West run scoreboard players remove @s oceanX 1
execute as @e[tag=Map_controller, limit=1] at @s if score @s oceanRNG = @s East run scoreboard players add @s oceanX 1
execute as @e[tag=Map_controller, limit=1] at @s if score @s oceanRNG = @s North run scoreboard players remove @s oceanZ 1
execute as @e[tag=Map_controller, limit=1] at @s if score @s oceanRNG = @s South run scoreboard players add @s oceanZ 1

#reset schedule
scoreboard players set @e[tag=Map_controller, limit=1] Scheduled 0