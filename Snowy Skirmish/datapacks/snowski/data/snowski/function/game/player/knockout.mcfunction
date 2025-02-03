#> Add knocked tag if player has 0 HP and increase knocktime score
execute as @a[team=Green,scores={nnhealth=1}] run tag @s add Knocked
execute as @a[team=Red,scores={nnhealth=1}] run tag @s add Knocked
scoreboard players add @a[tag=Knocked] knocktime 1

#> Knockfx
execute as @a[tag=IceImpact,scores={knocktime=1}] at @s run playsound iceball master @a ~ ~ ~ 1.5 1
execute as @a[tag=!IceImpact,scores={knocktime=1}] at @s run playsound minecraft:entity.arrow.hit master @a ~ ~ ~ 1.5 0
execute as @a[tag=!IceImpact,scores={knocktime=1}] at @s run item replace entity @s armor.head with snow_block[enchantments={levels:{binding_curse:1},show_in_tooltip:0b},custom_name='[{"text":"Snow of Shame.","italic":false,"color":"red"}]',lore=['[{"text":"Go warm up at a campfire to respawn.","italic":false,"color":"gray"}]','[{"text":"Oh also, try not get hit next time...","italic":false,"color":"gray"}]'],custom_data={Shame:1b}] 1
execute as @a[tag=IceImpact,scores={knocktime=1}] at @s run item replace entity @s armor.head with packed_ice[enchantments={levels:{binding_curse:1},show_in_tooltip:0b},custom_name='[{"text":"Ice of Shame.","italic":false,"color":"red"}]',lore=['[{"text":"Go warm up at a campfire to respawn.","italic":false,"color":"gray"}]','[{"text":"Iceballs are so unfair!","italic":false,"color":"gray"}]'],custom_data={Shame:1b}] 1
execute as @a[scores={knocktime=1}] at @s run effect give @s blindness 1 100 true
execute as @a[tag=!IceImpact,scores={knocktime=1}] at @s run particle minecraft:block{block_state:"minecraft:snow_block"} ~ ~1.6 ~ 0.1 0.1 0.1 0.1 50
execute as @a[tag=IceImpact,scores={knocktime=1}] at @s run particle minecraft:block{block_state:"minecraft:blue_ice"} ~ ~1.6 ~ 0.1 0.1 0.1 0.1 50
execute as @a[scores={knocktime=1}] at @s run particle minecraft:block{block_state:"minecraft:ice"} ~ ~1.6 ~ 0.2 0.2 0.2 0.2 25
effect give @a[tag=Knocked,scores={knocktime=1}] slowness 2 100 true
effect give @a[tag=Knocked,scores={knocktime=1}] glowing 1 0 true
effect give @a[tag=Knocked,scores={knocktime=1}] blindness 1 0 true
tag @a[tag=Knocked,scores={knocktime=1}] remove IceImpact
effect give @a[tag=Knocked] slowness infinite 3 true
clear @a[tag=Knocked,scores={knocktime=..179}] snowball
clear @a[tag=Knocked,scores={knocktime=..179}] ghast_spawn_egg
clear @a[tag=Knocked,scores={knocktime=..179}] golden_hoe
clear @a[tag=Knocked,scores={knocktime=..179}] blaze_spawn_egg
clear @a[tag=Knocked,scores={knocktime=..179}] rabbit_spawn_egg
clear @a[tag=Knocked,scores={knocktime=..179}] clay
execute unless score $gamestate CmdData matches 2 unless score $keepinv CmdData matches 1 run clear @a[tag=Knocked] clay

scoreboard players set @a[tag=Knocked,scores={knocktime=1}] snowballammo 0

#> Remove knocked fx when HP is above 1
execute as @a[tag=Knocked,scores={nnhealth=2..}] run scoreboard players reset @s knocktime
execute as @a[tag=Knocked,scores={nnhealth=2..}] run item replace entity @s armor.head with air
execute as @a[tag=Knocked,scores={nnhealth=2..}] run function snowski:game/player/playerdeco
execute as @a[tag=Knocked,scores={nnhealth=2..}] run tag @s remove IceImpact
execute as @a[tag=Knocked,scores={nnhealth=2..}] run effect clear @s slowness
execute as @a[tag=Knocked,scores={nnhealth=2..}] run tag @s remove Knocked

#> Actionbars and respawns
execute as @a[team=Red,scores={knocktime=1}] run function snowski:game/player/komessagered
execute as @a[team=Green,scores={knocktime=1}] run function snowski:game/player/komessagegreen
execute as @a[scores={knocktime=1}] run scoreboard players add @s deathcollect 1
tag @a remove justHit

#> Fall countdown
execute as @a[scores={knocktime=1}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"8","color":"blue"}]
execute as @a[scores={knocktime=20}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"7","color":"blue"}]
execute as @a[scores={knocktime=40}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"6","color":"blue"}]
execute as @a[scores={knocktime=60}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"5","color":"blue"}]
execute as @a[scores={knocktime=80}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"4","color":"blue"}]
execute as @a[scores={knocktime=100}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"3","color":"blue"}]
execute as @a[scores={knocktime=120}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"2","color":"blue"}]
execute as @a[scores={knocktime=140}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"1","color":"blue"}]
execute as @a[scores={knocktime=160}] run title @s actionbar ["",{"text":"❆ ","color":"aqua"},{"text":"Respawning: ","color":"dark_aqua"},{"text":"0","color":"blue"}]

#> Respawn countdown
execute as @a[scores={knocktime=120}] at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 100 2
execute as @a[scores={knocktime=140}] at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 100 2
execute as @a[scores={knocktime=160}] at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 100 1

execute as @a[scores={knocktime=180}] at @s run particle minecraft:block{block_state:"minecraft:snow_block"} ~ ~1 ~ 0.2 0.5 0.2 0.1 100
execute as @a[scores={knocktime=180}] at @s run particle minecraft:block{block_state:"minecraft:ice"} ~ ~1 ~ 0.2 0.5 0.2 0.1 20
execute as @a[scores={knocktime=180}] at @s run playsound minecraft:block.snow.break master @a ~ ~ ~ 1 0
execute if score $forcedmodes CmdData matches 1 as @a[scores={knocktime=180}] at @s run gamemode adventure @s
execute as @a[scores={knocktime=180}] at @s run scoreboard players set @s resettracker 50

execute as @a[team=Green,scores={knocktime=180..}] at @e[tag=GreenCampfire] run tp @s ~ ~0.7 ~ 90 0
execute as @a[team=Green,scores={knocktime=180..}] at @e[tag=GreenCampfire] run particle flame ~ ~ ~ 0 0 0 0.1 10 force
execute as @a[team=Green,scores={knocktime=180..}] at @e[tag=GreenCampfire] run playsound entity.blaze.shoot master @a ~ ~ ~ 0.7 0
execute as @a[team=Green,scores={knocktime=1}] run summon firework_rocket 106 80 8 {Tags:["PointsFW"],LifeTime:50,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;11743532],fade_colors:[I;15435844],has_trail:true,has_twinkle:false}],flight_duration:2}}}}
execute as @a[team=Green,scores={knocktime=1}] run scoreboard players add $RedGifts CmdData 4
execute as @a[team=Green,scores={knocktime=180..}] run scoreboard players set @s nnhealth_mod 40

execute as @a[team=Red,scores={knocktime=180..}] at @e[tag=RedCampfire] run tp @s ~ ~0.7 ~ -90 0
execute as @a[team=Red,scores={knocktime=180..}] at @e[tag=RedCampfire] run particle flame ~ ~ ~ 0 0 0 0.1 10 force
execute as @a[team=Red,scores={knocktime=180..}] at @e[tag=RedCampfire] run playsound entity.blaze.shoot master @a ~ ~ ~ 0.7 0
execute as @a[team=Red,scores={knocktime=1}] run summon firework_rocket 182 80 8 {Tags:["PointsFW"],LifeTime:50,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;3887386],fade_colors:[I;4312372],has_trail:true,has_twinkle:false}],flight_duration:2}}}}
execute as @a[team=Red,scores={knocktime=1}] run scoreboard players add $GreenGifts CmdData 4
execute as @a[team=Red,scores={knocktime=180..}] run scoreboard players set @s nnhealth_mod 40

execute as @a[scores={knocktime=180..}] at @s run tp @s @s

execute unless score $keepinv CmdData matches 1 run scoreboard players set @a[scores={knocktime=180..}] snowballammo 0
execute if score $keepinv CmdData matches 1 run scoreboard players set @a[tag=!InVoid,scores={knocktime=180..}] snowballammo 0
execute unless score $keepinv CmdData matches 1 as @a[team=Green,scores={knocktime=180..}] run clear @s #snowski:powerups
execute unless score $keepinv CmdData matches 1 as @a[team=Red,scores={knocktime=180..}] run clear @s #snowski:powerups