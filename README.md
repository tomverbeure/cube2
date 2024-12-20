
Cube2
=====

# Build Instructions

*Verilog generation*

The cube uses a Colorlight 5A-75B HUB75 controller board, revision v6.1. It has
an ECP5-25 FPGA that's running a custom bitstream.

The RTL for that bitstream can be found in the `./rtl` directory. It's written
with the SpinalHDL framework.

# macOS

```
brew install openfpgaloader
```

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

# SpinalHDL


See https://spinalhdl.github.io/SpinalDoc-RTD/master/SpinalHDL/Getting%20Started/Install%20and%20setup.html#mac-os-x-installation




# Build prjtrellis

```
git clone --recursive git@github.com:YosysHQ/prjtrellis.git
cd prjtrellis/libtrellis
cmake -DCMAKE_INSTALL_PREFIX=/opt/prjtrellis .
make -j$(nproc)
sudo make install
```

# Build nextpnr

```
git clone git@github.com:YosysHQ/nextpnr.git
cd nextpnr
mkdir build
cd build
cmake .. -DARCH=ecp5 -DTRELLIS_INSTALL_PREFIX=/opt/prjtrellis -DCMAKE_INSTALL_PREFIX=/opt/nextpnr
make -j$(nproc)
```
