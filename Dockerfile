FROM alpine:edge
RUN apk add --update \
    bash \
    aws-cli
ENV AWS_SHARED_CREDENTIALS_FILE "/credentials/credentials"
ENV FILE_TO_BACKUP "/data/file.tgz"
ENV TARGET_S3_PATH "s3://bucket/backups"
ENV FILE_PREFIX "backup"
ENV FILE_SUFFIX ".tgz"
ENV INTERVAL "86400"
COPY ./upload.sh /upload.sh
ENTRYPOINT ["/bin/bash", "/upload.sh"]
