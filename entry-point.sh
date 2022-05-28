#!/bin/bash

AS_STEP_SUMMARY="$1"
shift

if [[ "$AS_STEP_SUMMARY" == "true" ]]; then
  (echo '```'; eval /owari -E=false "$@"; echo '```') >> $GITHUB_STEP_SUMMARY
else
  eval /owari "$@"
fi
