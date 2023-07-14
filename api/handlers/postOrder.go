package handlers

import (
	"Shop/internal/models/view"
	"Shop/pkg/queries"
	"fmt"
	"github.com/gin-gonic/gin"
)

func PostOrder(c *gin.Context) {
	type ArrayData struct {
		Values []view.ShopCarInfo `json:"data"`
	}
	var data ArrayData
	_ = c.ShouldBindJSON(&data)
	fmt.Println(data)
	if data.Values[0].Count == 0 {
		data.Values[0].Count = 1
	}
	queries.PostOrder(&data.Values)
	c.JSON(200, "购买成功")
}
