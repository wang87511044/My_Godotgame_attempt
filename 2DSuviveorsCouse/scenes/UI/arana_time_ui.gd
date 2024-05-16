extends CanvasLayer

@export var arena_time_manager:Node
@onready var lable = $MarginContainer/Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if arena_time_manager ==null:
		return
	var time_elapsed =arena_time_manager.get_time_elapsed()
	lable.text=format_seconds_to_string(time_elapsed)
	
func  format_seconds_to_string(seconds: float):
	var minutes = floor(seconds / 60)
	var second = seconds - minutes * 60
	return str("%02d" % (minutes)) + " : " + ( "%02d" % (floor(second))) 
