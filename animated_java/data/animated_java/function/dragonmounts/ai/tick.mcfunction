execute as @e[type=camel,tag=dragonmounts.ai] on passengers if entity @s[type=player] run function animated_java:dragonmounts/ai/dragon_controls

execute as @e[type=camel,tag=dragonmounts.ai] run function animated_java:dragonmounts/ai/dragon_ai
