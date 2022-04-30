FROM python:3.9-slim-bullseye

RUN pip install -U \
    pip \
    setuptools \
    wheel

WORKDIR /src

# Better docker caching (code changes don't affected pip)
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

EXPOSE 10001
ENTRYPOINT [ "python3", "ubnt-proxy.py" ]
