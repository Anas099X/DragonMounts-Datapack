
#dragon damage
execute store result score @s dragon.damage run data get entity @s HurtTime 1

execute at @s if score @s dragon.damage matches 4..7 run playsound minecraft:entity.ender_dragon.hurt neutral @a ~ ~ ~ 1 1.7
execute if score @s dragon.damage matches 4.. on passengers on passengers run item modify entity @s container.0 animated_java:damage_tint
execute if score @s dragon.damage matches 0 on passengers on passengers run item modify entity @s container.0 animated_java:tint_reset


#tranistion to adult
execute as @s[nbt={Age:0}] on passengers run function animated_java:dragonmounts/animations/baby/stop
execute as @s[nbt={Age:0}] on passengers run tag @s remove aj.dragonmounts.animation.baby.playing
execute as @s[nbt={Age:0}] on passengers run tag @s add dragonmounts.ai.baby_to_adult
execute as @s[nbt={Age:0}] on passengers run ride @s dismount
execute as @s[nbt={Age:0}] run function animated_java:dragonmounts/ai/baby_phase/tranistion
execute as @s[nbt={Age:0}] run tp @s ~ -200 ~
