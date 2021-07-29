package config

import (
	"sync"
	"time"

	"github.com/spf13/viper"
)

type AtomConfig struct {
	mutex  sync.RWMutex
	Config *viper.Viper
}

// GET ----------------------------------------------------

func (s *AtomConfig) GetString(key string) (out string) {
	s.mutex.RLock()
	out = s.Config.GetString(key)
	s.mutex.RUnlock()
	return
}

func (s *AtomConfig) GetBool(key string) (out bool) {
	s.mutex.RLock()
	out = s.Config.GetBool(key)
	s.mutex.RUnlock()
	return
}

func (s *AtomConfig) GetInt(key string) (out int) {
	s.mutex.RLock()
	out = s.Config.GetInt(key)
	s.mutex.RUnlock()
	return
}

func (s *AtomConfig) GetFloat64(key string) (out float64) {
	s.mutex.RLock()
	out = s.Config.GetFloat64(key)
	s.mutex.RUnlock()
	return
}

func (s *AtomConfig) GetTime(key string) (out time.Time) {
	s.mutex.RLock()
	out = s.Config.GetTime(key)
	s.mutex.RUnlock()
	return
}

// SET ----------------------------------------------------

func (s *AtomConfig) Set(key string, value interface{}) {
	s.mutex.Lock()
	s.Config.Set(key, value)
	s.mutex.Unlock()
}

func (s *AtomConfig) WriteConfig() {
	s.mutex.Lock()
	s.Config.WriteConfig()
	s.mutex.Unlock()
}

func (s *AtomConfig) ReadInConfig() (err error) {
	s.mutex.Lock()
	err = s.Config.ReadInConfig()
	s.mutex.Unlock()
	return
}
