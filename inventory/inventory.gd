extends Resource

class_name Inv

signal update

@export var items: Array[InventoryItem]

func insert(item: InventoryItem):
	
	items.push_front(item)
		
	update.emit()
