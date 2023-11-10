#! /usr/bin/env python3

import sys

gamma   = float(sys.argv[1])
dim     = float(sys.argv[2])

print(f"// Generated with: gen_gamma_dim_table.py {gamma} {dim}")
print(f"// gamma={gamma}, dim={dim}")
print("uint8_t gamma_dim_table[256] = {")

values = [int(dim * ((i/255)**gamma) * 255 + dim/2) for i in range(256)]
spliced_values = [ values[i:i+16] for i in range(0, len(values), 16) ]
print( ",\n".join([ "    " + ", ".join("0x%02x" % v for v in sub_list) for sub_list in spliced_values ]))

print("};")
