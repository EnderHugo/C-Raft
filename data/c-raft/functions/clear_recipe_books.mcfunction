#reset schedule
scoreboard players set @a Scheduled 0

#drop item in recipe slot
execute as @a at @s if entity @s[scores={offhandEmpty=0}] if data entity @s Inventory[{Slot:-106b}] run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b,tag:{dropped:1b}}}
execute as @a run data modify entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{dropped: 1b}}}] Item set from entity @s Inventory[{Slot:-106b}]
execute as @a run data modify entity @e[type=minecraft:item,limit=1,nbt={Item:{tag:{dropped: 1b}}}] Tags set value {tag:{dropped: 0b}}

#remove item in recipe slot
execute as @a if entity @s[scores={offhandEmpty=0}] run clear @s #c-raft:recipebooks{RecipeBook: 1b}
execute as @a unless entity @s[scores={offhandEmpty=4}] run item replace entity @s weapon.offhand with light_gray_stained_glass_pane

#replaces offhand item with current recipe
execute as @a unless entity @s[nbt={Inventory:[{Slot:-106b,tag:{RecipeBook: 1b}}]}] run item replace entity @s weapon.offhand with light_gray_stained_glass_pane{display:{Name:'{"text":"Recipe slot","color":"purple", "bold": true, "italic": false}'}, RecipeBook: 1b} 1 