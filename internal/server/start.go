package server

import (
	"github.com/exitstop/examplegolangdebproject/internal/logger"
	"go.uber.org/zap"
)

func Start() (err error) {
	logger.Log.Info("Start Server",
		zap.String("url", "none"),
	)
	return
}
