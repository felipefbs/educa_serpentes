FROM python:3.13-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://get.typst.app/typst.toml | sh
ENV PATH="/root/.local/bin:$PATH"

RUN pip install --no-cache-dir typ2docx==0.8.0 pdf2docx

WORKDIR /app

RUN mkdir -p /output

ENTRYPOINT ["typ2docx"]
CMD ["main.typ", "-e", "pdf2docx", "-o", "/output/output.docx"]
