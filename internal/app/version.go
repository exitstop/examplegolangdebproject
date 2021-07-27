package app

type AppInfoStruct struct {
	Version   string `json:"version"`
	Commit    string `json:"commit"`
	BuildTime string `json:"build_time"`
	AppName   string `json:"app_name"`
}

var (
	AppInfo AppInfoStruct
)
