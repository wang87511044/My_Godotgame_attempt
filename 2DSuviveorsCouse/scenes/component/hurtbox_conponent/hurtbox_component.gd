extends Area2D
class_name HurtboxComponent

@export var health_component: Node

func _ready():
	area_entered.connect(on_area_entered)
	
func on_area_entered(other_area:Area2D):
	if not other_area is HitboxComponent:  #如果碰撞到的区域不是玩家技能的命中区域直接返回
		return

	if health_component == null:
		return
		
	var hitbox_component = other_area as HitboxComponent #设定命中元件
	health_component.damage(hitbox_component.damage) #抓取命中组件中的伤害
