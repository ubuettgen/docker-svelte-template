#!/bin/sh
#start your new Svelte project witn this

cd /sveltedev
cp -R public src /src/svelte
rm -R public src
npm run dev
