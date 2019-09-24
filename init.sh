#!/bin/sh
#start your new svelte project witn this

cd /src/sveltedev
npm install --force
copy public src /src/svelte
npm run dev

#npm install creates this:
#	node_modules
#package-lock.json
#package.json
#	public
#rollup.config.js
#	src
#and in the public folder:
#favicon.png
#global.css
#index.html
# npm run dev creates some extra files in public folder:
# global.css
# bundle.css
# bundle.css.map
# bundle.js
# bundle.js.map
