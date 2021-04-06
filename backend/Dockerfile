FROM python:3.7
COPY . .
RUN pip3 install -r requirements.txt
ENV TEST_DATABASE_URI="mysql+pymysql://{{db-user}}:{{db-password}}@{{test-db-uri}}/testdb"
ENV DATABASE_URI="mysql+pymysql://{{db-user}}:{{db-password}}@{{prod-db-uri}}/users"
ENV SECRET_KEY="{{secret-key}}"
EXPOSE 5001
ENTRYPOINT ["python3","app.py"]
