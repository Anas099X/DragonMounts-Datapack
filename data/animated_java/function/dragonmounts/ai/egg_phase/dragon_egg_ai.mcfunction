# egg hatching timer
scoreboard players add @s dragon_egg_hatching 1

execute if score @s dragon_egg_hatching matches ..200 run particle minecraft:reverse_portal ~ ~ ~ 0.1 0.015 0.1 0.02 3 force

execute if score @s dragon_egg_hatching matches 199 run playsound block.sniffer_egg.hatch ambient @a ~ ~ ~ 1 0.8

execute if score @s dragon_egg_hatching matches 200 run function animated_java:dragonmounts/summon with entity @s data

execute if score @s dragon_egg_hatching matches 201.. on passengers run kill @s

execute if score @s dragon_egg_hatching matches 201.. run kill @s

#player iteraction
$execute if items entity @s weapon.mainhand barrier[custom_data={dragonegg_placeholder:true}] run item replace entity @s weapon.mainhand with armor_stand[item_name={"color":"light_purple","text":"Hatchable Dragon Egg"},item_model="animated_java:blueprint/dragonmounts_eggs/egg",custom_model_data={strings:[$(variant)]},entity_data={id:"minecraft:armor_stand",DisabledSlots:1118225,Invulnerable:1b,ShowArms:1b,Small:1b,Marker:0b,Invisible:1b,Tags:["dragonmounts.ai.egg","dragonmounts.ai.$(variant)"],equipment:{head:{id:"minecraft:diamond",count:1,components:{"minecraft:item_model":"animated_java:blueprint/dragonmounts_eggs/egg","minecraft:custom_model_data":{strings:[$(variant)]}}},mainhand:{id:"minecraft:barrier",count:1,components:{"minecraft:item_model":"minecraft:air","minecraft:custom_data":{dragonegg_placeholder:true}}}},data:{args: {variant:$(variant),animation:baby,start_animation:true}}}]
execute unless items entity @s weapon.mainhand * run tp ~ ~-3000 ~