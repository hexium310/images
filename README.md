```sh
docker build --build-arg USER=username -t image-name -f ArchLinux.Dockerfile .
docker create -it --name container-name image-name
docker start -i container-name
```
