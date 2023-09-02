FROM python:3.7

RUN mkdir /jp
COPY /MY-ETL_OEC32.ipynb /requirements32.txt /variables.env ./jp
COPY /src/hs_codes.csv /src/country_data.json ./jp/src/

WORKDIR /jp

RUN pip install --upgrade pip --no-cache-dir
#RUN pip install pandas jupyterlab sqlalchemy psycopg2 --no-cache-dir
RUN pip install -r requirements32.txt --no-cache-dir
#RUN pip freeze > p.txt
