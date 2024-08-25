extends Camera3D

@onready var camera_socket: Node3D = $action_camera;
@onready var camera: Camera3D = $action_camera/Camera3D;
# mcb_click, mcb_scroll_down, mcb_scroll_up
# Удерживается ли ср. кнопка мыши
var mdl_btn_helding: bool = false;

var mouse_last_position: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	check_if_mcb_pressed();
	move_camera(delta);


func check_if_mcb_pressed() -> void:
	if Input.is_action_pressed('mcb_click'): mdl_btn_helding = true;
	else: mdl_btn_helding = false;


func move_camera(delta: float):
	if mdl_btn_helding:
		print(camera_socket.rotation.x)
		#camera_socket.rotation
		mouse_last_position = get_viewport().get_mouse_position()


func camera_move_to_mouse_offset(delta: float) -> void:
	'''Двигает камеру мышкой.'''
	pass
#	if !camera_can_move_by_mouse_offset or !camera_is_moving_mouse: return

	#var mouse_offset: Vector2 = get_viewport().get_mouse_position()
	#mouse_offset = mouse_last_position - mouse_offset
	#mouse_last_position = get_viewport().get_mouse_position()
#
	#camera_base_rotate_left_right(delta, mouse_offset.x, 6)
	#camera_socket_rotate_x(delta, mouse_offset.y, 6)
