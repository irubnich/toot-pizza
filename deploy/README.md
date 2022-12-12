# toot.pizza on Linode via Docker Compose
This folder contains the deploy stuff for the [toot.pizza](https://toot.pizza) Linode.

## Build and deploy process
1. Build, tag, and push the `irubnich/toot-pizza` Docker image. This is just the official Mastodon Docker image with the changes from this repo.
2. Update the tag in the Dockerfile in this folder
3. Make sure you have `.env.production` in this folder with all the secrets
4. `docker compose build`
5. `docker compose restart`

## Quirks
1. This is a fork of Mastodon so it's not 100% the same as upstream
2. `db-cert.crt` is Digital Ocean Postgres' certificate. It's needed for the streaming API or else it fails to serve requests with a certificate validation error when trying to talk to the DB.
