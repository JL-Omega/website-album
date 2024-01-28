# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# Set metadata information
LABEL maintainer="Jean-Luc Mpande"

# Update package lists, install Nginx, and create a 'data' directory
RUN apt-get update && apt-get install nginx -y && mkdir /var/www/html/ImageGallery

# Copy the contents of the 'src' directory to the Nginx HTML directory
ADD src/ /var/www/html
ADD ImageGallery/ /var/www/html/ImageGallery

# Expose port 80 to allow external access to the Nginx web server
EXPOSE 80

# Start Nginx and run it in the foreground
CMD ["nginx", "-g", "daemon off;"]