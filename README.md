# ncarglow_docker

Ncarglow docker base image with packages installed so you can clone the ncar glow repo, build, and run pytest successfully.

Uncomment end of Dockerfile to clone, build, and run pytest on main ncar glow repo.  

If you would like to clone an alternate fork feel free to modify Dockerfile or just clone/setup after building.

```bash
# build container and tag
docker build -t ncarglow_container .

# spawn container in background
docker run -d -it ncarglow_container

# Now attach however you like now (vscode has a docker and remote container extension)
```
