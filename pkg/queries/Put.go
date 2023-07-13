package queries

import (
	"Shop/pkg/database"
	"fmt"
	"time"
)

func AddShopCar(tag string, id int) {
	currentTime := time.Now().Unix()
	datetime := time.Unix(currentTime, 0).Format("2006-01-02 15:04:05") //使用时间戳模拟下单时间
	ret, err := database.Db.Exec("INSERT INTO `shop-car`(creat_time, product_id, count, tag, user_id) VALUES(?,?,?,?,?)", datetime, id, 1, tag, 1)
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println(ret)
}
