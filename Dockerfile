#Use the official Golang image as the base image
FROM golang:1.22.0

#Adding maintainer
LABEL maintaniner="Karpov Maksim maksimkarpov2001@gmail.com"

#Set the working directory inside the container
WORKDIR /app

#Copy the source into the container
COPY ./cmd ./cmd
COPY ./web/public ./public
RUN mkdir -p /app/local_dir
COPY go.mod ./
COPY go.sum ./

#Build the Go application
RUN go build -o app ./cmd/voice_service
 
#Set the entry point for the container
CMD ("./app")

#build in this stage with docker or vagrant. Should build project with no errors



