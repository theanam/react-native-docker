#!/bin/sh

eval "$(grep ^REACT_NATIVE_APP_NAME= .env)"

cd $REACT_NATIVE_APP_NAME

mv * .* ../

rm -rf $REACT_NATIVE_APP_NAME