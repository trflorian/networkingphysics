extends Node

const IP_ADDRESS := "localhost"
const PORT := 8765
const MAX_CLIENTS:= 2

func _ready() -> void:
	multiplayer.connected_to_server.connect(_on_connected_to_server)
	
	var args = Array(OS.get_cmdline_args())
	if "server" in args:
		_start_server()
	else:
		_start_client()

func _start_client() -> void:
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(IP_ADDRESS, PORT)
	print(error)
	multiplayer.multiplayer_peer = peer

func _start_server() -> void:
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(PORT, MAX_CLIENTS)
	print(error)
	multiplayer.multiplayer_peer = peer
	print("Server started!")

func _on_connected_to_server() -> void:
	print("Connected to server!")
