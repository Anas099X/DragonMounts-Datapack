#dragon optimization

tag @s remove aj.dragonmounts.animation.walk.playing
tag @s remove aj.dragonmounts.animation.fly.playing
tag @s remove aj.dragonmounts.animation.hover.playing
execute on vehicle run data modify entity @s[type=camel] NoAI set value 1b

#stop animation if dragon is standing
execute if entity @s[tag=!aj.dragonmounts.animation.sit.playing] run function animated_java:dragonmounts/animations/idle/tween {to_frame: 10, duration: 10}
execute if entity @s[tag=!aj.dragonmounts.animation.sit.playing] run function animated_java:dragonmounts/animations/idle/pause

#stop animation if dragon is sitting
execute if entity @s[tag=aj.dragonmounts.animation.sit.playing] run function animated_java:dragonmounts/animations/sit/tween {to_frame: 10, duration: 10}
execute if entity @s[tag=aj.dragonmounts.animation.sit.playing] run function animated_java:dragonmounts/animations/sit/pause



execute on vehicle run tag @s add dragonmounts.ai.out_of_range


#say stopped
