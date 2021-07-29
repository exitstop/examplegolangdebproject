package logger

import (
	"log"

	"go.uber.org/zap"
)

var Log *zap.Logger

func Create() {
	var err error
	Log, err = zap.NewProduction()
	if err != nil {
		log.Printf("zap.NewProduction: %v\n", err)
		return
	}

	/*
		defer Log.Sync()
		Log.Info("Start Server",
			zap.String("url", "none"),
			zap.Int("attempt", 1),
			zap.Duration("backoff", time.Second),
		)
	*/
}
