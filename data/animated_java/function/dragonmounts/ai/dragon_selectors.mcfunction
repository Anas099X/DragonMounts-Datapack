execute on passengers if entity @s[type=player] run function animated_java:dragonmounts/ai/dragon_controls

execute at @s if entity @p[distance=..16] run function animated_java:dragonmounts/ai/dragon_ai

execute as @s[tag=!dragonmounts.ai.out_of_range,nbt={OnGround:1b}] at @s unless entity @p[distance=..16] on passengers if entity @s[tag=aj.dragonmounts.root] run function animated_java:dragonmounts/ai/stop_animation

