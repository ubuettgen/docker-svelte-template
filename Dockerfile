# Use Alpine Linux as our base image so that we minimize the overall size our final container, and minimize the surface area of packages that could be out of date.
FROM node:alpine

RUN apk add --update git asciidoctor libc6-compat libstdc++ \
    && apk upgrade \
    && apk add --no-cache ca-certificates \
    && apk add --no-cache nano \
    && cd / \
    && npx degit --force ubuettgen/docker-svelte-template sveltedev 
    
RUN npm install
    
VOLUME /sveltedev/src
VOLUME /sveltedev/public

WORKDIR /sveltedev

EXPOSE 5000 35729 3572
