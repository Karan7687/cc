# Lex/Flex Programs — Run Guide (Windows CMD)

This repository contains **five individual Lex/Flex programs**.  
Each folder includes a pre-generated `lex.yy.c`, so you can directly compile and execute on **Windows Command Prompt (CMD)**.

> **MinGW-w64 is required** (for `gcc`).  
> These commands work only in **CMD**, not PowerShell/VSCode terminal.

---

## ✅ Prerequisites

### 1. Install MinGW-w64 (C Compiler)
Add MinGW `bin/` folder to PATH.  
Verify installation:

```cmd
gcc --version

Program 1:
cd 2_No_Of_Comments
del a.exe 2>NUL
gcc lex.yy.c -o a.exe
a.exe < input1.c

Program 2:
cd ..\3_starting_A
del a.exe 2>NUL
gcc lex.yy.c -o a.exe
a.exe < input.txt

Program 3:
cd ..\4_Upper_to_Lower
del a.exe 2>NUL
gcc lex.yy.c -o a.exe
a.exe < input.txt

Program 4:
cd ..\5_Dec_to_hex
del a.exe 2>NUL
gcc lex.yy.c -o a.exe
a.exe < input.txt

Program 5:
cd ..\6_End_with_.com
del a.exe 2>NUL
gcc lex.yy.c -o a.exe
a.exe < input.txt




