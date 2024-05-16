extends Node
class_name  HealthConmponent


signal died


@export var max_health: float=100  #导出最大生命值属性

var current_health   #当前生命值
func damage(damage_amount:float):  #伤害记录
	#current_health - damage_amount   可以刷新当前生命值，但是会导致生命值为零
	if  current_health == null :
		current_health = max_health
	current_health = max(current_health-damage_amount, 0)  
	Callable(check_death).call_deferred()  
	#Callable是一种变体来存贮其他类 Callable存储函数类
	#用call_deferred 会在下一个空闲帧调用Callable中的函数，上述语句调用check_death
	
		

func check_death():
	#防止当前生命值为负数
	if current_health == 0:
		died.emit()   #死亡。发射死亡信号
		owner.queue_free() # owner 拥有者结点，  可以理解为上一级结点者父类？
		


