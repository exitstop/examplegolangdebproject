package app

import "time"

type AppInfoStruct struct {
	Version   string    `json:"version"`
	Commit    string    `json:"commit"`
	BuildTime string    `json:"build_time"`
	AppName   string    `json:"app_name"`
	Uptime    time.Time `json:"uptime"`
}

var (
	Version   = "none"
	Commit    = "unset" // номер commit
	BuildTime = "unset" // дата и время сборки
	AppName   = "examplegolangdebproject"
	Uptime    time.Time
)

var (
	AppInfo AppInfoStruct
)

// Узнать время работы программы
func GetUptime() (out time.Duration) {
	out = time.Now().Sub(Uptime)
	return
}
