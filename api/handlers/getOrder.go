package handlers

import (
	"Shop/internal/models/view"
	"Shop/pkg/queries"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetOrder(c *gin.Context) {
	var Info []view.OrderProduct
	queries.GetOrder(&Info)
	jsonS, err := json.Marshal(Info)
	if err != nil {
		fmt.Println(err)
	}
	c.JSON(http.StatusOK, string(jsonS))
}
