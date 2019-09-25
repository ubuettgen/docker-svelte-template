# Work in progress Svelte within Docker container

This fork adds Docker compatibility to the original project template for [Svelte](https://svelte.dev) apps, that lives at https://github.com/sveltejs/template.
In order to do so, some tweakings were applied to `package.json` and `rollup.config.js` files. Also a `Dockerfile` was added.
### No Nodejs install required on the host machine
Just make sure you have Docker installed and up and running.
Tested so far on Windows10 with Linux containers and on (K)ubuntu 18 LTS.
---
---
## Usage
To create a new project based on this template:
1. Create a folder for your project on the local machine.
2. Download the files `Dockerfile` and `init.sh` from this repository to that folder. 
3. Open terminal (Windows users, please use PowerShell only) and type:
```
cd your/path/to/your/project-folder
docker build -t <name-of-image> .
```
4. Wait until it's built then type:
#### Windows:
```
docker run -ti  --name <container_name) -v ${PWD}:/src -p 5000:5000 -p 35729:35729 <name-of-image> sh
```
if you get any error, use this:
```
docker run -ti --name <container_name) -v $pwd/:/src -p 5000:5000 -p 35729:35729 <name-of-image> sh
```
#### Linux
```
docker run -ti --name <container_name) -v $(pwd)/:/src -p 5000:5000 -p 35729:35729 <name-of-image> sh
```
5. Once inside the container, type:
```
/./init.sh
```
