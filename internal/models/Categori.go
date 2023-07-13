package models

type Categori struct {
	CategoriId int    `json:"categori_id" db:"categori_id"`
	Name       string `json:"name" db:"name"`
}

func (table *Categori) TableName() string {
	return "Categori"
}
