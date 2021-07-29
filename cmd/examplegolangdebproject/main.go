package main

import (
	"fmt"
	"log"

	"github.com/exitstop/examplegolangdebproject/internal/config"
	"github.com/exitstop/examplegolangdebproject/internal/logger"
	"github.com/exitstop/examplegolangdebproject/internal/server"
)

func main() {
	arg, err := StartInit()
	if err != nil {
		log.Printf("StartInit: %v\n", err)
		return
	}
	fmt.Println("examplegolangdebproject")

	atomConfig, err := config.AtomNewAtomConfig()

	if err != nil {
		log.Printf("AtomNewAtomConfig: %v\n", err)
	}

	logger.Create()

	fmt.Println(atomConfig)

	server.Start()

	fmt.Println(arg)

}
