package handlers

import (
	"Shop/pkg/queries"
	"fmt"
	"github.com/gin-gonic/gin"
)

func PutShopCar(c *gin.Context) {
	type ShopCarData struct {
		ProductID int    `json:"ProductID"`
		Tag       string `json:"Tag"`
	}
	var data ShopCarData
	_ = c.ShouldBindJSON(&data)
	fmt.Println("data", data)
	queries.AddShopCar(data.Tag, data.ProductID)
	c.JSON(200, "添加成功")
}
