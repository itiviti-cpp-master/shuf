#!/bin/sh

CMD=$1
shift
for arg do
    EXPECTED=10000
    ACTUAL=`$CMD -r $arg | head -n $EXPECTED | wc -l`
    if test $ACTUAL -ne $EXPECTED; then
        echo "For input $arg expected $EXPECTED lines of output, but actually got $ACTUAL"
        exit 1
    fi
    $CMD -r $arg | head -n 100000 | sort | diff -u --from-file ${arg}.eta - || exit 1
done
