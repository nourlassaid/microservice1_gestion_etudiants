# Use an official MySQL image as the base image
FROM mysql:latest

# Set environment variables
ENV MYSQL_DATABASE="formation_management"
ENV MYSQL_ALLOW_EMPTY_PASSWORD = "0000"

# Copy the SQL file into the docker-entrypoint-initdb.d directory
COPY init.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306