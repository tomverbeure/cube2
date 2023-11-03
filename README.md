
Cube2
=====

# macOS

brew install openfpgaloader

/opt/homebrew/bin/openFPGALoader

```
tomverbeure@Toms-Air 5a-75b % /opt/homebrew/bin/openFPGALoader --scan-usb
found 3 USB device
Bus device vid:pid       probe type      manufacturer serial               product
000 003    0x0403:0x6014 ft232H          Digilent     210251A08870         Digilent USB Device
```



```
tomverbeure@Toms-Air 5a-75b % /opt/homebrew/bin/openFPGALoader -v --vid 0x0403 --pid 0x6014 --detect
No cable or board specified: using direct ft2232 interface
Cable VID overridden
Cable PID overridden
Jtag frequency : requested 6.00MHz   -> real 6.00MHz
found 1 devices
index 0:
	idcode 0x1111043
	manufacturer lattice
	family ECP5
	model  LFE5UM-25
	irlength 8
```
