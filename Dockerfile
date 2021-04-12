FROM python:3.7

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
COPY init.py /app/init.py
RUN python3 /app/init.py && rm /app/init.py

COPY main /app/main
COPY wsgi.py /app/wsgi.py

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

EXPOSE 3000
CMD "/launch.sh"
