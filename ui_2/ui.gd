extends Control

const FULL_SCREEN_CBX_ID: int = 0;
const EXIT_BTN_ID: int = 2;

@onready var mainMenu: MenuButton = $main_menu;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect_controls();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func connect_controls() -> void:
	mainMenu.get_popup().id_pressed.connect(_on_menu_item_pressed);


func _on_menu_item_pressed(id) -> void:
	"""Используем для меню специальную кнопку с выпадающим списком. По какой-то причине, в ней не реализовано изменение состояния чекбокса - делаем вручную."""

	match(id):
		FULL_SCREEN_CBX_ID:
			var checked: bool = mainMenu.get_popup().is_item_checked(id);
			mainMenu.get_popup().set_item_checked(id, !checked);

			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) \
			if !checked \
			else DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

		EXIT_BTN_ID:
			get_tree().quit();
