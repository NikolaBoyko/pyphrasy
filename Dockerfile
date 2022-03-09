FROM python:3.9-alpine

RUN apk --no-cache add binutils libc-dev

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install markupsafe==2.0.1


COPY . .

CMD [ "gunicorn", "-b" , "0.0.0.0:3000", "app:app"]