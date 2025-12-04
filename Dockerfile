# USe an official Python runitme as parent image
FROM python:3.10-slim

# Set the woring directory tp /app
WORKDIR /app

# Copy the entiere project into container at /app
COPY . /app

# INstall any needed packages specified in requirement.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world oputside the pc
EXPOSE 8000

# Define env variable for the model
ENV MODEL_PATH=/app/models/advertising_model.pkl

# Run FastAPI.py when container launches, adjust the path as necessary
CMD ["uvicorn","scripts.FastAPI:app","--host","0.0.0.0","--port","8000"]