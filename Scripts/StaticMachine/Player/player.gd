class_name Player
extends CharacterBody3D


@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera
@onready var state_machine: State = $State_Machine
@onready var move_component: Node = $Move_Component

var hit_dagger = 8

signal player_hit

const SENSIVITY = 0.001


func _ready() -> void:
	state_machine.init(self , move_component)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)


func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSIVITY)
		camera.rotate_x(-event.relative.y * SENSIVITY)
	state_machine.process_input(event)


func hit(dir):

	emit_signal("player_hit")
	
	
