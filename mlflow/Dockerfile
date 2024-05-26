FROM ghcr.io/mlflow/mlflow:2.13.0

ARG PG_CONN
ARG MLFLOW_S3_ENDPOINT_URL

COPY entrypoint.sh .
COPY requirement.txt .

RUN chmod 0755 entrypoint.sh
RUN pip install psycopg2-binary && pip install -r requirement.txt

ENTRYPOINT ["./entrypoint.sh"]
