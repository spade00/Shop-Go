package models

type User struct {
	UserId  string `db:"user_id" json:"user_id"`
	Name    string `db:"name" json:"name"`
	Phone   string `db:"phone" json:"phone"`
	Address string `db:"address" json:"address"`
	Avatar  string `db:"avatar" json:"avatar"`
}

func (table *User) TableName() string {
	return "user"
}
