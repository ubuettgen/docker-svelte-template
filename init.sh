#!/bin/sh
#start your new Svelte project witn this

cd /src
mkdir svelte
cd /sveltedev
cp -R public src /src/svelte
npm run dev
