package main

import (
	"fmt"
)

func main() {
	arg, err := StartInit()
	if err != nil {
		fmt.Printf("StartInit(): %v\n", err)
		return
	}

	fmt.Printf("\narg = %v", arg)
}
