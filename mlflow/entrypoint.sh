#!/bin/sh

mlflow server \
    --backend-store-uri postgresql://${PG_CONN} \
    --default-artifact-root ${MLFLOW_S3_ENDPOINT_URL} \
    --host 0.0.0.0
