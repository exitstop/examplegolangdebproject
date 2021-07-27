package main

import (
	"encoding/json"
	"fmt"
	"os"

	"github.com/FaceChainTeam/remotessh/internal/app"
	"github.com/FaceChainTeam/remotessh/internal/arg"
	"github.com/denisbrodbeck/machineid"
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
	if *a.ID {
		uniq, _ := machineid.ID()
		fmt.Printf("%s", uniq)
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
