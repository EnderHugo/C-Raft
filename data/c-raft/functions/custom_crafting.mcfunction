#removes recipe Items
clear @a #c-raft:recipeitems{RecipeItem: 1b}
execute as @e[nbt={Item:{tag:{RecipeItem:1b}}}] at @s run kill @s

#detects missing recipes and checks them with player interaction
    #fill barrel with recipebooks at origin
    data modify block 0 0 0 Items insert 0 from storage minecraft:recipebooks Items[]


    #reset recipe
    execute as @a[scores={openedBarrel=1..}] run execute as @e[tag=Creation_Table, limit=1] unless score @s recipeMissing matches 2 at @s positioned ^-1 ^ ^ store result score @s recipeMissing run data get block ~ ~ ~ Items[{Slot:0b}].Count
    execute as @e[tag=Creation_Table, limit=1] if score @s recipeMissing matches 0 run clear @p #c-raft:recipebooks{RecipeBook:1b}
    execute as @e[tag=Creation_Table, limit=1] if score @s recipeMissing matches 0 run scoreboard players set @s recipeMissing 2

    #fiber recipe
    execute as @a[scores={openedBarrel=1..}] run execute as @e[tag=Creation_Table, limit=1] unless score @s recipeMissing matches 2 at @s positioned ^-1 ^ ^ store result score @s recipeMissing run data get block ~ ~ ~ Items[{Slot:1b}].Count
    execute as @e[tag=Creation_Table, limit=1] if score @s recipeMissing matches 0 run item replace entity @p weapon.offhand from block 0 0 0 container.0
    execute as @e[tag=Creation_Table, limit=1] if score @s recipeMissing matches 0 run scoreboard players set @s recipeMissing 2
    
    #research table recipe
    execute as @a[scores={openedBarrel=1..}] run execute as @e[tag=Creation_Table, limit=1] unless score @s recipeMissing matches 2 at @s positioned ^-1 ^ ^ store result score @s recipeMissing run data get block ~ ~ ~ Items[{Slot:2b}].Count
    execute as @e[tag=Creation_Table, limit=1] if score @s recipeMissing matches 0 run item replace entity @p weapon.offhand from block 0 0 0 container.1
    execute as @e[tag=Creation_Table, limit=1] if score @s recipeMissing matches 0 run scoreboard players set @s recipeMissing 2

    #adds the player's recipes
    execute as @e[tag=Creation_Table] at @s positioned ^-1 ^ ^ run data modify block ~ ~ ~ Items insert 0 from storage minecraft:recipes Items[]

    #reset barrel detection
    execute as @e[tag=Creation_Table, limit=1, scores={recipeMissing=2}] if score @s recipeMissing matches 2 at @s positioned ^-1 ^ ^ run setblock ~ ~ ~ air
    execute as @e[tag=Creation_Table, limit=1, scores={recipeMissing=2}] if score @s recipeMissing matches 2 at @s positioned ^-1 ^ ^ run setblock ~ ~ ~ minecraft:barrel[facing=up]{CustomName:'{"text": "Select Recipe","color": "dark_green"}'}
    execute as @e[tag=Creation_Table, limit=1, scores={recipeMissing=2}] if score @s recipeMissing matches 2 run scoreboard players set @a[scores={openedBarrel=1..}] openedBarrel 0
    scoreboard players set @e[tag=Creation_Table, limit=1] recipeMissing 1