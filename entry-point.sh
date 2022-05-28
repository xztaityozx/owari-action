#!/bin/bash

OWARI_AS_STEP_SUMMARY="${OWARI_AS_STEP_SUMMARY:-false}"
OWARI_ENABLE_OUTPUT="${OWARI_ENABLE_OUTPUT:-false}"

TMP_FILE=/tmp/owari.$RANDOM
eval /owari "$@" > $TMP_FILE

if [[ "$OWARI_AS_STEP_SUMMARY" == "true" ]]; then
  (echo '```'; cat $TMP_FILE echo '```') >> $GITHUB_STEP_SUMMARY
else
  cat $TMP_FILE
fi

if [[ "$OWARI_ENABLE_OUTPUT" == "true" ]]; then
  OUTPUT=$(cat $TMP_FILE)
  echo "::set-output name=content::${OUTPUT//$'\n'/\\n}"
fi
