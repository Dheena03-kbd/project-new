#!/bin/sh

grep_mongo=`ps aux | grep -v grep | grep mongod`
    if [ -n "${grep_mongo}" ]
    then
        echo "MongoDB is already running."
    else
        echo "Start MongoDB."


        /etc/init.d/mongod start
fi
