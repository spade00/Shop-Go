package database

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

var Db = MysqlConn()

func MysqlConn() *sqlx.DB {
	conn, err := sqlx.Open("mysql", "root:000000@tcp(localhost:3306)/shop")
	if err != nil {
		fmt.Println("数据库连接失败", err)
	}
	return conn
}
