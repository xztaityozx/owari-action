#!/bin/bash -x

echo "$@"

AS_STEP_SUMMARY="$1"
shift

if [[ "$AS_STEP_SUMMARY" == "true" ]]; then
  /owari "$@" >> $GITHUB_STEP_SUMMARY
else
  /owari "$@"
fi
