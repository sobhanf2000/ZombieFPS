extends Node3D


@onready var player_hit: ColorRect = $UI/PlayerHit

func _ready() -> void:
	player_hit.visible = false

func _on_player_player_hit() -> void:
	player_hit.visible = true
	await get_tree().create_timer(0.2).timeout
	player_hit.visible = false
	
