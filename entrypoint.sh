#!/bin/bash

buildarg=$1
if [ "" = "$buildarg" ]; then
    buildarg="."
fi

go build -o /tmp/binary $buildarg
/tmp/binary 2> /tmp/trace.out

if [ -s /tmp/trace.out ]; then
    gotrace /tmp/trace.out
else
    echo "Trace file is empty"
    exit 1
fi

