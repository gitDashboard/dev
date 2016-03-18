#!/bin/bash

source env.sh

DEST="./build"

rm -rf $DEST

revel build github.com/gitDashboard/gitDashboard $DEST

