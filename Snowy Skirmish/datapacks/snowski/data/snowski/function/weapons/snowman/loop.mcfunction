execute as @e[tag=GreenSnowman] at @s unless entity @e[tag=GreenBlizzardCloud,distance=..2] run scoreboard players add @s CmdData 1
execute as @e[tag=RedSnowman] at @s unless entity @e[tag=RedBlizzardCloud,distance=..2] run scoreboard players add @s CmdData 1


execute as @e[tag=!MS1,tag=RedSnowman,scores={CmdData=150..}] at @s run item replace entity @s armor.head with golden_hoe[custom_model_data=14]
execute as @e[tag=!MS1,tag=GreenSnowman,scores={CmdData=150..}] at @s run item replace entity @s armor.head with golden_hoe[custom_model_data=15]
execute as @e[tag=!MS1,tag=Snowman,scores={CmdData=150..}] at @s run playsound minecraft:entity.snow_golem.hurt master @a ~ ~ ~ 1 1
execute as @e[tag=!MS1,tag=Snowman,scores={CmdData=150..}] at @s run particle minecraft:block{block_state:"minecraft:powder_snow"} ~ ~1 ~ 0 0.5 0 0.1 100
execute as @e[tag=!MS1,tag=Snowman,scores={CmdData=150..}] at @s run particle splash ~ ~1 ~ 0 0.5 0 0.1 20
execute as @e[tag=!MS1,tag=Snowman,scores={CmdData=150..}] at @s run tag @s add MS1

execute as @e[tag=!MS2,tag=RedSnowman,scores={CmdData=200..}] at @s run item replace entity @s armor.head with golden_hoe[custom_model_data=16]
execute as @e[tag=!MS2,tag=GreenSnowman,scores={CmdData=200..}] at @s run item replace entity @s armor.head with golden_hoe[custom_model_data=17]
execute as @e[tag=!MS2,tag=Snowman,scores={CmdData=200..}] at @s run playsound minecraft:entity.snow_golem.hurt master @a ~ ~ ~ 1 1
execute as @e[tag=!MS2,tag=Snowman,scores={CmdData=200..}] at @s run particle minecraft:block{block_state:"minecraft:powder_snow"} ~ ~1 ~ 0 0.5 0 0.1 100
execute as @e[tag=!MS2,tag=Snowman,scores={CmdData=200..}] at @s run particle splash ~ ~1 ~ 0 0.5 0 0.1 20
execute as @e[tag=!MS2,tag=Snowman,scores={CmdData=200..}] at @s run tag @s add MS2

execute as @e[tag=!MS3,tag=RedSnowman,scores={CmdData=250..}] at @s run item replace entity @s armor.head with golden_hoe[custom_model_data=18]
execute as @e[tag=!MS3,tag=GreenSnowman,scores={CmdData=250..}] at @s run item replace entity @s armor.head with golden_hoe[custom_model_data=19]
execute as @e[tag=!MS3,tag=Snowman,scores={CmdData=250..}] at @s run playsound minecraft:entity.snow_golem.hurt master @a ~ ~ ~ 1 1
execute as @e[tag=!MS3,tag=Snowman,scores={CmdData=250..}] at @s run particle minecraft:block{block_state:"minecraft:powder_snow"} ~ ~0.6 ~ 0 0.4 0 0.1 100
execute as @e[tag=!MS3,tag=Snowman,scores={CmdData=250..}] at @s run particle splash ~ ~0.6 ~ 0 0.4 0 0.1 20
execute as @e[tag=!MS3,tag=Snowman,scores={CmdData=250..}] at @s run tag @s add MS3

execute as @e[tag=!MS4,tag=RedSnowman,scores={CmdData=280..}] at @s run item replace entity @s armor.head with golden_hoe[custom_model_data=20]
execute as @e[tag=!MS4,tag=GreenSnowman,scores={CmdData=280..}] at @s run item replace entity @s armor.head with golden_hoe[custom_model_data=21]
execute as @e[tag=!MS4,tag=Snowman,scores={CmdData=280..}] at @s run playsound minecraft:entity.snow_golem.death master @a ~ ~ ~ 1 1
execute as @e[tag=!MS4,tag=Snowman,scores={CmdData=280..}] at @s run particle minecraft:block{block_state:"minecraft:powder_snow"} ~ ~0.6 ~ 0 0.3 0 0.1 100
execute as @e[tag=!MS4,tag=Snowman,scores={CmdData=280..}] at @s run particle splash ~ ~0.6 ~ 0.2 0.1 0.2 0.1 100
execute as @e[tag=!MS4,tag=Snowman,scores={CmdData=280..}] at @s run data merge entity @s {Marker:1b}
execute as @e[tag=!MS4,tag=Snowman,scores={CmdData=280..}] at @s run tag @s add MS4


execute as @e[tag=Snowman,scores={CmdData=800..}] at @s run particle splash ~ ~0.4 ~ 0.3 0.1 0.3 0.1 6 force
execute as @e[tag=Snowman,scores={CmdData=800..}] at @s run particle dripping_water ~ ~0.4 ~ 0.2 0.1 0.2 0.1 5 force
execute as @e[tag=Snowman,scores={CmdData=800..}] at @s run particle minecraft:block{block_state:"minecraft:snow_block"} ~ ~ ~ 0.3 0.2 0.3 0.1 40 force
kill @e[tag=Snowman,tag=Melted,scores={CmdData=800..}]
tag @e[tag=Snowman,scores={CmdData=280..}] add Melted

execute as @e[tag=GreenSnowman,tag=!Melted] at @s unless block ~ ~-0.1 ~ air run tp @s ~ ~ ~ facing entity @a[team=Red,tag=!Knocked,limit=1,sort=nearest]
execute as @e[tag=RedSnowman,tag=!Melted] at @s unless block ~ ~-0.1 ~ air run tp @s ~ ~ ~ facing entity @a[team=Green,tag=!Knocked,limit=1,sort=nearest]

#> Snowballs hitting the snowman
execute as @e[tag=RedSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 if entity @e[tag=GreenArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] run scoreboard players add @s CmdData 60
execute as @e[tag=GreenSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 if entity @e[tag=RedArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] run scoreboard players add @s CmdData 60
execute as @e[tag=RedSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 run tag @e[tag=GreenArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] add HitSM
execute as @e[tag=GreenSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 run tag @e[tag=RedArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] add HitSM

#> Iceballs hitting the snowman
execute as @e[tag=RedSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 if entity @e[tag=GreenIArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] run playsound iceball master @a ~ ~ ~ 1 1
execute as @e[tag=GreenSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 if entity @e[tag=RedIArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] run playsound iceball master @a ~ ~ ~ 1 1
execute as @e[tag=RedSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 if entity @e[tag=GreenIArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] run scoreboard players add @s CmdData 280
execute as @e[tag=GreenSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 if entity @e[tag=RedIArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] run scoreboard players add @s CmdData 280
execute as @e[tag=RedSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 run tag @e[tag=GreenIArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] add HitSM
execute as @e[tag=GreenSnowman,tag=!Melted] at @s positioned ~-0.7 ~ ~-0.7 run tag @e[tag=RedIArrow,tag=!HitSM,dx=1.4,dy=2,dz=1.4] add HitSM

#> Snowman snowballs
execute as @e[type=arrow,tag=!ThrownBall,tag=!SBArrow,tag=!IBArrow,tag=!BBArrow] at @s run particle minecraft:falling_dust{block_state:"minecraft:snow_block"} ~ ~ ~ 0.1 0.1 0.1 0.1 2 force
execute as @e[type=arrow,tag=!ThrownBall,tag=!SBArrow,tag=!IBArrow,tag=!BBArrow] at @s run particle minecraft:falling_dust{block_state:"minecraft:ice"} ~ ~ ~ 0.1 0.1 0.1 0.1 1 force

#> Spawn
function snowski:weapons/snowman/spawn