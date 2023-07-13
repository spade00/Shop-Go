package routers

import (
	"Shop/api/handlers"
	"github.com/gin-gonic/gin"
)

func Router() *gin.Engine {
	r := gin.Default()
	userGroup := r.Group("/shop")
	{
		userGroup.GET("/Product", handlers.GetProduct)
		userGroup.GET("/ShopCar", handlers.GetShopCarInfo)
		userGroup.PUT("/addShopCar", handlers.PutShopCar)
		userGroup.DELETE("/DeleteShopCar", handlers.DeleteShopCar)
		userGroup.GET("/GetOrder", handlers.GetOrder)
		userGroup.POST("/PostOrder", handlers.PostOrder)
	}
	return r
}
