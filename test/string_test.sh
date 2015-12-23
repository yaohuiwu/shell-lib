#!/usr/bin/env sh

. ../loader.sh
include ../string.sh
include ../assert.sh

assert_i_equal $(str_is_empty '') $TRUE "Expect '' is empty but not"
assert_i_equal $(str_is_empty ' ') $TRUE "Expect ' ' is empty but not"
assert_i_equal $(str_is_empty '123') $FALSE "Expect '123' is not empty but empty"
assert_i_equal $(str_is_empty ' 1 2 3 ') $FALSE "Expect ' 1 2 3 ' is not empty but empty"

s1='12345'
assert_i_equal $(str_len $s1) 5 "expect length of $s1 is 5 but not."
assert_i_equal $(str_len '12345 ') 6 "expect length of '12345 ' is 6 but not."
