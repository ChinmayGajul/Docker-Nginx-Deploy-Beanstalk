# Docker-Nginx-Deploy-Beanstalk Readme

This repository contains a Docker project that deploys a simple Snake game web application using Nginx and deploys it to AWS Elastic Beanstalk. Follow the steps below to set up and deploy the project.

## Prerequisites

Before you begin, make sure you have the following prerequisites in place:

1. **Docker**: You should have Docker installed on your local development machine. If you don't have it, you can install it by following the instructions on the [Docker website](https://www.docker.com/get-started).

2. **AWS Account**: You need an AWS account to deploy the Docker container on AWS ECS. If you don't have an AWS account, you can create one [here](https://aws.amazon.com/).

3. **Git**: Make sure you have Git installed on your local machine if you want to clone this repository.
   
## Project Overview 

This project focuses on creating a Docker file, Docker image, Docker container for a simple snake game web application using the Nginx web server. The snake game web application is composed of three files: `index.html`, `style.css`, and `main.js`. The Nginx web server is configured to serve these files on port 80. In summary, the primary objectives of this project include:

1. Creating a Dockerfile to define the image.
2. Building a Docker image based on the Dockerfile.
3. Creating a Docker container from the image.
4. Manually deploying the Docker container on AWS Elastic Beanstalk.


## Step 1: Clone the Repository
Before creating the Docker image, you need to obtain the web application files. If you have these files in a Git repository, you can clone the repository to your local machine. Here's how you can do it:

```bash
https://github.com/ChinmayGajul/Docker-Nginx-Deploy-Beanstalk.git
```

After cloning, navigate to the repository's directory containing the project files.
```bash
cd <repository_directory>
```
Once you have the files on your local machine, ensure that the necessary web application files (`index.html`, `style.css`, and `main.js`) are present.

## Step 2: Create a Dockerfile
The Dockerfile is a crucial component of this project as it defines the steps required to create the Docker image. In this project, we utilize the nginx:alpine base image and copy the web application files into the container, expose port 80, and configure the Nginx server to run in the foreground,you will find the necessary web application files like `index.html`, `style.css`, and `main.js`. Create a Dockerfile named `Dockerfile` (without an extension) in the same directory. Here's a detailed breakdown of the Dockerfile:

```Dockerfile
F# Use an official Nginx image as the base image
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
```

The Dockerfile's instructions are organized as follows:

- `FROM`: Specifies the base image (in this case, `nginx:alpine`).
- `RUN`: Executes a command during the Docker image build process.
- `EXPOSE`: Informs Docker that the container will listen on port 80.
- `CMD`: Specifies the command to run when the container starts.

This Dockerfile sets up an Nginx server and copies your web application files into the appropriate Nginx directory.

## Step 3: Build the Docker Image
Build a Docker image from the Dockerfile using the following command:

```bash
docker build -t snake-game-nginx .
```

This command will create a Docker image named `snake-game-nginx`.

## Step 4: Create a Docker Container
Run a Docker container using the image created in the previous step:

```bash
docker run -d -p 8080:80 snake-game-nginx
```

This command starts a container in detached mode, mapping port 8080 on your local machine to port 80 in the container.

## Step 5: Deploying on AWS Elastic Beanstalk

In the final step, we deploy the Docker container on AWS Elastic Beanstalk. This involves several manual steps on the AWS website:

1. **AWS Sign-in**: Sign in to the AWS Management Console.

2. **Elastic Beanstalk Setup**: Navigate to the AWS Elastic Beanstalk service.

3. **Create Application and Environment**: Create a new Elastic Beanstalk application and environment, specifying the necessary configuration, such as the platform, instance type, and scaling options.

4. **Container Registry**: Upload your Docker image to a container registry, such as Amazon Elastic Container Registry (ECR), and push the image to the registry.

5. **Environment Configuration**: Configure your Elastic Beanstalk environment to use your Docker image from the container registry. Ensure that you specify the image's repository and tag.

6. **Deployment**: Deploy the application to Elastic Beanstalk. The service will use the Docker image from your registry and launch your web application.


# Showcasing My Work

## Snake Game Web Application

### Website 1: [Custom-vsdcvid](http://3.128.118.224/)

![Snake Game Screenshot](snake_game_screenshot.png) 

**Description of Web application :-**
- This is a simple Snake game web application.
- Players can control the snake using arrow keys and collect food to score points.
- The game is hosted on AWS Elastic Beanstalk for online access.
  
## Clean Up

It's important to clean up your AWS resources when you're done to avoid incurring unnecessary charges. You can do this by deleting the ECS Service, Cluster, Task Definition, and ECR Repository.

## Conclusion

This README provides a comprehensive guide to the Docker project, including each step from creating the Dockerfile to deploying the application on AWS Elastic Beanstalk. For any specific issues or further assistance, consult the official Docker and AWS Elastic Beanstalk documentation for in-depth guidance and support.
