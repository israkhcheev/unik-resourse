#> Effects
effect give @a saturation infinite 100 true
effect give @a resistance infinite 100 true
effect give @a[tag=!HoldCane] weakness infinite 100 true

#> Scores
scoreboard players reset @a[scores={throwsb=1..}] throwsb

#> Forced gamemodes & player items
execute if score $forcedmodes CmdData matches 1 run gamemode spectator @a[team=Spectator,gamemode=!spectator]
execute if score $forcedmodes CmdData matches 1 run gamemode adventure @a[team=Green,gamemode=!adventure,tag=!Knocked]
execute if score $forcedmodes CmdData matches 1 run gamemode adventure @a[team=Red,gamemode=!adventure,tag=!Knocked]
execute if score $forcedmodes CmdData matches 1 run gamemode adventure @a[team=Lobby,gamemode=!adventure]
execute unless score $forcedmodes CmdData = $forcedmodes CmdData run scoreboard players set $forcedmodes CmdData 1

#> Remove MVP stuff
tag @a[team=!Red,team=!Green] remove giftchamp
tag @a[team=!Red,team=!Green] remove deathchamp
scoreboard players reset @a[team=!Red,team=!Green] giftcollect
scoreboard players reset @a[team=!Red,team=!Green] deathcollect
scoreboard players reset @a[team=!Red,team=!Green] mvpscore

#> UUID tracking
execute as @a store result score @s playerUUID run data get entity @s UUID[0]
execute as @e[type=arrow] store result score @s playerUUID run data get entity @s Owner[0]
execute as @e[type=arrow] at @s run function snowski:game/player/trackuuid
scoreboard players add @a resettracker 0
execute as @a unless entity @s[team=!Red,team=!Green] at @s unless entity @e[type=arrow,distance=..4] unless entity @e[type=area_effect_cloud,tag=BlizzardCloud,distance=..2] run scoreboard players add @s resettracker 1
execute as @a[team=Green,tag=ccdamaged] unless score @s UUIDtracker matches -2147483648..2147483647 at @s if entity @a[team=Red,limit=1,distance=..5,tag=HoldCane,tag=justHit] store result score @s UUIDtracker run scoreboard players get @a[team=Red,limit=1,distance=..5,tag=HoldCane,tag=justHit] playerUUID
execute as @a[team=Red,tag=ccdamaged] unless score @s UUIDtracker matches -2147483648..2147483647 at @s if entity @a[team=Green,limit=1,distance=..5,tag=HoldCane,tag=justHit] store result score @s UUIDtracker run scoreboard players get @a[team=Green,limit=1,distance=..5,tag=HoldCane,tag=justHit] playerUUID
execute as @a unless entity @s[team=!Red,team=!Green] at @s if entity @e[type=arrow,distance=..4] run scoreboard players set @s resettracker 0
execute as @a unless entity @s[team=!Red,team=!Green] at @s if entity @e[type=area_effect_cloud,tag=BlizzardCloud,distance=..4] run scoreboard players set @s resettracker 0
execute as @a[scores={resettracker=50..}] run scoreboard players reset @s UUIDtracker