extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var gravityscale = 200.0
@export var jumpvelocity = 150.0
var screen_size # Size of the game window.

func get_input():
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("jump"):
		velocity.y-=jumpvelocity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravityscale * delta
		
	get_input()
	
	var motion = velocity*delta
	move_and_slide()
