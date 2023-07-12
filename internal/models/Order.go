package models

type Order struct {
	OrderID    int    `json:"orderID"`
	CreateTime string `json:"createTime"`
	UserId     int    `json:"userId"`
	Status     string `json:"status"`
}

func (table *Order) TableName() string {
	return "Order"
}
