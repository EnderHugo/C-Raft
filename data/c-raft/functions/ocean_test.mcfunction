#Stop the infinite loop
scoreboard players set @e[tag=Map_controller, limit=1] Scheduled 1

#Schedule functions
execute as @e[tag=Map_controller, limit=1] at @s run schedule function c-raft:current_change 20s append