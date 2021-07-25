package arg

import (
	"flag"
)

type Argument struct {
	V       *bool
	LogPath *string
}

func Init() (arg Argument) {
	arg.V = flag.Bool("v", false, "show version")
	arg.LogPath = flag.String("logpath", "logs", "path log")
	flag.Parse()

	return arg
}
