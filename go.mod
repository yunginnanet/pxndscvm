module git.tcp.direct/kayos/prox5

go 1.19

require (
	git.tcp.direct/kayos/common v0.9.2
	git.tcp.direct/kayos/go-socks5 v0.3.0
	git.tcp.direct/kayos/socks v0.1.3
	github.com/gdamore/tcell/v2 v2.6.0
	github.com/miekg/dns v1.1.56
	github.com/ooni/oohttp v0.6.5
	github.com/orcaman/concurrent-map/v2 v2.0.1
	github.com/panjf2000/ants/v2 v2.8.2
	github.com/refraction-networking/utls v1.5.4
	github.com/rivo/tview v0.0.0-20230208211350-7dfff1ce7854
	github.com/yunginnanet/Rate5 v1.2.1
	golang.org/x/net v0.16.0
)

require (
	github.com/andybalholm/brotli v1.0.5 // indirect
	github.com/cloudflare/circl v1.3.3 // indirect
	github.com/gaukas/godicttls v0.0.4 // indirect
	github.com/gdamore/encoding v1.0.0 // indirect
	github.com/klauspost/compress v1.16.7 // indirect
	github.com/lucasb-eyer/go-colorful v1.2.0 // indirect
	github.com/mattn/go-runewidth v0.0.14 // indirect
	github.com/patrickmn/go-cache v2.1.0+incompatible // indirect
	github.com/quic-go/quic-go v0.37.4 // indirect
	github.com/rivo/uniseg v0.4.3 // indirect
	golang.org/x/crypto v0.14.0 // indirect
	golang.org/x/mod v0.12.0 // indirect
	golang.org/x/sys v0.13.0 // indirect
	golang.org/x/term v0.13.0 // indirect
	golang.org/x/text v0.13.0 // indirect
	golang.org/x/tools v0.13.0 // indirect
	nullprogram.com/x/rng v1.1.0 // indirect
)

retract (
	v1.2.2 // cleanup
	v1.2.1 // accident
	v0.9.43 // woops didn't unlock mutex
	v0.9.5 // premature
	v0.8.4
)
