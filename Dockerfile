# Use Alpine Linux as our base image so that we minimize the overall size our final container, and minimize the surface area of packages that could be out of date.
FROM node:alpine

COPY ./init.sh /init.sh 

RUN apk add --update git asciidoctor libc6-compat libstdc++ \
    && apk upgrade \
    && apk add --no-cache ca-certificates \
    && apk add --no-cache nano \
 	&& chmod 0777 /init.sh \
    && cd / \
    && npx degit --force mihaimiculescu/docker-svelte-template#dev sveltedev \
    && cd /sveltedev \
    && npm install --force

VOLUME /sveltedev/src
VOLUME /sveltedev/public

WORKDIR /sveltedev
CMD ["/init.sh"]

EXPOSE 5000 35729 3572
