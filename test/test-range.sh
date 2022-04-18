#!/bin/sh

CMD=$1
shift
for arg do
    RANGE=`echo $arg | sed -e 's/.*range-//' | sed -e 's/.txt.eta//'`
    $CMD -i $RANGE | sort | diff -u --from-file ${arg} - || exit 1
done
