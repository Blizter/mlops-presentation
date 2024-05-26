FROM ghcr.io/mlflow/mlflow:latest

ARG PG_CONN
ARG MLFLOW_S3_ENDPOINT_URL

COPY entrypoint.sh .
COPY requirements.txt .

RUN chmod 0755 entrypoint.sh && chmod 0755 requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["./entrypoint.sh"]
