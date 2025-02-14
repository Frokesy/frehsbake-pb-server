# Use a lightweight Linux image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy the PocketBase binary into the container
COPY pocketbase /app/pocketbase

# Make the PocketBase binary executable
RUN chmod +x /app/pocketbase

# Ensure pb_data exists and is writable
RUN mkdir -p /app/pb_data && chmod -R 777 /app/pb_data

# Expose the default PocketBase port
EXPOSE 8080

# Command to run PocketBase
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:9000", "--dir", "/app/pb_data"]
