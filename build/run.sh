#!/bin/sh
SCRIPTPATH=$(cd "$(dirname "$0")"; pwd)
"$SCRIPTPATH/gitDashboard" -importPath github.com/gitDashboard/gitDashboard -srcPath "$SCRIPTPATH/src" -runMode prod
