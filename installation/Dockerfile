FROM ubuntu:22.04

RUN apt-get update

# Create a non-root user for testing


WORKDIR /installations

COPY . .

ENTRYPOINT ["/bin/bash"]

CMD ["-i"]



