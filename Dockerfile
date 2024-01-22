FROM python:3.8

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY mysite .

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "158.160.137.75:8000"]