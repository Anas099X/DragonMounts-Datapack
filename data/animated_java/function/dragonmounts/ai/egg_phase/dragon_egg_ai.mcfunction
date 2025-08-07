# egg hatching timer
scoreboard players add @s dragon_egg_hatching 1

$execute if score @s dragon_egg_hatching matches 200 run function animated_java:dragonmounts/summon {args: {variant:$(dragon_variant),animation:baby,start_animation:true}}

execute if score @s dragon_egg_hatching matches 201.. run kill @s

