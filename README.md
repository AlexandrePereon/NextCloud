# Personal NextCloud

This project is a boilerplate to deploy a personal Nextcloud instance for family and close friends, hosted here:
https://cloud.alexandrepereon.fr

## Description

This repository allows you to quickly launch a Nextcloud instance with a MariaDB database, Redis cache, and a Traefik reverse proxy for SSL certificate management and routing.

### Custom Nextcloud Image

The Docker image used here is customized to include facial recognition via the [Face Recognition app](https://github.com/matiasdelellis/facerecognition). This app automatically analyzes photos to identify and group people, relying on Dlib and pdlib libraries. For more information on installation and configuration, see the official app documentation: https://github.com/matiasdelellis/facerecognition

## Technologies Used

- **Nextcloud** (custom image with facial recognition)
- **MariaDB** (database)
- **Redis** (cache)
- **Traefik** (reverse proxy, automatic HTTPS)
- **Docker Compose** (orchestration)

## Usage

This project is a simple boilerplate:
- Clone the repository
- Adjust the environment variables
- Launch with Docker Compose

Traefik must already be configured on the external Docker network `traefik-net`.

## Access

The instance is available at:
https://cloud.alexandrepereon.fr