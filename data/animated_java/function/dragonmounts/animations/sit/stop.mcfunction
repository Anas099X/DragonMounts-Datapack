# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.dragonmounts.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'dragonmounts', 'function_path': 'animated_java:dragonmounts/animations/sit/stop'}
tag @s remove aj.dragonmounts.animation.sit.playing
scoreboard players set @s aj.sit.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:dragonmounts/animations/sit/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only