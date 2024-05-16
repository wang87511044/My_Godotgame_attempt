extends Node


@export_range(0,1) var drop_percent:float = .5   #导出变量并且规定变量范围  PS.此处设置默认变量为0.5
@export var vial_scene: PackedScene 
@export var health_component:Node

func _ready():
	(health_component as HealthConmponent).died.connect(on_died)
	
	#将健康元件中的died信号连接至on_died
	
	
	
func on_died():
	if randf() > drop_percent:  #randf（）会生成一个介于0,1之间的数，用这样的方法来使得生成率为百分之五十，天才！
		return
	
	if vial_scene == null: #如果有指定经验瓶场景
		return
		
	if not owner is Node2D: #如果父类不是一个Node2D PS.这里的父类其实就是怪物节点
		return
	
	var spawn_position = (owner as Node2D).global_position   #经验瓶掉落位置
	var vial_instance = vial_scene.instantiate() as Node2D  #实例化一个经验瓶
	owner.get_parent().add_child(vial_instance)   #在场景中添加  等于是 enemy→main→newpoint
	vial_instance.global_position=spawn_position
	
