FROM frolvlad/alpine-python3

WORKDIR /app

ADD . /app

RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

ENTRYPOINT ["python", "dockergen.py"]
CMD ["--help"]
