FROM python:latest
COPY . .
RUN pip install -r requirements.txt
CMD ["uvicorn", "hello.main:app", "--host", "0.0.0.0" ,"--port", "8888"]
