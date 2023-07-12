package handlers

import (
	"Shop/internal/models"
	"Shop/pkg/queries"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetProduct(c *gin.Context) {
	type ProductData struct {
		Switch []models.Product
		Ps4    []models.Product
		Ps5    []models.Product
	}
	var Switch []models.Product
	var Ps4 []models.Product
	var Ps5 []models.Product
	queries.QueryProduct(&Switch, &Ps4, &Ps5)
	data := &ProductData{
		Switch,
		Ps4,
		Ps5,
	}
	jsonS, err := json.Marshal(data)
	if err != nil {
		fmt.Println(err)
	}
	c.JSON(http.StatusOK, string(jsonS))
}
