package queries

import (
	"Shop/internal/models/view"
	"Shop/pkg/database"
	"fmt"
	"time"
)

func PostOrder(Order *[]view.ShopCarInfo) {
	for _, data := range *Order {
		// 执行数据库插入操作，将data插入到数据库中
		currentTime := time.Now().Unix()
		datetime := time.Unix(currentTime, 0).Format("2006-01-02 15:04:05")
		ret, err := database.Db.Exec("INSERT INTO `order`(create_time, user_id, product_id, status, count, price) VALUES(?,?,?,?,?,?)", datetime, 1, data.ProductId, "已完成", data.Count, data.Count*data.Price)
		if err != nil {
			fmt.Println(err)
			return
		}
		fmt.Println(ret)
		res, err := database.Db.Exec("delete from `shop-car` where shop_car_id=?", data.ShopCarInfoID)
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

}
