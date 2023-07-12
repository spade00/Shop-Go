package models

type Categori struct {
	Categori int    `json:"categori"`
	Name     string `json:"name"`
}

func (table *Categori) TableName() string {
	return "Categori"
}
