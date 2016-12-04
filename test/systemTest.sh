#!/usr/bin/env bash

. env.sh
. ${SH_LIB_DIR}/system.sh

sysUserExist 'root'
echo "exist?$?"

sysGroupExist 'root'
echo "exist?$?"

sysRequire 'java'

sysRequireAll 'mvn' 'kadmin' 'noneExistCmd'
