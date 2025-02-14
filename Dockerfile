# Use a lightweight Linux image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy the PocketBase binary into the container
COPY pocketbase /app/pocketbase

# Make the PocketBase binary executable
RUN chmod +x /app/pocketbase

# Ensure /data exists and is writable
RUN mkdir -p /data && chmod -R 777 /data

# Expose the default PocketBase port
EXPOSE 8080

# Command to run PocketBase
CMD ["./pocketbase serve --http 0.0.0.0:9000 --dir /app/pb_data"]
