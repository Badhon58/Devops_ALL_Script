### Load balancer:

- Load balancing is the process of distributing network traffic across a group of backend servers, also known as a server farm or server pool.
- This ensures no single server bears too much demand/load
- By spreading the load evenly, load balancing improves application responsiveness

- Create a Container nginx with interacting mode
  $ docker run -it --rm nginx bash

- Now we need to changed the file
  /etc/nginx/conf.d/default.conf

---

```
# Create a network name my_net
$ docker network create my_net

# now create image of con1 and con2 and container named container_name_1 and container_name_2

$ docker build -t con1 .
$ docker build -t con2 .

$ docker run --name con1 -itd --net my_net -p 81:80 container1
$ docker run --name con2 -itd --net my_net -p 82:80 container2

$ docker run -it --name reverse-proxy \
    --network nginx-net \
    -v $PWD/default.conf:/etc/nginx/conf.d/default.conf:ro \
    -p 80:80 nginx

```

---

# From Start

## Container 1

**_ Create A Single Container first with named container 1 _**

- Dockerfile

```
FROM nginx:alpine
COPY index.html /usr/share/nginx/html
```

- index.html

```
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Container 1</title>
  </head>
  <body>
    <p style="background-color: red">Container 1 Running</p>
  </body>
</html>

```

- Create a image with name container_1_image
  $ docker build -t container_one .

- Create

---

## Container 2

**_ Create A Single Container first with named container 2 _**

- Dockerfile

```
FROM nginx:alpine
COPY index.html /usr/share/nginx/html
```

- index.html

```
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Container 2</title>
  </head>
  <body>
    <p style="background-color: yellow">Container 2 Running</p>
  </body>
</html>

```

- Create a image with name container_2_image
  $ docker build -t container_two .

- now in nginx part

- Create a network first
  $ docker network create my_net

- Now in home dir create a default.conf file

```
# inside default.conf
upstream backends {
    server container_name_1:80;
    server container_name_2:80;
}

server {
    listen   80;
    listen [::]:80;
    server_name localhost;

    location / {
        proxy_pass http://backends;
    }
}


```

- Create a network first
  $ docker network create my_net

- Create a container with the name container_1
  $ docker run --name container_name_1 -itd -p 81:80 --network my_net container_one

- Create a container with the name container_2
  $ docker run --name container_name_2 -itd -p 82:80 --network my_net container_two

- Now run this docker command to create a nginx-proxy-manager command
  $ docker run -it --name reverse-proxy \
   --network my_net \
   -v $PWD/default.conf:/etc/nginx/conf.d/default.conf:ro \
   -p 80:80 nginx
