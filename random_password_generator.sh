#!/bin/bash

#generates a unique random password, with the help of the present time(in seconds and nanoseconds since 01/01/1970).
#After that the result is pipelined as the standard input for the cryptographic hash, which will generate a random
#sets of characters each time the standard input is changed (and the time is always changing).
#The result is pipelined further as the standard input of the head command which is selecting the first eight characters.

#The special characters are folded one on a single row with no width between the rows, then they are shuffled and at the
#end only the first character is selected.

PASSWORD=$(date +%s%N | sha256sum | head -c8)

SPECIAL_CHARACTERS=$(echo '!@#$%^&*()_-' | fold -w1 | shuf | head -c1)

echo "${SPECIAL_CHARACTERS}${PASSWORD}${SPECIAL_CHARACTERS}"
