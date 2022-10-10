#removes recipe Items
clear @a #c-raft:recipeitems{RecipeItem: 1b}

#detects missing recipes and checks them with player interaction
execute as @a if score @s openedBarrel matches 0.. run execute as @e[tag=Creation_Table, limit=1] at @s positioned ~ ~1 ~ store result score @s recipeMissing run data get block ~ ~ ~ Items[0].Count 1

execute as @e[tag=Creation_Table, limit=1] if score @s recipeMissing matches 0 run say recipe missing!

#adds the player's recipes
execute as @e[tag=Creation_Table] at @s positioned ~ ~1 ~ run data modify block ~ ~ ~ Items insert 0 from storage minecraft:recipes Items[]

#reset barrel detection
scoreboard players set @p openedBarrel 0
scoreboard players set @e[tag=Creation_Table, limit=1] recipeMissing 1