FROM python:3.11

ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY ./ /app
RUN pip install --upgrade pip "poetry==1.7.1"
RUN poetry config virtualenvs.create false --local
COPY pyproject.toml poetry.lock ./
RUN poetry install

CMD ["gunicorn", "mysite.mysite.wsgi:application", "--bind", "0.0.0.0:8000"]