package config

type Sql struct {
	SqlType  string
	User     string
	Password string
	Port     string
}

var Mysql = sqlInit()

func sqlInit() *Sql {
	mysql := &Sql{
		SqlType:  "mysql",
		User:     "root",
		Password: "000000",
		Port:     "@tcp(localhost:3306)/shop",
	}
	return mysql
}
