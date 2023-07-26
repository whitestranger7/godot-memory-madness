extends Node

signal route_changed

enum Routes {
	MENU,
	GAME,
}


var selected_route: Routes = Routes.MENU


func navigate(route: Routes) -> void:
	selected_route = route
	route_changed.emit()
