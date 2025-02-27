execute as @e[type=camel,limit=24,sort=nearest,tag=dragonmounts.ai] on passengers if entity @s[type=player] run function animated_java:dragonmounts/ai/dragon_controls

execute as @e[type=camel,limit=24,sort=nearest,tag=dragonmounts.ai] at @s if entity @a[distance=..12] run function animated_java:dragonmounts/ai/dragon_ai

execute as @e[type=camel,limit=24,sort=nearest,tag=dragonmounts.ai,tag=!dragonmounts.ai.out_of_range] at @s unless entity @a[distance=..12] on passengers if entity @s[tag=aj.dragonmounts.root] run function animated_java:dragonmounts/ai/stop_animation