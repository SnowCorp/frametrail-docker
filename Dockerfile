#####################################
FROM alpine AS project

## Update system
RUN apk update && apk upgrade

## Install Git
RUN apk add --no-cache bash git openssh

## Clone FrameTrail
RUN git clone https://github.com/OpenHypervideo/FrameTrail

## Create .htaccess with configuration settings
RUN cd FrameTrail touch .htaccess

#####################################
FROM mattrayner/lamp:latest

## Copy the downloaded Git Project into app
COPY --from=project /FrameTrail /app

##Execute LAMP
CMD ["/run.sh"]
