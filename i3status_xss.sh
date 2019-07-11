#!/bin/bash

if xset -q | grep -o .*cycle | grep -q '\<0\>'
then
    n=$(xset -q | grep -o .*cycle | grep -o '[0-9]\+')
    echo "XSS $((n/60))"
    echo ""
    echo "#bb2222"
else
    n=$(xset -q | grep -o .*cycle | grep -o '[0-9]\+')
    echo "XSS $((n/60))"
    echo ""
    echo "#229922"
fi
