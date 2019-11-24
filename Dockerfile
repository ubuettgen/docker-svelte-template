# Use Alpine Linux as our base image so that we minimize the overall size our final container, and minimize the surface area of packages that could be out of date.
FROM node:alpine

RUN apk add --update git asciidoctor libc6-compat libstdc++ \
    && apk upgrade \
    && apk add --no-cache ca-certificates \
    && apk add --no-cache nano \
    && cd / \
    && npx degit --force mihaimiculescu/docker-svelte-template sveltedev 
    
VOLUME /sveltedev/src
VOLUME /sveltedev/public

WORKDIR /sveltedev

EXPOSE 5000 35729 3572

RUN cd / \
    && npx degit --force mihaimiculescu/docker-svelte-template#withsvelma sveltedev \
    && cd /sveltedev \
    && npm install --force \
    && sed -i -e '/"name": "svelma",/a\    "svelte": "src/index.js",' /sveltedev/node_modules/svelma/package.json \
    && sed -i -e 's/0.7.5/0.8.0/g'  /sveltedev/node_modules/svelma/package.json \
    && rm /sveltedev/package-lock.json \
    && npm install
