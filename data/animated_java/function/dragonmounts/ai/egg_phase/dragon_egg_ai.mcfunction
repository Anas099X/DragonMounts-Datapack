# egg hatching timer
scoreboard players add @s dragon_egg_hatching 1

execute if score @s dragon_egg_hatching matches ..200 run particle minecraft:reverse_portal ~ ~ ~ 0.1 0.015 0.1 0.02 3 force

execute if score @s dragon_egg_hatching matches 199 run playsound block.sniffer_egg.hatch ambient @a ~ ~ ~ 1 0.8

execute if score @s dragon_egg_hatching matches 200 run function animated_java:dragonmounts/summon with entity @s data

execute if score @s dragon_egg_hatching matches 201.. on passengers run kill @s

execute if score @s dragon_egg_hatching matches 201.. run kill @s

#player iteraction
$execute if items entity @s weapon.mainhand barrier[custom_data={dragonegg_placeholder:true}] run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:$(variant),old:""}


#egg variant conversion

#water
$execute if score @s dragon_egg_hatching matches 30 at @s if biome ~ ~ ~ #is_ocean run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:water,old:$(variant)}
$execute if score @s dragon_egg_hatching matches 30 at @s if biome ~ ~ ~ #is_river run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:water,old:$(variant)}

#ice
$execute if score @s dragon_egg_hatching matches 30 at @s if biome ~ ~ ~ #c:is_snowy run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:ice,old:$(variant)}
$execute if score @s dragon_egg_hatching matches 30 at @s if biome ~ ~ ~ #c:is_icy run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:ice,old:$(variant)}


#fire
$execute if score @s dragon_egg_hatching matches 30 at @s if biome ~ ~ ~ #c:is_cave if block ~ ~-1 ~1 lava if block ~ ~-1 ~-1 lava if block ~1 ~-1 ~ lava if block ~-1 ~-1 ~ lava run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:fire,old:$(variant)}

#forest
$execute if score @s dragon_egg_hatching matches 30 at @s if biome ~ ~ ~ #is_forest run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:forest,old:$(variant)}

#end
$execute if score @s dragon_egg_hatching matches 30 at @s if biome ~ ~ ~ #is_end run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:end,old:$(variant)}


#remove armor stand
execute unless items entity @s weapon.mainhand * run tp ~ ~-3000 ~