---
title: API
heading: The Ondu API
description: A quick overview of the Ondu API.
lead: "The Ondu server has a small, plain HTTP API, and it's the same one the
iPhone and Mac apps use. If you like to tinker around you'll probably enjoy this!"
---

Every endpoint is documented in the [API reference](api-reference.html),
or alternatively you can also download
the [OpenAPI spec](openapi.json) directly.

## Inspiration
Here are some ideas you could try and build for yourself.

### Your own smart playlists
You could build your own smart playlists, for example based on play count
("most played") or haven't heard in a while ("last played over a year ago")
or never listened to.

### Artist photos from your own source
Music files don't include them but the apps do show them when present (and
allow uploading), but that requires a lot of manual work. Why not try and
automate this!

### Your own data on albums and artists
Annotations are a simple key-value store for your scripts, on any album or artist.
Maybe you want to look up every artist on MusicBrainz and store their MBIDs so
you could build some kind of custom discovery script to try and find music you
might like based on your library!

### Make your own player
The apps use the same API, so you could build your own app as well! Maybe you
are a devoted TempleOS user who wants to build a music client for that?
