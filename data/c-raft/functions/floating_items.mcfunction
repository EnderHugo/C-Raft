
#copy oceanXZ to item spawner
execute as @e[tag=Item_spawner, limit=1] store result score @s oceanX run scoreboard players operation @s oceanX = @e[tag=Map_controller, limit=1] oceanX
execute as @e[tag=Item_spawner, limit=1] store result score @s oceanZ run scoreboard players operation @s oceanZ = @e[tag=Map_controller, limit=1] oceanZ

#run operatin x10
execute as @e[tag=Item_spawner, limit=1] store result score @s itemX run scoreboard players operation @s oceanX *= @s Ten
execute as @e[tag=Item_spawner, limit=1] store result score @s itemX run scoreboard players operation @s oceanX *= @s Two
execute as @e[tag=Item_spawner, limit=1] store result score @s itemX run scoreboard players operation @s oceanX *= @s Negative1

execute as @e[tag=Item_spawner, limit=1] store result score @s itemZ run scoreboard players operation @s oceanZ *= @s Ten
execute as @e[tag=Item_spawner, limit=1] store result score @s itemZ run scoreboard players operation @s oceanZ *= @s Two
execute as @e[tag=Item_spawner, limit=1] store result score @s itemZ run scoreboard players operation @s oceanZ *= @s Negative1

#restart item spawner coordinates
execute as @e[tag=Item_spawner, limit=1] store result entity @s Pos[0] double 1 if score @s itemX > @s Zero run teleport @e[tag=Item_spawner, limit=1] @e[tag=Map_controller, limit=1]
execute as @e[tag=Item_spawner, limit=1] store result entity @s Pos[0] double 1 if score @s itemX < @s Zero run teleport @e[tag=Item_spawner, limit=1] @e[tag=Map_controller, limit=1]

execute as @e[tag=Item_spawner, limit=1] store result entity @s Pos[2] double 1 if score @s itemZ > @s Zero run teleport @e[tag=Item_spawner, limit=1] @e[tag=Map_controller, limit=1]
execute as @e[tag=Item_spawner, limit=1] store result entity @s Pos[2] double 1 if score @s itemZ < @s Zero run teleport @e[tag=Item_spawner, limit=1] @e[tag=Map_controller, limit=1]

execute as @e[tag=Item_spawner, limit=1] at @s run teleport @s ~ ~ ~ facing entity @a[limit=1] eyes

#teleport item spawner to coordinate
scoreboard players operation @e[tag=Item_spawner, limit=1] oceanX = @s itemX
execute as @e[tag=Item_spawner, limit=1] if score @s itemX > @s itemXMax run scoreboard players set @s itemX 30
execute as @e[tag=Item_spawner, limit=1] if score @s itemX < @s -itemXMax run scoreboard players set @s itemX -30
execute as @e[tag=Item_spawner, limit=1] store result entity @s Pos[0] double 1 if score @s itemX > @s Zero run scoreboard players get @s itemX
execute as @e[tag=Item_spawner, limit=1] store result entity @s Pos[0] double 1 if score @s itemX < @s Zero run scoreboard players get @s itemX
scoreboard players operation @e[tag=Item_spawner, limit=1] itemX = @s oceanX

scoreboard players operation @e[tag=Item_spawner, limit=1] oceanY = @s itemY
execute as @e[tag=Item_spawner, limit=1] if score @s itemZ > @s itemZMax run scoreboard players set @s itemZ 30
execute as @e[tag=Item_spawner, limit=1] if score @s itemZ < @s -itemZMax run scoreboard players set @s itemZ -30
execute as @e[tag=Item_spawner, limit=1] store result entity @s Pos[2] double 1 if score @s itemZ > @s Zero run scoreboard players get @s itemZ
execute as @e[tag=Item_spawner, limit=1] store result entity @s Pos[2] double 1 if score @s itemZ < @s Zero run scoreboard players get @s itemZ
scoreboard players operation @e[tag=Item_spawner, limit=1] itemY = @s oceanY

#spawn item from loot table
execute as @e[tag=Item_spawner, limit=1] at @s run loot spawn ~ ~ ~ loot c-raft:floating_items
execute as @e[tag=Item_spawner, limit=1] at @s run loot spawn ~ ~ ~1 loot c-raft:floating_items
execute as @e[tag=Item_spawner, limit=1] at @s run loot spawn ~ ~ ~-1 loot c-raft:floating_items
execute as @e[tag=Item_spawner, limit=1] at @s run loot spawn ~1 ~ ~ loot c-raft:floating_items
execute as @e[tag=Item_spawner, limit=1] at @s run loot spawn ~-1 ~ ~ loot c-raft:floating_items

#reset schedule
scoreboard players set @e[tag=Item_spawner, limit=1] Scheduled 0