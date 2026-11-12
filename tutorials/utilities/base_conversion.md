# Number Base Conversion
Use this cheat-sheet to convert numbers between binary, decimal, octal, and hexadecimal directly from the terminal.

> [!NOTE]
> Most examples use `bc`, the default command-line calculator, pre-installed on most systems. Check whether it is installed with `bc --version` and install it with `sudo apt install bc`.

> [!TIP]
> In `bc`, the `ibase` specifies the input base and `obase` specifies the output base. By default, both are set to decimal.

> [!IMPORTANT]
> When using `bc` with both `ibase` (input base) and `obase` (output base), set `obase` first to ensure the output base is interpreted correctly. Otherwise, the value assigned to obase may be interpreted using the new input base.

## Input Binary
### a. Convert binary to decimal
Multiply each binary digit by 2 raised to its position (counting from right to left, starting at 0), then add the results.
```sh
# 11010101₂ = 128 + 64 + 16 + 4 + 1 = 213₁₀
echo "ibase=2; 11010101" | bc
```

### b. Convert binary to hexadecimal
Group the binary digits into sets of four from right to left. Convert each group to its hexadecimal equivalent and add leading zeros to the leftmost group if necessary.
```sh
# 1010101₂ = (0101 0101)₂ = 55₁₆
echo "obase=16; ibase=2; 1010101" | bc
```

### c. Convert binary to octal
Group the binary digits into sets of three from right to left. Add leading zeros if needed and convert each group to its octal equivalent..
```sh
# 1010101₂ = (001 010 101)₂ = 125₈
echo "obase=8; ibase=2; 1010101" | bc
```

## Input Decimal
### a. Convert decimal to binary
Repeatedly divide the decimal number by 2 and read the remainders from bottom to top.
```sh
# 23 / 2 = 11 remainder 1
# 11 / 2 =  5 remainder 1
#  5 / 2 =  2 remainder 1
#  2 / 2 =  1 remainder 0
#  1 / 2 =  0 remainder 1
#
# Read remainders from bottom to top:
# 23₁₀ = 10111₂
echo "obase=2; 23" | bc
```

### b. Convert decimal to hexadecimal
Repeatedly divide the decimal number by 16, recording the remainders (10-15 map to A-F) from bottom to top.
```sh
# 2400 / 16 = 150 remainder 0
#  150 / 16 =   9 remainder 6
#    9 / 16 =   0 remainder 9
#
# Read remainders from bottom to top:
# 2400₁₀ = 960₁₆
echo "obase=16; 2400" | bc
printf '%x\n' 2400
```

### c. Convert decimal to octal
Repeatedly divide the decimal number by 8 and read the remainders from bottom to top.
```sh
# 23 / 8 = 2 remainder 7
#  2 / 8 = 0 remainder 2
#
# Read remainders from bottom to top:
# 23₁₀ = 27₈
echo "obase=8; 23" | bc
```

## Input Octal
### a. Convert octal to binary
Replace each octal digit with its three-digit binary equivalent, then remove unnecessary leading zeros.
```sh
# 254₈ = (010 101 100)₂ = 10101100₂
echo "obase=2; ibase=8; 254" | bc
```

### b. Convert octal to decimal
Multiply each octal digit by 8 raised to its position (counting from right to left, starting at 0), then add the results.
```sh
# 723₈ = 7 × 8² + 2 × 8¹ + 3 × 8⁰ = 467₁₀
echo "ibase=8; 723" | bc
```

### c. Convert octal to hexadecimal
Convert each octal digit to three binary digits, regroup the result into sets of four, and convert each group to hexadecimal.
```sh
# 254₈ = (10 101 100)₂ = (1010 1100)₂ = AC₁₆
echo "obase=16; ibase=8; 254" | bc
```

## Input Hexadecimal
### a. Convert hexadecimal to binary
Replace each hexadecimal digit with its four-digit binary equivalent, then remove unnecessary leading zeros.
```sh
# 960₁₆ = (1001 0110 0000)₂ = 100101100000₂
echo "obase=2; ibase=16; 960" | bc
```

### b. Convert hexadecimal to decimal
Multiply each hexadecimal digit by 16 raised to its position (counting from right to left, starting at 0), then add the results.
```sh
# 960₁₆ = 9 × 16² + 6 × 16¹ + 0 × 16⁰ = 2400₁₀
echo $((0x960))
echo "ibase=16; 960" | bc
```

### c. Convert hexadecimal to octal
Convert each hexadecimal digit to four binary digits, regroup the result into sets of three, and convert each group to octal.
```sh
# 960₁₆ = (1001 0110 0000)₂ = (100 101 100 000)₂ = 4540₈
echo "obase=8; ibase=16; 960" | bc
```

### Lookup Table

| Decimal (Base 10) | Binary (Base 2) | Octal (Base 8) | Hexadecimal (Base 16) |
|------------------:|----------------:|---------------:|----------------------:|
| 0                 | 0000            | 0              | 0                     |
| 1                 | 0001            | 1              | 1                     |
| 2                 | 0010            | 2              | 2                     |
| 3                 | 0011            | 3              | 3                     |
| 4                 | 0100            | 4              | 4                     |
| 5                 | 0101            | 5              | 5                     |
| 6                 | 0110            | 6              | 6                     |
| 7                 | 0111            | 7              | 7                     |
| 8                 | 1000            | 10             | 8                     |
| 9                 | 1001            | 11             | 9                     |
| 10                | 1010            | 12             | A                     |
| 11                | 1011            | 13             | B                     |
| 12                | 1100            | 14             | C                     |
| 13                | 1101            | 15             | D                     |
| 14                | 1110            | 16             | E                     |
| 15                | 1111            | 17             | F                     |
| 16                | 10000           | 20             | 10                    |
| 17                | 10001           | 21             | 11                    |
| 18                | 10010           | 22             | 12                    |
| 19                | 10011           | 23             | 13                    |
| 20                | 10100           | 24             | 14                    |
