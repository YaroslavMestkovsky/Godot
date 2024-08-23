extends Control


@onready var menu: Window = $menu_win;
@onready var settingsBtn: Button = $settings_btn;
@onready var fullModeCbtn: CheckButton = $menu_win/menu_top_vbox/full_mode_cbtn;
@onready var exitBtn: Button = $menu_win/menu_bottom_vbox/exit_btn;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect_controls();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func connect_controls():
	fullModeCbtn.connect('toggled', _on_full_mode_cbtn_pressed);
	settingsBtn.connect('pressed', toggle_menu.bind(true));
	exitBtn.connect('pressed', _on_exit_btn_pressed);
	menu.connect('close_requested', toggle_menu.bind(false))


func toggle_menu(_visible: bool = false) -> void:
	if _visible:
		menu.popup_centered();
	else:
		menu.hide();


func _on_full_mode_cbtn_pressed(toggled: bool = false) -> void:
		if toggled:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_exit_btn_pressed() -> void:
	get_tree().quit();
