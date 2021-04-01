#!/bin/bash

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export PATH=${PATH}:${ORACLE_HOME}/bin
# export TNS_ADMIN=${ORACLE_HOME}/network/admin

SQL_FILE=${1}

if [ -z "$SQL_FILE" ]; then
    sqlplus sys/oracle as sysdba
else
    sqlplus sys/oracle as sysdba @${SQL_FILE}
fi


