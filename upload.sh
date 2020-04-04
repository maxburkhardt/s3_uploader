#!/bin/bash
set -euo pipefail

while :
do
  echo "Starting upload."
  aws s3 cp $FILE_TO_BACKUP $TARGET_S3_PATH/$FILE_PREFIX-`date +'%s'`$FILE_SUFFIX
  echo "Upload complete, sleeping for 24h"
  sleep $INTERVAL
done
