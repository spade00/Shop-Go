package handlers

import (
	"Shop/internal/models/view"
	"Shop/pkg/queries"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetShopCarInfo(c *gin.Context) {
	var Info []view.ShopCarInfo
	queries.QueryshopCarInfo(&Info)
	jsonS, err := json.Marshal(Info)
	if err != nil {
		fmt.Println(err)
	}
	c.JSON(http.StatusOK, string(jsonS))
}
