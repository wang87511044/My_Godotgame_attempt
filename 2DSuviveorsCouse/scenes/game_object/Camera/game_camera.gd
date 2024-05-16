extends Camera2D

var target_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()#启动当前摄像机


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acquire_target()
	# global_position = global_position.lerp(target_position， .5）
	global_position = global_position.lerp(target_position,1.0 - exp(-delta * 30))
	#使镜头更加平滑，让镜头以一定的比例进行缓速移动到目标位置  后面为数学公式？大概？
	
	
func acquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player") #获取group当中的所有结点  将返回一个数组
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D   #因为godot 无法动获取player的类型 所以要手动添加
		target_position = player.global_position

