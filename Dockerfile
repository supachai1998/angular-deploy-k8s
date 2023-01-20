# Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:latest as build

# Set the working directory
WORKDIR /usr/local/app

# Add the source code to app
COPY ./ /usr/local/app/

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:latest

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/angular-tour-of-heroes /usr/share/nginx/html

# Expose port 4200
EXPOSE 4200

# name image is supachai19998/angular-tour-of-heroes:test
# docker build -t supachai19998/angular-tour-of-heroes:test .
# docker run -d -p 4200:4200 supachai19998/angular-tour-of-heroes:test
# docker logs 

# curl http://localhost:4200

# docker rm -f $(docker ps -a -q) && docker rmi supachai19998/angular-tour-of-heroes:test

# docker push supachai19998/angular-tour-of-heroes:test