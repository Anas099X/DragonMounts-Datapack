
#adult dragon
execute as @e[type=camel,sort=random,tag=dragonmounts.ai] run function animated_java:dragonmounts/ai/dragon_selectors

#baby phase to adult phase
execute as @e[type=wolf,sort=random,tag=dragonmounts.ai.baby,nbt={Age:0}] run function animated_java:dragonmounts/ai/baby_phase/baby_dragon_ai

#egg phase to baby phase
execute as @e[type=armor_stand,sort=random,tag=dragonmounts.ai.egg] at @s run function animated_java:dragonmounts/ai/egg_phase/dragon_egg_variants
