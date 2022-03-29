#!/bin/bash

correct=0
questions=0

calculate_score() {
    ((questions = questions + 1))

    if [[ correct -eq 0 ]]; then
        echo "     
########################################

       Wrong! There is no tomorrow, 
       so get this right now!

########################################
             "
        echo "     
########################################

 You got nothing correct. Stop and go study.

########################################
             "
    else
        score=$(((questions / correct) * 100))
        echo "     
########################################

   You scored $score% on Docker review.

########################################
             "
    fi
}

increment_correct_responses() {
    ((correct = correct + 1))
}

increment_questions_count() {
    ((questions = questions + 1))
}

affirm_answer() {
    if [[ -z "$1" ]]; then
        echo "
########################################
              Correct
########################################
    "
    else
        echo "     
########################################
              Correct
########################################
             "
        echo "$1"
    fi
}

evaluate_answer() {

    if [ "$1" == "$2" ]; then
        increment_correct_responses
        affirm_answer "$3"
    else
        echo "     
########################################
        
       Wrong! There is no tomorrow, 
       so get this right now!

        
       Your answer:     ""$1""
       Correct answer:  ""$2""

########################################
             "
    fi
}

evaluate_answer_written_with_code() {
    increment_questions_count

    if [[ "$1" == "$2" ]]; then
        increment_correct_responses
        affirm_answer "$3"
    else

        echo "     
########################################
        
       Wrong! There is no tomorrow, 
       so get this right now!

        
       Your answer:     ""$1""
       Correct answer:  ""$2""

########################################
             "
        calculate_score
        exit 1
    fi
    calculate_score
}

next_question() {
    echo "
 ########################################
             Next Question 
 ########################################
"
}

next_line() {
    echo "
 ########################################
                Next Line 
 ########################################
"
}

read -p "What do you run to start the docker/getting-started image? " response
answer="docker run -d -p 80:80 docker/getting-started"
evaluate_answer "$response" "$answer"

next_question

read -p "What does each flag mean? " response
answer="-d - run the container in detached mode -p 80:80 - map port 80 of the host to port 80 in the container docker/getting-started - the image to use"
additional_feedback="
    -d - run the container in detached mode (in the background)
    -p 80:80 - map port 80 of the host to port 80 in the container
    docker/getting-started - the image to use

"
evaluate_answer "$response" "$answer"

next_question

read -p "What is a container? " response
answer="A process on a machine that is isolated from all other processes on the host machine."
evaluate_answer "$response" "$answer"

next_question

read -p "How is isolation achieved in containers? " response
answer="Isolation is achieved through leveraging kernel namespaces and cgroups."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a container image? " response
answer="A container image is an isolated filesystem containing everything needed to run an application - all dependencies, configuration, scripts, binaries, and other configurations for the container, such as environment variables, a default command to run, and other metadata."
additional_feedback="

    If you're familiar with chroot, think of a container as an 
    extended version of chroot. The filesystem is simply coming 
    from the image. But, a container adds additional isolation 
    not available when simply using chroot.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Create an alpine nodejs version 12 image. " response
answer="FROM node:12-alpine"
additional_feedback="

    FROM node:12-alpine

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an alpine nodejs version 12 image. 

    FROM node:12-alpine

Enter the next line: " response
answer="RUN apk add --no-cache python3 g++ make"
additional_feedback="

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an alpine nodejs version 12 image. 

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make

Enter the next line: " response
answer="WORKDIR /app"
additional_feedback="

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make
    WORKDIR /app
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an alpine nodejs version 12 image. 

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make
    WORKDIR /app

Enter the next line: " response
answer="COPY . ."
additional_feedback="

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make
    WORKDIR /app
    COPY . .
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an alpine nodejs version 12 image. 

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make
    WORKDIR /app
    COPY . .

Enter the next line: " response
answer="RUN npm install --production"
additional_feedback="

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make
    WORKDIR /app
    COPY . .
    RUN npm install --production
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an alpine nodejs version 12 image. 

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make
    WORKDIR /app
    COPY . .
    RUN npm install --production
    
Enter the next line: " response
answer="CMD [\"node\", \"src/index.js\"]"
additional_feedback="

    FROM node:12-alpine
    RUN apk add --no-cache python3 g++ make
    WORKDIR /app
    COPY . .
    RUN npm install --production
    CMD [\"node\", \"src/index.js\"]
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Execute a command that builds getting-started container image. " response
answer="docker build -t getting-started ."
evaluate_answer "$response" "$answer"

next_question

read -p "Execute a command that stops a running container and removes it. " response
answer="docker ps docker stop <the-container-id> docker rm <the-container-id>"
additional_feedback="

    $ docker ps docker
    $ docker stop <the-container-id>
    $ docker rm <the-container-id>

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are volumes? " response
answer="Volumes provide the ability to connect specific filesystem paths of the container back to the host machine, so changes in the container are also on the host machine."
evaluate_answer "$response" "$answer"

next_question

read -p "What command shows where the a volume stores data? " response
answer="docker volume inspect todo-db"
evaluate_answer "$response" "$answer"

next_question

read -p "Execute a npm command in a container? " response
answer="docker exec -it <container-id> bash -c npm install"
evaluate_answer "$response" "$answer"

next_question

read -p "What happens to the layers that are cached during Docker when one of the dependencies change? " response
answer="Once a layer changes, all downstream layers have to be recreated."
evaluate_answer "$response" "$answer"

next_question

read -p "Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. " response
answer="FROM node:latest as build"
additional_feedback="

    FROM node:latest as build

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build


Enter the next line: " response
answer="WORKDIR /app"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build

    WORKDIR /app

Enter the next line: " response
answer="COPY package*.json ./"
additional_feedback="

    FROM node:latest as build
    
    WORKDIR /app

    COPY package*.json ./

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build
    
    WORKDIR /app

    COPY package*.json ./


Enter the next line: " response
answer="RUN npm ci"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./

    RUN npm ci

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./

    RUN npm ci


Enter the next line: " response
answer="COPY . ./"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./


Enter the next line: " response
answer="RUN npm run build"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build


Enter the next line: " response
answer="FROM nginx:stable-alpine"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine


Enter the next line: " response
answer="COPY --from=build /app/dist /usr/share/nginx/html"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine

    COPY --from=build /app/dist /usr/share/nginx/html

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine

    COPY --from=build /app/dist /usr/share/nginx/html


Enter the next line: " response
answer="COPY ./shared/config/nginx.conf /etc/nginx/conf.d/default.conf"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine

    COPY --from=build /app/dist /usr/share/nginx/html

    COPY ./shared/config/nginx.conf /etc/nginx/conf.d/default.conf

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine

    COPY --from=build /app/dist /usr/share/nginx/html

    COPY ./shared/config/nginx.conf /etc/nginx/conf.d/default.conf


Enter the next line: " response
answer="EXPOSE 80"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine

    COPY --from=build /app/dist /usr/share/nginx/html

    COPY ./shared/config/nginx.conf /etc/nginx/conf.d/default.conf

    EXPOSE 80

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. 
    
    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine

    COPY --from=build /app/dist /usr/share/nginx/html

    COPY ./shared/config/nginx.conf /etc/nginx/conf.d/default.conf

    EXPOSE 80


Enter the next line: " response
answer="CMD [\"nginx\", \"-g\", \"daemon off;\"]"
additional_feedback="

    FROM node:latest as build

    WORKDIR /app

    COPY package*.json ./
    
    RUN npm ci

    COPY . ./

    RUN npm run build



    FROM nginx:stable-alpine

    COPY --from=build /app/dist /usr/share/nginx/html

    COPY ./shared/config/nginx.conf /etc/nginx/conf.d/default.conf

    EXPOSE 80

    CMD [\"nginx\", \"-g\", \"daemon off;\"]

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Create a Dockerfile that performs a multi-build step for a web that is copied into ngnix. " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Execute the command to install redis inside of a container. " response
answer="docker-compose exec <service-name> npm install"
evaluate_answer "$response" "$answer"

next_question

read -p "

    How do you reference the test build stage from the following Docker instructions? 
    
    FROM node:14.15.4 as base

    WORKDIR /code

    COPY package.json package.json
    COPY package-lock.json package-lock.json

    FROM base as test
    RUN npm ci
    COPY . .
    CMD [ \"npm\", \"run\", \"test\" ]

    FROM base as prod
    RUN npm ci --production
    COPY . .
    CMD [ \"node\", \"server.js\" ]


Enter the your answer: " response
answer="docker build -t node-docker --target test ."
additional_feedback="


    Now that our test image is built, we can run it in a container and see if our tests pass.


    $ docker run -it --rm -p 8000:8000 node-docker

"
evaluate_answer "$response" "$answer"

next_question

read -p "Which Docker commands create layers. " response
answer="RUN, COPY, and  ADD create layers."
evaluate_answer "$response" "$answer"

next_question

read -p "What does a multi-build stage process do? " response
answer="This allows you to include tools and debug information in your intermediate build stages without increasing the size of the final image."
evaluate_answer "$response" "$answer"

next_question

read -p "What does the ADD command do" response
answer="The ADD command does local-only tar extraction and remote URL download."
evaluate_answer "$response" "$answer"

next_question

read -p "What are pods? " response
answer="Pods are groups of co-located containers that share some resources."
evaluate_answer "$response" "$answer"

next_question

read -p "What are deployments? " response
answer="Deployments are scalable groups of pods maintained automatically by Kubernetes."
evaluate_answer "$response" "$answer"

next_question

read -p "What does a NodePort do? " response
answer="A NodePort service will route traffic from port on the host machine to port inside the pods."
evaluate_answer "$response" "$answer"

next_question

read -p "What commands allow for viewing the docker-compose configuration? " response
answer="docker-compose config"
evaluate_answer "$response" "$answer"

next_question

read -p "What do links do? " response
answer="Links allow developers to define extra aliases for a service to reach another service."
evaluate_answer "$response" "$answer"

next_question

read -p "
    Run a command that will clean up any resources — images, containers, volumes, 
    and networks — that are dangling (not associated with a container). " response
answer="docker system prune"
evaluate_answer "$response" "$answer"

next_question

read -p "Run a command that removes any stopped containers and all unused images (not just dangling images). " response
answer="docker system prune -a"
evaluate_answer "$response" "$answer"

next_question

read -p "Run a command that removes one or more specific images. " response
answer="docker images -a docker rmi <image-id>"
additional_feedback="

    List:
    $ docker images -a
 
    Remove:
    $ docker rmi <image-id>

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "List all dangling images and remove them. " response
answer="docker images -f dangling=true docker image prune"
additional_feedback="

    List:

    $ docker images -f dangling=true
 
    Remove:

    docker image prune

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Run a command that removes all images. " response
answer="docker images -a docker rmi $(docker images -a -q)"
additional_feedback="
    List:

    $ docker images -a
 
    Remove:

    $ docker rmi $(docker images -a -q)
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Run a command to remove a specific container. " response
answer="docker ps -a docker rm <container-id>"
additional_feedback="
    List:

    $ docker ps -a
 
    Remove:

    $ docker rm <container-id>
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Run a command to remove a specific container after it exits. " response
answer="docker run --rm <image-name>"
evaluate_answer "$response" "$answer"

next_question

read -p "Run a command to remove all exited containers. " response
answer="docker ps -a -f status=exited docker rm $(docker ps -a -f status=exited -q)"
additional_feedback="

    List:

    $ docker ps -a -f status=exited
 
    Remove:

    $ docker rm $(docker ps -a -f status=exited -q)

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Run a command to stop and remove all containers. " response
answer=""
additional_feedback="

    List:

    $ docker ps -a
 
    Remove:

    $ docker stop $(docker ps -a -q)
    $ docker rm $(docker ps -a -q)

"
evaluate_answer "$response" "$answer" "$additional_feedback"
The main benefit behind this recommendation is that a makefile helps in providing a standard interface to build Docker images

########################################
#         Calculate your score         #
########################################

calculate_score
