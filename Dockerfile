FROM python:3.8

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

RUN echo -e "#!/bin/sh\npython3 ingest.py\nchainlit run model.py -w" > /app/run.sh

RUN chmod +x /app/run.sh

ENTRYPOINT ["/app/run.sh"]
