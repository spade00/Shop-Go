package main

import "Shop/api/routers"

func main() {
	ginsever := routers.Router()
	err := ginsever.Run(":8092")
	if err != nil {
		return
	}
}
