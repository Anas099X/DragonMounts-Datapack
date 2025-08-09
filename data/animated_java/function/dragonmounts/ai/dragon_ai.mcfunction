data modify entity @s[nbt={NoAI:1b}] NoAI set value 0b
tag @s[tag=dragonmounts.ai.out_of_range] remove dragonmounts.ai.out_of_range

execute unless entity @p[nbt={RootVehicle:{Entity:{Tags:["dragonmounts.ai"]}}},distance=..3,limit=1] run attribute @s minecraft:gravity base set 0.08
execute unless entity @p[nbt={RootVehicle:{Entity:{Tags:["dragonmounts.ai"]}}},distance=..3,limit=1] run attribute @s minecraft:movement_speed base set 0.123


#cancel camel sitting

execute store result score @s camel_pose run data get entity @s LastPoseTick 1


#idle
execute if entity @s[nbt={Motion:[0.0,-0.0784000015258789,0.0]},nbt={OnGround:1b}] unless score @s camel_pose matches -2000000..-5000 on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.idle.playing] run function animated_java:dragonmounts/animations/idle/tween {to_frame: 10, duration: 10}
execute if entity @s[nbt={OnGround:1b}] if predicate {condition:"minecraft:entity_properties",terms:[],entity:"this",predicate:{passenger:{type:"minecraft:player",movement:{horizontal_speed:0}}}} on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.idle.playing] run function animated_java:dragonmounts/animations/idle/tween {to_frame: 10, duration: 10}

#walk
execute if entity @s[nbt=!{Motion:[0.0,-0.0784000015258789,0.0]},nbt={OnGround:1b}] unless predicate {condition:"minecraft:entity_properties",terms:[],entity:"this",predicate:{passenger:{type:"minecraft:player",movement:{horizontal_speed:0}}}} on passengers if entity @s[type=item_display,tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.walk.playing] run function animated_java:dragonmounts/animations/walk/tween {to_frame: 0, duration: 10}

#sit
execute if entity @s[nbt={Motion:[0.0,-0.0784000015258789,0.0]},nbt={OnGround:1b}] if score @s camel_pose matches -2000000..-5000 on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.sit.playing] at @s run function animated_java:dragonmounts/animations/sit/tween {to_frame: 0, duration: 10}

#hover
execute if entity @s[nbt={OnGround:0b}] on passengers if entity @s[type=player] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":false}}}} on vehicle on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.hover.playing] run function animated_java:dragonmounts/animations/hover/tween {to_frame: 6, duration: 3}

#fly
execute if entity @s[nbt={OnGround:0b}] on passengers if entity @s[type=player] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":true}}}} on vehicle on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.fly.playing] run function animated_java:dragonmounts/animations/fly/tween {to_frame: 10, duration: 2}


#effect give @s invisibility infinite 1 true