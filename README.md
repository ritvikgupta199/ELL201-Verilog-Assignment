# ELL201 Verilog Assignment

## Compiling Verilog Code
```
iverilog -o graycodesim graycode.v tb_graycode.v
```
```
iverilog -o ringcountersim ringcounter.v tb_ringcounter.v
```
```
iverilog -o fsmsim fsm.v tb_fsm.v
```

## TestBench Results
```
vvp graycodesim
```
```
vvp ringcountersim
```
```
vvp fsmsim
```
