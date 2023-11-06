# Use an official Nginx image as the base image
FROM nginx:latest

# Install Git
RUN apt-get update && apt-get install -y git

# Clone your Git repository
RUN git clone https://github.com/ChinmayGajul/Docker-Nginx-Deploy-Beanstalk.git /tmp/repo

# Move the repository contents to Nginx document root
RUN mv /tmp/repo/* /usr/share/nginx/html/

# Remove the temporary directory
RUN rm -rf /tmp/repo

# Expose port 80 (Nginx's default HTTP port)
EXPOSE 80

# Start the Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]
