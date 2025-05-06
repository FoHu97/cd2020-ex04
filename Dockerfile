FROM golang:1.20-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
# "The MAINTAINER instruction, used historically for specifying the author of the Dockerfile, is deprecated."
# See https://docs.docker.com/reference/build-checks/maintainer-deprecated/
LABEL org.opencontainers.image.authors="s2410455011@fhooe.at"

# Set working directory: `/src`
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY main.go .

# List items in the working directory (ls)
RUN ls

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o /usr/myapp main.go


#Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD ["/usr/myapp"]