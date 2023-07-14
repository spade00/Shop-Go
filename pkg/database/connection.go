package database

import (
	"Shop/config"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

var Db = MysqlConn()

func MysqlConn() *sqlx.DB {
	conn, err := sqlx.Open(config.Mysql.SqlType, config.Mysql.User+":"+config.Mysql.Password+config.Mysql.Port)
	if err != nil {
		fmt.Println("数据库连接失败", err)
	}
	return conn
}
