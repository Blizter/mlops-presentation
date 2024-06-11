ARG G_PAT

FROM prefecthq/prefect:2-python3.12

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt prefect-aws prefect-github && \
    prefect block register -m prefect_aws

ENTRYPOINT ["prefect", "server", "start"]
