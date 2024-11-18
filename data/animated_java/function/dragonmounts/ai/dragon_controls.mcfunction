execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"jump":true}}}} on vehicle run attribute @s[tag=dragonmounts.ai] minecraft:gravity base set -0.06
execute on vehicle if entity @s[tag=dragonmounts.ai,nbt={OnGround:1b}] run data modify entity @s NoGravity set value 0
execute on vehicle if entity @s[tag=dragonmounts.ai,nbt={OnGround:1b}] run attribute @s minecraft:movement_speed base set 0.1
execute on vehicle if entity @s[tag=dragonmounts.ai,nbt={OnGround:0b}] run attribute @s minecraft:movement_speed base set 1.2
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"jump":false}}}} on vehicle if entity @s[tag=dragonmounts.ai,nbt={OnGround:0b},] run attribute @s minecraft:gravity base set 0
#execute if entity @s[x_rotation=-60.0..-90.0] on vehicle run data merge entity @s {Motion:[0.0,1.0,0.0]}
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":true}}}} if entity @s[x_rotation=40..90] on vehicle run attribute @s[tag=dragonmounts.ai] minecraft:gravity base set 0.025
