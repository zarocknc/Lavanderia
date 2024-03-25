# Use the official Rust image.
FROM rust:latest as builder

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Build the application
RUN cargo build --release

# Use the official Debian slim image.
FROM debian:slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the compiled binary from the builder stage
COPY --from=builder /app/target/release/untitled .

# Set the environment variable
ENV DATABASE_URL=your_database_url

# Expose port 3000
EXPOSE 3000

# Run the binary
CMD ["./untitled"]