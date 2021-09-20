package pxndscvm

import (
	"sync"
)

var (
	useDebugChannel = false
	debugChan       chan string
	debugMutex      *sync.RWMutex
)

func init() {
	debugMutex = &sync.RWMutex{}
}

// DebugChannel will return a channel which will receive debug messages once debug is enabled.
// This will alter the flow of debug messages, they will no longer print to console, they will be pushed into this channel.
// Make sure you pull from the channel eventually to avoid build up of blocked goroutines.
func (s *Swamp) DebugChannel() chan string {
	debugMutex.Lock()
	defer debugMutex.Unlock()
	debugChan = make(chan string, 1000)
	useDebugChannel = true
	return debugChan
}

// DebugEnabled returns the current state of our debug switch
func (s *Swamp) DebugEnabled() bool {
	debugMutex.RLock()
	defer debugMutex.RUnlock()
	return s.swampopt.debug
}

// DisableDebugChannel redirects debug messages back to the console.
// DisableProxyChannel does not disable debug, use DisableDebug().
func (s *Swamp) DisableDebugChannel() {
	debugMutex.Lock()
	defer debugMutex.Unlock()
	useDebugChannel = false
}

// EnableDebug enables printing of verbose messages during operation
func (s *Swamp) EnableDebug() {
	debugMutex.Lock()
	defer debugMutex.Unlock()
	s.swampopt.debug = true
}

// DisableDebug enables printing of verbose messages during operation.
// WARNING: if you are using a DebugChannel, you must read all of the messages in the channel's cache or this will block.
func (s *Swamp) DisableDebug() {
	debugMutex.Lock()
	defer debugMutex.Unlock()
	s.swampopt.debug = false
}

func (s *Swamp) dbgPrint(str string) {
	debugMutex.RLock()
	defer debugMutex.RUnlock()
	if !s.swampopt.debug {
		return
	}
	if useDebugChannel {
		go func() {
			debugChan <- str
		}()
		return
	}
	println("pxndscvm: " + str)
}