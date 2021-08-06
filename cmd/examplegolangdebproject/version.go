package main

import (
	"encoding/json"
	"fmt"
	"os"
	"time"

	"github.com/exitstop/examplegolangdebproject/internal/app"
	"github.com/exitstop/examplegolangdebproject/internal/arg"
)

func ShowVersion() {
	app.AppInfo.Version = app.Version
	app.AppInfo.Commit = app.Commit
	app.AppInfo.BuildTime = app.BuildTime
	app.AppInfo.AppName = app.AppName

	infoJson, _ := json.Marshal(app.AppInfo)
	fmt.Println(string(infoJson))
	return
}

func Execute(a *arg.Argument) (err error) {
	app.Uptime = time.Now()
	if *a.V {
		ShowVersion()
		os.Exit(0)
	}
	return
}

func StartInit() (arguments arg.Argument, err error) {
	arguments = arg.Init()
	Execute(&arguments)
	return
}
