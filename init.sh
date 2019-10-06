#!/bin/sh
#start your new Svelte project witn this

cd /src
if [ ! -d svelte ]; then mkdir svelte ;fi
cd svelte
if [ ! -d public ]; then cp -R /sveltedev/public . ;fi
if [ ! -d src ]; then cp -R /sveltedev/src . ;fi
cd /sveltedev
npm run dev
