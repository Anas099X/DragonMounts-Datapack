# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.dragonmounts.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'dragonmounts', 'function_path': 'animated_java:dragonmounts/animations/pause_all'}
tag @s remove aj.dragonmounts.animation.idle.playing
tag @s remove aj.dragonmounts.animation.walk.playing
tag @s remove aj.dragonmounts.animation.sit.playing
tag @s remove aj.dragonmounts.animation.fly.playing
tag @s remove aj.dragonmounts.animation.hover.playing