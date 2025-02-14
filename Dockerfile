# Use a lightweight Alpine Linux base image
FROM alpine:latest  

# Set the working directory inside the container
WORKDIR /app  

# Install dependencies: curl and unzip
RUN apk add --no-cache curl unzip  

# Download the latest PocketBase release
RUN curl -fsSL https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase-linux-amd64.zip -o pocketbase.zip  

# Unzip and clean up
RUN unzip pocketbase.zip && rm pocketbase.zip  

# Give execution permission
RUN chmod +x pocketbase  

# Start PocketBase on port 3000
CMD ["./pocketbase", "serve", "--http=0.0.0.0:3000"]
