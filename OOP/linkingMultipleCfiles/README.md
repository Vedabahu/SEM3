# Almost an Assignment

Date: 2024-08-27<hr>
## Question

Learn how to link multiple C/C++ files and make header files, for the lab topic that we got (IIT Kharagpur Bus Transit System).

### Answer

Main compilation method.

```sh
# Fill in the stuff that is necessary like *.c as individual files.
gcc -c *.c
gcc -o ${outfile} *.o 
```
Header files are not included in compilation step.

Read from [here](https://learn.microsoft.com/en-us/cpp/cpp/header-files-cpp) for reference.

### Other references

Checkout the [Makefile](./Makefile).
Also check the [GNU Make Manual](https://www.gnu.org/software/make/manual/make.html).
