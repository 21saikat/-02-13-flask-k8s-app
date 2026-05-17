# নতুন (Multi-stage)
FROM python:3.11-alpine AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.11-alpine AS production
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
EXPOSE 5000
ENV PATH=/root/.local/bin:$PATH
CMD ["python", "app.py"]
