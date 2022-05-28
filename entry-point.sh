#!/bin/bash

AS_STEP_SUMMARY="$1"
shift

TMP_FILE=/tmp/owari.$RANDOM
eval /owari "$@" > $TMP_FILE

if [[ "$AS_STEP_SUMMARY" == "true" ]]; then
  (echo '```'; cat $TMP_FILE echo '```') >> $GITHUB_STEP_SUMMARY
else
  cat $TMP_FILE
fi

if [[ -z "GITHUB_ACTIONS" ]]; then
  OUTPUT=$(cat $TMP_FILE)
  echo "::set-output name=content::${OUTPUT//$'\n'/\\n}"
fi
