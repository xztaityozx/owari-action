#!/bin/bash

AS_STEP_SUMMARY="$1"
shift

if [[ "$AS_STEP_SUMMARY" == "true" ]]; then
  (echo '```'; /owari -E=false $@; echo '```') >> $GITHUB_STEP_SUMMARY
else
  /owari $@
fi
