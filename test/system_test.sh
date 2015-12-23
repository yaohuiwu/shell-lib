#!/usr/bin/env sh

. ../loader.sh
include ../system.sh
include ../assert.sh

assert_i_equal $(sys_is_group_exists 'root') $TRUE "expected user 'root' exists but not."
assert_i_equal $(sys_is_group_exists 'mysql123333333') $FALSE "expected user 'mysql123333333' not exists but exists."

assert_i_true $(sys_is_user_exists 'root') "excepted user 'root' exists but not."
assert_i_false $(sys_is_user_exists 'mysql1') "excepted user 'mysql1' exists but not."
