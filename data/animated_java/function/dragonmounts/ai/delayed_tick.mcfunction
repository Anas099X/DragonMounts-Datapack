
#adult dragon
execute as @e[type=camel,sort=random,tag=dragonmounts.ai] run function animated_java:dragonmounts/ai/dragon_selectors_delayed
execute as @e[type=item_display,sort=random,tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.baby.playing,tag=!dragonmounts.ai.baby_to_adult] unless predicate {condition:"minecraft:entity_properties",terms:[],entity:"this",predicate:{vehicle:{type:"minecraft:camel",nbt:"{Tags:[\"dragonmounts.ai\"]}"}}} run function animated_java:dragonmounts/remove/this

#baby phase to adult phase
execute as @e[type=wolf,sort=random,tag=dragonmounts.ai.baby] run function animated_java:dragonmounts/ai/baby_phase/baby_dragon_ai
execute as @e[type=item_display,sort=random,tag=aj.dragonmounts.root,tag=aj.dragonmounts.animation.baby.playing,tag=!dragonmounts.ai.baby_to_adult] unless predicate {condition:"minecraft:entity_properties",terms:[],entity:"this",predicate:{vehicle:{type:"minecraft:wolf",nbt:"{Tags:[\"dragonmounts.ai.baby\"]}"}}} run function animated_java:dragonmounts/remove/this

#egg phase to baby phase
execute as @e[type=armor_stand,sort=random,tag=dragonmounts.ai.egg] at @s run function animated_java:dragonmounts/ai/egg_phase/dragon_egg_ai with entity @s data.args

#execute as @a at @s if items entity @s weapon.mainhand armor_stand[item_name={"color":"light_purple","text":"Hatchable Dragon Egg"}] if biome ~ ~ ~ #is_ocean run function animated_java:dragonmounts/ai/egg_phase/item_dragon_egg {variant:water}

schedule function animated_java:dragonmounts/ai/delayed_tick 4t