package queries

import (
	"Shop/internal/models"
	"Shop/internal/models/view"
	"Shop/pkg/database"
	"fmt"
)

func GetProduct(data *[]models.Product, data1 *[]models.Product, data2 *[]models.Product) {
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

func GetshopCarInfo(data *[]view.ShopCarInfo) {
	err := database.Db.Select(data, "select * from shopcarinfo where user_id=1")
	if err != nil {
		fmt.Println(err)
		return
	}
}
func GetOrder(data *[]view.OrderProduct) {
	err := database.Db.Select(data, "select * from `order_product` where user_id=1")
	if err != nil {
		fmt.Println(err)
		return
	}
}
