package test

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"testing"
)

func TestMysql(t *testing.T) {
	conn, err := sqlx.Open("mysql", "root:000000@tcp(localhost:3306)/shop")
	if err != nil {
		t.Fail()
	}
	print(conn)
}
