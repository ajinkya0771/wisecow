FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY wisecow.sh /usr/local/bin/wisecow.sh
RUN chmod +x /usr/local/bin/wisecow.sh

# Add fortune and cowsay to PATH
ENV PATH="/usr/games:${PATH}"

EXPOSE 4499

CMD ["/usr/local/bin/wisecow.sh"]
