#Stop the infinite loop
scoreboard players set @a Scheduled 1

#Schedule functions
execute as @a at @s run schedule function c-raft:clear_recipe_books 1s append