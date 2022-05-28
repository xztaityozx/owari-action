#!/bin/bash

AS_STEP_SUMMARY=$1
shift

RESULT="$(/owari ${1+"@"})"

if [[ "$AS_STEP_SUMMARY" == "true" ]]; then
  /owari "$@" >> $GITHUB_STEP_SUMMARY
else
  /owari "$@"
end

