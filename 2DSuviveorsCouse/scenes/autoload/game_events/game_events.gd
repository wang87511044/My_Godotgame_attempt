extends Node
#自定义信号传入numer
signal experience_vial_collected(number:float)  

func emit_experience_vial_collected(number:float): #手机经验
	experience_vial_collected.emit(number)  #emit于发出信号


 
