package models

type Order struct {
	OrderID    int    `json:"order_id" db:"order_id"`
	ProductID  int    `json:"product_id" db:"product_id"`
	CreateTime string `json:"create_time" db:"create_time"`
	UserId     int    `json:"user_id" db:"user_id"`
	Status     string `json:"status" db:"status"`
	Count      string `json:"count" db:"count"`
	Price      int    `json:"price" db:"price"`
}

func (table *Order) TableName() string {
	return "Order"
}
