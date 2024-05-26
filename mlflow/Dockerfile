FROM ghcr.io/mlflow/mlflow

ARG PG_CONN
ARG MLFLOW_S3_ENDPOINT_URL

COPY entrypoint.sh .

RUN chmod 0755 entrypoint.sh
RUN pip install psycopg2-binary

ENTRYPOINT ["./entrypoint.sh"]
