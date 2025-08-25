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


#dragon saddle
execute if items entity @s saddle saddle run item replace entity @s saddle with saddle[equippable={slot:"saddle",asset_id:"/empty"}] 1
execute if items entity @s saddle saddle on passengers on passengers run data modify entity @s[type=minecraft:item_display,tag=aj.dragonmounts.bone.saddle] view_range set value 1.0
execute unless items entity @s saddle saddle on passengers on passengers run data modify entity @s[type=minecraft:item_display,tag=aj.dragonmounts.bone.saddle] view_range set value 0.0

execute as @a if items entity @s player.cursor saddle[equippable={slot:"saddle",asset_id:"/empty"}] run item replace entity @s player.cursor with saddle 1


#dragon damage
execute store result score @s dragon.damage run data get entity @s HurtTime 1

execute if score @s dragon.damage matches 4..7 run playsound minecraft:entity.ender_dragon.hurt neutral @a ~ ~ ~ 1 1
execute if score @s dragon.damage matches 4.. on passengers on passengers run item modify entity @s container.0 animated_java:damage_tint
execute if score @s dragon.damage matches ..3 on passengers on passengers run item modify entity @s container.0 animated_java:tint_reset



#dragon sounds
scoreboard players add @s dragon.fly.sounds 1
scoreboard players add @s dragon.idle.sounds 1


#fly sounds
execute if score @s[nbt={OnGround:0b}] dragon.fly.sounds matches 1 on passengers if entity @s[tag=aj.dragonmounts.root,tag=aj.dragonmounts.animation.fly.playing] run playsound minecraft:entity.ender_dragon.flap ambient @a ~ ~ ~ 1 1

#hover sounds
execute if score @s[nbt={OnGround:0b}] dragon.fly.sounds matches 1 on passengers if entity @s[tag=aj.dragonmounts.root,tag=aj.dragonmounts.animation.hover.playing] run playsound minecraft:entity.ender_dragon.flap ambient @a ~ ~ ~ 1 1
execute if score @s[nbt={OnGround:0b}] dragon.fly.sounds matches 4 on passengers if entity @s[tag=aj.dragonmounts.root,tag=aj.dragonmounts.animation.hover.playing] run playsound minecraft:entity.ender_dragon.flap ambient @a ~ ~ ~ 1 1

#idle sounds
execute if score @s[nbt={OnGround:0b}] dragon.idle.sounds matches 1 run playsound minecraft:entity.ender_dragon.growl ambient @a ~ ~ ~ 1 0.8

# reset score counter
execute if score @s dragon.fly.sounds matches 6.. run scoreboard players set @s dragon.fly.sounds 0
execute if score @s dragon.idle.sounds matches 100.. run scoreboard players set @s dragon.idle.sounds 0
#effect give @s invisibility infinite 1 true