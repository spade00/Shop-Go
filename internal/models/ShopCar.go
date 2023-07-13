package models

type ShopCar struct {
	ShopCarId int    `json:"shop-car_id"`
	CreatTime string `json:"creat_time"`
	ProductID int    `json:"product_id"`
	Count     int    `json:"count"`
	Tag       string `json:"tag"`
	UserID    int    `json:"user_id"`
}
