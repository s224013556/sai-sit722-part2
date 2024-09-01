FROM python:3.12.5-slim

WORKDIR /app

# Copy the entire project directory into the container
COPY book_catalog/requirements.txt /app/
COPY book_catalog /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables if needed
ENV DATABASE_URL=sqlite:///./test.db

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
