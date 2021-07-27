package app

type AppInfoStruct struct {
	Version   string `json:"version"`
	Commit    string `json:"commit"`
	BuildTime string `json:"build_time"`
	AppName   string `json:"app_name"`
}

var (
	Version   = "none"
	Commit    = "unset" // номер commit
	BuildTime = "unset" // дата и время сборки
	AppName   = "examplegolangdebproject"
)

var (
	AppInfo AppInfoStruct
)
