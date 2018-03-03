// argument0 == source node

ds_list_clear(directionList)

targetNode = find_nearest_node(target.x, target.y, argument0)
directionList = find_node_path(argument0, targetNode)
