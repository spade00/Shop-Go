package view

type ShopCarInfo struct {
	ShopCarInfoID int    `json:"shop_car_id" db:"shop_car_id"`
	CreatTime     string `json:"creat_time" db:"creat_time"`
	ProductId     int    `json:"product_id" db:"product_id"`
	Title         string `json:"title" db:"title"`
	Price         string `json:"price" db:"price"`
	Count         string `json:"count" db:"count"`
	UserId        int    `json:"user_id" db:"user_id"`
	Tag           string `json:"tag" db:"tag"`
	Img           string `json:"img" db:"img"`
}

func (table *ShopCarInfo) TableName() string {
	return "shopcarinfo"
}
