extends Area

var detect = false
#var first = true
var diff_vector = Vector3()

func _ready():
	print("in " + str(transform.basis.x) + str(transform.basis.z) + str(transform.basis))

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	
	if event is InputEventMouseButton:
		if event.pressed:
			var local_click = to_local(click_position * Vector3(1.0, 0.0, 1.0))
			var norm_local_click = local_click.normalized()
			diff_vector = transform.basis.z - norm_local_click
			var look_at_lokal = -1 * (norm_local_click + diff_vector)
			print("kp " + str(look_at_lokal), transform.basis.z)
			look_at(to_global(look_at_lokal), Vector3(0, 1, 0))
			detect = true
		else:
			detect = false
			#first = false
			var local_click = to_local(click_position * Vector3(1.0, 0.0, 1.0))
			var norm_local_click = local_click.normalized()
			diff_vector = transform.basis.z - norm_local_click
			var look_at_lokal = -1 * (norm_local_click + diff_vector)
			stop_follow_mouse(look_at_lokal)
	if (event is InputEventMouseMotion) and detect:				# and first:
		var local_move = to_local(click_position * Vector3(1.0, 0.0, 1.0))
		var norm_local_move = local_move.normalized()
		var look_at_lokal = -1 * (norm_local_move + diff_vector)
		# print("mp " + str(look_at_lokal), transform.basis.z)
		look_at(to_global(look_at_lokal), Vector3(0, 1, 0))

	return true

func _on_Area_mouse_exited():
	stop_follow_mouse()
	
func stop_follow_mouse(klick=null):
	detect = false
	transform = transform.orthonormalized()
	print("out " + str(transform.basis.x) + str(transform.basis.z) + str(transform.basis))
