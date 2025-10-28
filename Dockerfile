# Use a lightweight base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y cowsay fortune netcat-openbsd && apt-get clean

# Copy the script
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make it executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the default port
EXPOSE 4499

# Run the script
CMD ["/usr/local/bin/wisecow.sh"]
