FROM python:3.10

# WORKDIR /flask_microservices

ADD requirements.txt /
ADD model /model
ADD ms /ms
ADD app.py /

RUN pip install -r /requirements.txt

# Copy the Gzip file into the image.
# Install the necessary tools to extract Gzip and manage files.
# RUN apt-get update && \
#     apt-get install -y tar gzip && \
#     rm -rf /var/lib/apt/lists/* && \
#     tar -xzf /model/model_binary.dat.gz -C .S

EXPOSE 5000
# Define the command to run when the container starts.
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
# CMD [ "python", "app.py" ]
