#!/bin/bash

NAME="pytorch"
SSH_PORT=2626
USERNAME="user"
#HTTP_PROXY="http://192.41.170.23:3128"
#HTTPS_PROXY="http://192.41.170.23:3128"
FILE_PATH="/mnt/Data/code/machine_learning/code/Explainable-Detection-of-Online-Sexism/models/"

if [ -z "$HTTP_PROXY" ] 
then
   docker build --build-arg USERNAME=$USERNAME -t $NAME .
else
   docker build --build-arg USERNAME=$USERNAME -t $NAME --build-arg HTTP_PROXY=$HTTP_PROXY --build-arg HTTPS_PROXY=$HTTPS_PROXY .
fi

docker run -d -p $SSH_PORT:22 -v $FILE_PATH:/home/$USERNAME/models --gpus all --name $NAME $NAME