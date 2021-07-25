package main

import (
	"encoding/json"
	"fmt"

	"github.com/exitsto/examplegolangdebproject/internal/arg"
)

var (
	version   = "none"
	commit    = "unset" // номер commit
	buildTime = "unset" // дата и время сборки
	appName   = "examplegolangdebproject"
)

func ShowVersion() {
	type Info struct {
		Version   string `json:"version"`
		Commit    string `json:"commit"`
		BuildTime string `json:"build_time"`
	}
	info := Info{
		Version:   version,
		Commit:    commit,
		BuildTime: buildTime,
	}
	infoJson, _ := json.Marshal(info)
	fmt.Println(string(infoJson))
	return
}

func Execute(a *arg.Argument) (err error) {
	if *a.V {
		ShowVersion()
	}
	return
}

func StartInit() (err error) {
	arguments := arg.Init()
	Execute(&arguments)
	return
}
