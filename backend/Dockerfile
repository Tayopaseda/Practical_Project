FROM python:3.7
WORKDIR /app
COPY . .
RUN pip3 install -r requirements.txt
ENV TEST_DATABASE_URI="mysql+pymysql://{{db-user}}:{{db-password}}@{{db-uri}}/testdb"
ENV SECRET_KEY="{{secret-key}}"
EXPOSE 5001
ENTRYPOINT ["python","app.py"]
