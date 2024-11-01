connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870" && level==0} -index 0
fpga -file E:/1275/1275/system_hw_platform_0/top1029.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
rst -system
after 3000
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
dow E:/1275/1275/1275/Debug/1275.elf
bpadd -addr &main
