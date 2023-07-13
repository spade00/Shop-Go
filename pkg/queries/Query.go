package queries

import (
	"Shop/internal/models"
	"Shop/internal/models/view"
	"Shop/pkg/database"
	"fmt"
)

func QueryProduct(data *[]models.Product, data1 *[]models.Product, data2 *[]models.Product) {
	fmt.Println(data)
	err := database.Db.Select(data, "select * from product where categori_id=1")
	if err != nil {
		fmt.Println(err)
		return
	}
	err = database.Db.Select(data1, "select * from product where categori_id=2")
	if err != nil {
		fmt.Println(err)
		return
	}
	err = database.Db.Select(data2, "select * from product where categori_id=3")
	if err != nil {
		fmt.Println(err)
		return
	}
}

func QueryshopCarInfo(data *[]view.ShopCarInfo) {
	fmt.Println(data)
	err := database.Db.Select(data, "select * from shopcarinfo where user_id=1")
	if err != nil {
		fmt.Println(err)
		return
	}
}
