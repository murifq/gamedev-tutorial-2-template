extends Area2D

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if body.name == "GreenShip":
		get_tree().change_scene_to_file("res://scenes/Congratulation.tscn")


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.name == "GreenShip":
		get_tree().change_scene_to_file("res://scenes/Congratulation.tscn")
