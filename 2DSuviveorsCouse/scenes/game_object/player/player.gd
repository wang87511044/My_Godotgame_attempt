extends CharacterBody2D

const MAX_SPEED = 150  #设置速度
const ACCELERATION_SMOOTHING = 30 #加速平滑度


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_vector= get_movement_vector()
	var direction = movement_vector.normalized() #返回一个长度的向量（归一
	var taget_velocity = MAX_SPEED * direction
	
	velocity =velocity.lerp(taget_velocity,1 - exp(-delta * ACCELERATION_SMOOTHING))
	
	move_and_slide() #自动清零碰撞方向
	
	
	
	
	
	
func get_movement_vector():
	var movement_vector =Vector2.ZERO #定义一个 0,0 的二维向量
	
	var x_movement =Input.get_action_strength("move_right")-Input.get_action_strength("move_left")
	var y_movement =Input.get_action_strength("move_down")-Input.get_action_strength("move_up")
	
	return Vector2(x_movement,y_movement)
