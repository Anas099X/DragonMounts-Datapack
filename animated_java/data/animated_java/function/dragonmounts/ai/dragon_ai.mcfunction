execute at @s unless entity @p[nbt={RootVehicle:{Entity:{Tags:["dragonmounts.ai"]}}},distance=..3,limit=1] run attribute @s minecraft:gravity base set 0.08
execute at @s unless entity @p[nbt={RootVehicle:{Entity:{Tags:["dragonmounts.ai"]}}},distance=..3,limit=1] run attribute @s minecraft:movement_speed base set 0.123
execute on passengers as @s[tag=aj.dragonmounts.root] on vehicle at @s on passengers run rotate @s[tag=aj.dragonmounts.root] ~ 0


#idle
execute if entity @s[nbt={Motion:[0.0,-0.0784000015258789,0.0]},nbt={OnGround:1b}] on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.idle.playing] run function animated_java:dragonmounts/animations/idle/tween {to_frame: 10, duration: 10}

#walk
execute if entity @s[nbt=!{Motion:[0.0,-0.0784000015258789,0.0]},nbt={OnGround:1b}] on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.walk.playing] run function animated_java:dragonmounts/animations/walk/tween {to_frame: 0, duration: 10}

#sit
execute if entity @s[nbt={Motion:[0.0,-0.0784000015258789,0.0]},nbt={OnGround:1b}] on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.sit.playing] at @s unless block ~ ~-1.5 ~ air run function animated_java:dragonmounts/animations/sit/tween {to_frame: 0, duration: 10}

#hover
execute if entity @s[nbt={OnGround:0b}] on passengers if entity @s[type=player] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":false}}}} on vehicle on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.hover.playing] run function animated_java:dragonmounts/animations/hover/tween {to_frame: 30, duration: 5}

#fly
execute if entity @s[nbt={OnGround:0b}] on passengers if entity @s[type=player] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"forward":true}}}} on vehicle on passengers if entity @s[tag=aj.dragonmounts.root,tag=!aj.dragonmounts.animation.fly.playing] run function animated_java:dragonmounts/animations/fly/tween {to_frame: 20, duration: 5}


effect give @s invisibility infinite 1 true