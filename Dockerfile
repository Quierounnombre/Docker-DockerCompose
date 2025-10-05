FROM docker:24.0.5-cli

RUN apk add --no-cache git py3-pip curl \
    # Add required build dependencies for PyYAML
    build-base python3-dev libffi-dev openssl-dev cython

RUN pip install docker-compose

# Clone the repo
# (Replace with your actual repo)
RUN git clone https://github.com/Quierounnombre/importcoffe_forked.git /app

# Set working directory inside cloned repo
WORKDIR /app

# Copy .env from build context into the repo
COPY .env .env

# Optional: default to docker-compose command
ENTRYPOINT ["docker compose up"]
