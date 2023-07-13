package handlers

import (
	"Shop/internal/models/view"
	"fmt"
	"github.com/gin-gonic/gin"
)

func PostOrder(c *gin.Context) {
	type ArrayData struct {
		Values []view.ShopCarInfo `json:"data"`
	}
	var data ArrayData
	_ = c.ShouldBindJSON(&data)
	fmt.Println(data.Values[0].ProductId)
}
