
#shift type
$item replace entity @s weapon.mainhand with armor_stand[item_name={"color":"light_purple","text":"Hatchable Dragon Egg"},max_stack_size=1,item_model="animated_java:blueprint/dragonmounts_eggs/egg",custom_model_data={strings:[$(variant)]},entity_data={id:"minecraft:armor_stand",HasVisualFire:0b,DisabledSlots:1118225,Invulnerable:1b,ShowArms:1b,Small:1b,Marker:0b,Invisible:1b,Tags:["dragonmounts.ai.egg","dragonmounts.ai.$(variant)"],equipment:{head:{id:"minecraft:diamond",count:1,components:{"minecraft:item_model":"animated_java:blueprint/dragonmounts_eggs/egg","minecraft:custom_model_data":{strings:[$(variant)]}}},mainhand:{id:"minecraft:barrier",count:1,components:{"minecraft:item_model":"minecraft:air","minecraft:custom_data":{dragonegg_placeholder:true}}}},data:{args: {variant:$(variant),animation:baby,start_animation:true}}}] 1
$item replace entity @s armor.head with armor_stand[item_name={"color":"light_purple","text":"Hatchable Dragon Egg"},max_stack_size=1,item_model="animated_java:blueprint/dragonmounts_eggs/egg",custom_model_data={strings:[$(variant)]},entity_data={id:"minecraft:armor_stand",HasVisualFire:0b,DisabledSlots:1118225,Invulnerable:1b,ShowArms:1b,Small:1b,Marker:0b,Invisible:1b,Tags:["dragonmounts.ai.egg","dragonmounts.ai.$(variant)"],equipment:{head:{id:"minecraft:diamond",count:1,components:{"minecraft:item_model":"animated_java:blueprint/dragonmounts_eggs/egg","minecraft:custom_model_data":{strings:[$(variant)]}}},mainhand:{id:"minecraft:barrier",count:1,components:{"minecraft:item_model":"minecraft:air","minecraft:custom_data":{dragonegg_placeholder:true}}}},data:{args: {variant:$(variant),animation:baby,start_animation:true}}}] 1

#say 1

#remove old tag/data and add new tag/data
$tag @s[type=armor_stand] add dragonmounts.ai.$(variant)
$tag @s[type=armor_stand] remove dragonmounts.ai.$(old)
$data modify entity @s[type=armor_stand] data.args.variant set value "$(variant)"
