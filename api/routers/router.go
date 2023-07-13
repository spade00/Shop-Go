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
		userGroup.GET("/Order", handlers.GetShopCarInfo)
	}
	return r
}
