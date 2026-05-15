#!/bin/bash

# Login to ECR
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin 271159173584.dkr.ecr.us-east-1.amazonaws.com

# Stop old container
docker stop myapp-container || true

# Remove old container
docker rm myapp-container || true

# Remove old image
docker rmi 271159173584.dkr.ecr.us-east-1.amazonaws.com/myapp:latest || true

# Pull latest image
docker pull 271159173584.dkr.ecr.us-east-1.amazonaws.com/myapp:latest

# Run latest container
docker run -d -p 5000:5000 --name myapp-container \
271159173584.dkr.ecr.us-east-1.amazonaws.com/myapp:latest
