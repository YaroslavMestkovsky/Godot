extends Camera3D

@onready var camera = $"."
# mcb_click, mcb_scroll_down, mcb_scroll_up 
# Удерживается ли ср. кнопка мыши
var is_mdl_btn_helding: bool = false;


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed('mcb_click'):
		is_mdl_btn_helding = true;
		
