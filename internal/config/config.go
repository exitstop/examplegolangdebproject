package config

import (
	"fmt"

	"github.com/spf13/viper"

	"github.com/exitstop/examplegolangdebproject/internal/app"
)

func AtomNewAtomConfig() (atomConfig *AtomConfig, err error) {
	atomConfig = &AtomConfig{
		Config: viper.New(),
	}

	atomConfig.Config.SetConfigName("config")
	atomConfig.Config.SetConfigType("toml")
	atomConfig.Config.AddConfigPath("build")
	configPath := fmt.Sprintf("/etc/exitstop/%s", app.AppName)
	atomConfig.Config.AddConfigPath(configPath)

	atomConfig.Config.SetDefault("none", "none")

	err = atomConfig.ReadInConfig() // Find and read the config file

	if err != nil {
		return
	}

	atomConfig.WriteConfig()
	return
}
