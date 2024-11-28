extends Panel

@onready var item_visuals: Sprite2D = $CenterContainer/Panel/Item_display

func update(item: InventoryItem):
	if !item:
		item_visuals.visible = false
	else:
		item_visuals.visible = true
		item_visuals.texture = item.texture
