shop/
├── cmd/
│   └── myapp/
│       └── main.go # 程序入口
├── pkg/ # 该目录包含可供其他项目使用的可重用代码包。每个子目录代表一个独立的包，
│   ├── mypackage/
│   │   ├── mypackage.go 
│   │   └── ...
│   └── database
├── internal/ # : 该目录包含项目的内部模块，这些模块对于项目外部的代码不可见。这些模块是项目内部使用的一些私有实现
│   ├── mymodule/
│   │   ├── mymodule.go
│   │   └── ...
│   └── ...
├── api/ # 该目录包含与API相关的代码，例如处理程序和路由。
│   ├── handlers/
│   │   ├── handler1.go
│   │   └── ...
│   └── ... 
│   
├── configs/ # 该目录包含项目的配置文件，通常由config.go文件管理。
│   ├── config.go
│   └── ...
├── tests/ # 该目录包含项目的测试代码，分为单元测试和集成测试等
│   ├── unit/
│   ├── integration/
│   └── ...
├── docs/ # 该目录包含项目的文档，如说明文件、设计文档等。
├── README.md
└── go.mod   

