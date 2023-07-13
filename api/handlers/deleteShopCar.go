package handlers

import (
	"Shop/pkg/queries"
	"fmt"
	"github.com/gin-gonic/gin"
	"strconv"
)

func DeleteShopCar(c *gin.Context) {
	id := c.Query("shop_car_id")
	shopCarId, err := strconv.Atoi(id)
	if err != nil {
		fmt.Println("转换失败:", err)
		return
	}
	queries.DeleteShopCar(shopCarId)
}
