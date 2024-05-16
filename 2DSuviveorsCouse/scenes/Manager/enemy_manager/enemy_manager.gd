extends Node

const SPAWN_RADIUS =330 #窗口大小为640 所以生成敌人的半径应该至少为320 为了使得让敌人从面出现，选择330

@export var basic_enemy_scene: PackedScene


func _ready():
	$Timer.timeout.connect(on_time_timeout)
	
		
	
	

func on_time_timeout():
	var player =get_tree().get_first_node_in_group("player") as Node2D
	
	if player==null:
		return
	
	var random_direction =Vector2.RIGHT.rotated(randf_range(0,TAU)) #产生一个随机方向
	var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)#产生一个落点
	

	var enemy_instance =basic_enemy_scene.instantiate() as Node2D
	
	get_parent().add_child(enemy_instance)
	enemy_instance.global_position = spawn_position
	
	
	
		


