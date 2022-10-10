#set offhand to 0
scoreboard players set @a offhandEmpty 0

#tests if offhand has a recipe book
execute as @a store result score @s offhandEmpty run data get entity @s Inventory[{Slot:-106b,tag:{RecipeBook:1b}}]

#schedule clear anything that doesnt have a recipe book tag in offhand
execute as @a if score @s Scheduled matches 0 run function c-raft:recipe_test