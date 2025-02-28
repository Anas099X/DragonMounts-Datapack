#dragon optimization

tag @s remove aj.dragonmounts.animation.walk.playing
tag @s remove aj.dragonmounts.animation.fly.playing
tag @s remove aj.dragonmounts.animation.hover.playing
tag @s remove aj.dragonmounts.animation.sit.playing
execute on vehicle run data modify entity @s[type=camel] LastPoseTick set value 1000L
execute on vehicle run data modify entity @s[type=camel] NoAI set value 1b
function animated_java:dragonmounts/animations/idle/tween {to_frame: 10, duration: 10}
function animated_java:dragonmounts/animations/idle/pause
execute on vehicle run tag @s add dragonmounts.ai.out_of_range


#say stopped
