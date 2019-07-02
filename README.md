# JikanREST Docker [![Build Status](https://travis-ci.org/tzw0745/jikan-rest-docker.svg?branch=master)](https://travis-ci.org/tzw0745/jikan-rest-docker)

🐳 A docker stack for Jikan REST API:

- [Jikan REST API](https://github.com/jikan-me/jikan-rest)
- [php:7.3.2-apache-stretch](https://github.com/docker-library/php/blob/3c64c61733a19863c5283f3f336add33dd298eeb/7.3/stretch/apache/Dockerfile)
- [redis:5.0.3](https://github.com/docker-library/redis/blob/7be79f51e29a009fefdc218c8479d340b8c4a5e1/5.0/Dockerfile)

## Installation

Build/run containers with `docker-compose`:

```bash
$ docker-compose build
$ docker-compose up -d
```

Build/run with your own redis server:

```bash
vim .env  # change REDIS_HOST
vim Dockerfile  # remove number sign (#) of line 21
docker build . -t jikan-rest-img
docker run -d -p 9000:80 --name jikan-rest-api jikan-rest-img
```

## Usage

Access the API (v3) `port 9000`:

```
http://localhost:9000/public/v3
```

Request `Anime` example:

```
http://localhost:9000/public/v3/anime/1
```

## More info

- [Jikan REST API](https://github.com/jikan-me/jikan-rest)
- [API docs](https://jikan.docs.apiary.io)
