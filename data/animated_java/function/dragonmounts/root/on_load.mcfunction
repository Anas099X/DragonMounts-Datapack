# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[tag=aj.dragonmounts.root] run return 0
execute on passengers if entity @s[tag=aj.dragonmounts.data] unless data entity @s {data:{rigHash: 'ea9f99c0b78c811365a7f95dc7ccb7c3a8a438d3ba363ddd0a29fd57fdffb233'}} on vehicle run function animated_java:dragonmounts/root/zzz/0
scoreboard players set @s aj.is_rig_loaded 1