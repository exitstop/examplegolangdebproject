package main

import (
	"encoding/json"
	"fmt"
	"os"

	"github.com/exitstop/examplegolangdebproject/internal/app"
	"github.com/exitstop/examplegolangdebproject/internal/arg"
)

var (
	version   = "none"
	commit    = "unset" // номер commit
	buildTime = "unset" // дата и время сборки
	appName   = "remotessh"
)

func ShowVersion() {
	infoJson, _ := json.Marshal(app.AppInfo)
	fmt.Println(string(infoJson))
	return
}

func Execute(a *arg.Argument) (err error) {
	if *a.V {
		ShowVersion()
		os.Exit(0)
	}
	return
}

func StartInit() (arguments arg.Argument, err error) {
	app.AppInfo.Version = version
	app.AppInfo.Commit = commit
	app.AppInfo.BuildTime = buildTime
	app.AppInfo.AppName = appName

	arguments = arg.Init()
	Execute(&arguments)
	return
}
