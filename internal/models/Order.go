package models

type Order struct {
	OrderID    int    `json:"order_id"`
	CreateTime string `json:"create_time"`
	UserId     int    `json:"user_id"`
	Status     string `json:"status"`
	Count      string `json:"count"`
}

func (table *Order) TableName() string {
	return "Order"
}
