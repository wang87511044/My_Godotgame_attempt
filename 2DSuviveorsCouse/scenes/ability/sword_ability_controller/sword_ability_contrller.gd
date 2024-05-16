extends Node

@export var max_range:float
@export var sword_ability: PackedScene
# @export 指导出变量   后面的PackedScene表示导出的类型

var damage = 35

func _ready():
	#get_node("Timer")
	$Timer.timeout.connect(on_timer_timeout)   #$是get_node的缩写表示连接结点

func on_timer_timeout():
	var player =get_tree().get_first_node_in_group("player") as Node2D
	
	if player==null:
		return
	
	var enemies =get_tree().get_nodes_in_group("enemy")
	enemies =enemies.filter(func(enemy:Node2D):
		return enemy.global_position.distance_squared_to(player.global_position) <pow(max_range,2)
	)
	#filter为过滤器 是我觉得更像选择器， 括号中为条件
	if enemies.size() == 0 :
		return
		
	
	
	#sort_custom 用于通过自定义方法 来排序a，b
	enemies.sort_custom(func(a:Node2D, b:Node2D):
		var a_distance =a.global_position.distance_squared_to(player.global_position)
		var b_distance =b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance        #如果a离玩家距离小于b离玩家距离，返回ture 将a排在b前面
		)
	
	
	var sword_instance =sword_ability.instantiate() as Node2D  #创造剑能力的一个实例，类型为node2d
	player.get_parent().add_child(sword_instance)   #在main添加剑实例
	sword_instance.hitbox_component.damage = damage
	
	
	##添加2D实例默认位置为0,0
	sword_instance.global_position=enemies[0].global_position
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0,TAU))*4
	#使得生成的剑距离enemy有一定的旋转偏移，偏移范围在0~2π之间
	
	
	var enemy_direction = enemies[0].global_position - sword_instance.global_position
	sword_instance.rotation = enemy_direction.angle()
	#使得剑的攻击方向始终可以指向enemy
