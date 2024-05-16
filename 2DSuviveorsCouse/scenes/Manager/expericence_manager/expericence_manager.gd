extends Node

signal experience_updated(current_experience:float, target_experience:float)
#自定义信号 经验更新，需要当前经验以及目标经验

const TARGET_EXPERIENCE_GROWTH = 5  #经验条增长

var current_experience = 0 #记录经验
var current_level = 1    #记录当前等级
var target_experience = 5    #目标等级

func _ready():
	GameEvents.experience_vial_collected.connect(on_experience_collection) #连接到 事件中经验收信号


func increment_experience (number: float):
	current_experience = min(current_experience + number , target_experience)
	#取当前经验和经验上限的其中的最小值
	experience_updated.emit(current_experience, target_experience)
	if current_experience == target_experience:
		current_level += 1
		target_experience += TARGET_EXPERIENCE_GROWTH   #经验上限增加
		current_experience = 0  #重置经验条
		experience_updated.emit(current_experience,target_experience)
	
	


func on_experience_collection(number:float): #设置一个信号处理函数 
	increment_experience(number)
	



