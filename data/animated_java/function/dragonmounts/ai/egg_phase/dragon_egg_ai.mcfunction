# egg hatching timer
scoreboard players add @s dragon_egg_hatching 1

execute if score @s dragon_egg_hatching matches ..200 run particle dust{color:[0.871,0.486,0.106],scale:1} ~ ~0.5 ~ 0.35 0.25 0.35 7 1 force

$execute if score @s dragon_egg_hatching matches 200 run function animated_java:dragonmounts/summon {args: {variant:$(dragon_variant),animation:baby,start_animation:true}}

execute if score @s dragon_egg_hatching matches 201.. on passengers run kill @s

execute if score @s dragon_egg_hatching matches 201.. run kill @s

