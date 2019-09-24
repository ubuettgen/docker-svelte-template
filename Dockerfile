# Use Alpine Linux as our base image so that we minimize the overall size our final container, 
# and minimize the surface area of packages that could be out of date.
FROM node:alpine

# COPY ./run.sh /run.sh 
COPY ./init.sh /init.sh 

RUN apk update git asciidoctor libc6-compat libstdc++ \
    && apk upgrade \
    && apk add --no-cache ca-certificates \
    && apk add --no-cache nano #\
#     && chmod 0777 /run.sh \
  	&& chmod 0777 /init.sh
RUN mkdir -p /src/sveltedev \
    && cd /src \
    && npx degit --force mihaimiculescu/svelte-template sveltedev \
    && cd /src/sveltedev \
    && npm install --force

VOLUME /src
# VOLUME /output ?? MAI VEDEM

WORKDIR /src/svelte
#CMD ["/run.sh"]

EXPOSE 5000
