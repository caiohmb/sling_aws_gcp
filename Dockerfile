FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y curl tar git

WORKDIR /app

RUN curl -LO https://github.com/slingdata-io/sling-cli/releases/latest/download/sling_linux_amd64.tar.gz && \
    tar -xzf sling_linux_amd64.tar.gz && \
    chmod +x sling

RUN git clone https://github.com/caiohmb/sling_aws_gcp.git

CMD ["./sling", "run", "--config", "sling_aws_gcp/env.yaml", "--pipeline", "sling_aws_gcp/pipeline_s3_bq.yaml"]
