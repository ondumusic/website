---
title: Configuration
heading: Server configuration
description: Documentation about all configuration options for the Ondu Server.
lead: "The server is configured with environment variables, set under `environment:` in your `docker-compose.yml`. Only one is required; the Docker image takes care of the rest."
---

## Required

| Variable | What it does |
| --- | --- |
| `ONDU_URL` | The scheme and hostname you reach the server at, like `https://music.example.com`. Must match the address the apps will use. |

## General

| Variable | Default | What it does |
| --- | --- | --- |
| `ONDU_DATABASE_PATH` | `/data/ondu.db` | Where the SQLite database is stored. |
| `ONDU_DISABLE_WEB` | `false` | Set to `true` to turn off the built-in web player and only serve the API. |
| `ONDU_DISABLE_DOCS` | `false` | Set to `true` to turn off the server's own API docs at `/docs` and the OpenAPI spec at `/openapi`. The API itself keeps working. |
| `ONDU_SECRET_KEY_BASE` |  | Used to sign and encrypt secrets. At least 32 characters, 64 recommended. Generate one with `openssl rand -base64 48`, and keep it the same between restarts. |

> **Be aware.** The account and library setup forms are part of the web player, so finish
> [creating your account](setup.html#account) before turning it off.

## Where your music is stored

Music is read from a folder by default. It can also come from an S3 bucket, which is
experimental.

| Variable | Default | What it does |
| --- | --- | --- |
| `ONDU_STORAGE_DRIVER` | `file` | `file` for a folder (mounted at `/music` in the setup guide), or `s3` for an S3 bucket (experimental). |
| `ONDU_STORAGE_S3_BUCKET` | | The bucket your music is in. Required when using `s3`. |
| `ONDU_STORAGE_S3_REGION` | | The bucket's AWS region. Required when using `s3`. |

> **S3 is experimental.** It gets far less use than local files, so expect rough edges. AWS
> credentials are picked up the usual way: the standard `AWS_ACCESS_KEY_ID` and
> `AWS_SECRET_ACCESS_KEY` environment variables, a shared credentials file, or an IAM role when
> the server runs on AWS.

## Artwork

Album artwork comes from your music files: the artwork embedded in them, or an image in the
album's folder. Any artwork that is found while indexing is copied and resized into this folder.

| Variable | Default | What it does |
| --- | --- | --- |
| `ONDU_ARTWORK_PATH` | `/data/artwork` | Where album artwork is stored. |

## Transcoding

The original files are always sent as they are, unless an app asks for a transcoded
stream or download, for example to save mobile data. Transcoding uses `ffmpeg`.

| Variable | Default | What it does |
| --- | --- | --- |
| `ONDU_TRANSCODE_CACHE_PATH` | `/data/transcode-cache` | Where transcoded files are kept, so the same song isn't transcoded twice. |
| `ONDU_TRANSCODE_CACHE_MAX_SIZE` | `10240` (10 GB) | Maximum size of the cache in megabytes. The oldest files are removed after each library scan. To disable you can also set it to `0`. |
| `ONDU_TRANSCODE_MAX_CONCURRENCY` | `3` | How many transcodes can run at the same time. |
| `ONDU_TRANSCODE_QUEUE_SIZE` | `10` | How many transcode requests can wait in line for a free slot. |

## Everything in `/data`

With the Docker image's defaults, the database, artwork and transcode cache all live under
`/data`. Mount that one folder, like the `./data:/data` line in the
[setup guide](setup.html#run).

Your music folder is never written to, and it's the most
important thing to back up, but back up `/data` too, as it holds your account, playlists, play
history and any artist photos you've uploaded.
