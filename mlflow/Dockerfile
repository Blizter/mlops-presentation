FROM ghcr.io/mlflow/mlflow:latest

COPY entrypoint.sh .
COPY requirements.txt .

RUN chmod 0755 entrypoint.sh && chmod 0755 requirements.txt

ENTRYPOINT ["./entrypoint.sh"]
