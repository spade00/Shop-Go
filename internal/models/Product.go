package models

type Product struct {
	ProductId         int    `json:"product_id" db:"product_id"`
	Title             string `json:"title" db:"title"`
	Price             int    `json:"price" db:"price"`
	CategorId         int    `json:"categori_id" db:"categori_id"`
	Img               string `json:"img" db:"img"`
	Description       string `json:"description" db:"description"`
	Tag               string `json:"tag" db:"tag"`
	IntroductionToThe string `json:"introductionToThe" db:"introductionToThe"`
}

func (table *Product) TableName() string {
	return "product"
}
