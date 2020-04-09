# Test file for "lab2"


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# Example test:
test "PINA: 0x00, PINB: 0x00, PINC: 0x00 => PIND: 0x00"
# Set inputs
setPINA 0x00
setPINB 0x00
setPINC 0x00
# Continue for several ticks
continue 2
# Set expect values
expectPORTD 0x00
# Check pass/fail
checkResult

# Add tests below
test "PINA: 0x64, PINB: 0x13, PINC: 0x13 => PIND: 0x89"
setPINA 0x64
setPINB 0x13
setPINC 0x13
continue 2
expectPORTD 0x89
checkResult              

test "PINA: 0x50, PINB: 0x3C, PINC: 0x3C => PIND: 0xCA"
setPINA 0x50
setPINB 0x3C
setPINC 0x3C
continue 2 
expectPORTD 0xCA
checkResult

test "PINA: 0x64, PINB: 0x28, PINC: 0x13 => PIND: 0x9F"
setPINA 0x64
setPINB 0x28
setPINC 0x13
continue 2
expectPORTD 0x9F
checkResult

 
# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
