extends Node2D

var noise = FastNoiseLite.new()

@onready var tileMap:TileMap = $TileMap
var worldSize = 64
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	noise.seed = randi()
	noise.frequency = randf_range(0.01,0.05)
	for x in range(worldSize):
		for y in range(worldSize):
			var noiseValue = noise.get_noise_2d(x,y)
			if noiseValue < 0:
				tileMap.set_cell(0,Vector2(x,y),2,Vector2(3,0))
			elif noiseValue < 0.05:
				tileMap.set_cell(0,Vector2(x,y),2,Vector2(1,0))
			elif noiseValue < 0.1:
				tileMap.set_cell(0,Vector2(x,y),2,Vector2(0,0))
			else:
				tileMap.set_cell(0,Vector2(x,y),0,Vector2(1,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
