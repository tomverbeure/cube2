
# Install SpinalHDL

# Generate bitmaps

```
cd movie
make
```

# Compile SW

```
cd sw
make
```

# Generate Verilog

sbt "runMain cube2.Cube2TopVerilog"

# Compile bitstream

```
cd ecp5
make
```

# Upload or flash bitstream

```
cd ecp5
make upload
```

or 

```
cd ecp5
make flash
```
