package models

type User struct {
	UserId  string `db:"user_id"`
	Name    string `db:"name"`
	Phone   string `db:"phone"`
	Address string `db:"address"`
	Avatar  string `db:"avatar"`
}

func (table *User) TableName() string {
	return "user"
}
