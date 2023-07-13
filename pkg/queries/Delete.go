package queries

import (
	"Shop/pkg/database"
	"fmt"
)

func DeleteShopCar(id int) {
	res, err := database.Db.Exec("delete from `shop-car` where shop_car_id=?", id)
	if err != nil {
		fmt.Println("exec failed, ", err)
		return
	}

	row, err := res.RowsAffected()
	if err != nil {
		fmt.Println("rows failed, ", err)
	}

	fmt.Println("delete succ: ", row)
}
