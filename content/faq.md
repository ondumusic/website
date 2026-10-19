---
title: FAQ
heading: Questions
description: Common questions about Ondu for iPhone and Mac.
---

## The basics

{{< question "What is Ondu?" >}}
Ondu is a self-hosted music library that comes with native apps for iPhone and
Mac, and Android coming soon.
{{< /question >}}

{{< question "Do I have to run a server?" >}}
Yes. The server is provided as a Docker image and the [setup guide](setup.html)
helps you get started.
{{< /question >}}

{{< question "How much does it cost?" >}}
Nothing at all. It's even open-source!
{{< /question >}}

{{< question "Can I listen on Windows, Linux or Android?" >}}
Android is in development, Windows and Linux are not yet planned at this time.

The Ondu Server does include a basic web-based player as well, so you can still
enjoy your music on these platforms using your web browser.
{{< /question >}}

{{< question "Does this replace Spotify, Apple Music, etc?" >}}
It depends. To stream your own music library on your devices definitely, but for
music discovery, the social aspect and finding fun playlists and everything it
is not.

Personally I see it as two separate things that you can use side by side.
{{< /question >}}

{{< question "Does it work with CarPlay?" >}}
Not yet, but it's on the list.
{{< /question >}}


## Library and playback

{{< question "Where can I get music for Ondu?" >}}
DRM-free music files can be purchased at websites like:

- Bandcamp
- iTunes Store
- Qobuz
- Amazon
- other online stores..

Depending on local laws you could also copy your local CD collection.
{{< /question >}}

{{< question "Which file formats does it understand?" >}}
The Ondu Server supports most audio files you have. The apps depend on the
supported audio formats from the operating systems. When a device can't
play a format natively, like Ogg or Opus on iPhone, the server will transcode
it on the fly.
{{< /question >}}

{{< question "Where do album artwork and song details come from?" >}}
Ondu reads the tags of your music files, and any embedded artwork or included
images like `cover.jpg`/`front.jpg` etc. Ondu will never try to find any
metadata or artwork online, so if something is incorrect or missing you'll need
to fix it yourself and Ondu will pick it up on the next scan.
{{< /question >}}

{{< question "Why is some album artwork missing?" >}}
Ondu only shows artwork that's embedded in your music files, or in an image like `cover.jpg` in the same folder. Some online stores, like iTunes, don't actually embed the artwork in the downloaded music files by default but only store it in their local database.

When artwork is missing you can use a tag editor application to embed artwork in
your music files directly, or just save the artwork as a `cover.jpg` in the same
directory as the album and Ondu should pick it up.
{{< /question >}}

{{< question "Why do artists not have photos?" >}}
Music files never include artist photos and Ondu doesn't fetch anything from
external sources. You can add a photo to any artist in the iPhone or Mac app,
or you can automate it yourself by writing a script and using the [API](api.html).
{{< /question >}}

{{< question "Does it send play counts to my server?" >}}
Yes, by default it will. You can disable this in the apps.
{{< /question >}}

## Downloads

{{< question "How do I download music?" >}}
Choose **Download** from the menu on any song, album, artist or playlist. You
can also have new music download automatically as it's added to the server.
{{< /question >}}

{{< question "Will it download over mobile data?" >}}
Yes, unless you disabled this in your operating system. You can also change the
download and/or streaming quality profiles in settings to save bandwidth.
{{< /question >}}

{{< question "Can I edit playlists offline?" >}}
Yes. Any changes you make are stored locally and will be sent to the server the
next time it can connect.
{{< /question >}}

## Running the server

{{< question "Do I need to back up anything?" >}}
Your music folder is most important, of course. But if you also want to back up
your playlists, play history and artist photos you should also back up the
server's `/data` folder.
{{< /question >}}

{{< question "I forgot my password." >}}
You can reset it from the server, for example:

```
docker exec <container> bin/reset-password <username>
```
{{< /question >}}

{{< question "I can't sign in after too many wrong passwords." >}}
There is a global login limiter to try and minimise brute force attempts. After
10 failed attempts in 15 minutes, sign-in is blocked for a while. Wait it out,
or restart the container to reset the limit.

If a login is blocked by the limiter, any existing sessions should still work
as normal.
{{< /question >}}

{{< question "Does it work with Subsonic apps?" >}}
No, that was not one of the goals of this project.
{{< /question >}}

## Account and privacy

{{< question "What data do you collect?" >}}
None. The apps only talk to your own self-hosted server. There are no analytics,
no ads and no third-party services. The [privacy policy](privacy.html) has more
details.
{{< /question >}}

{{< question "What happens when I sign out?" >}}
Your library and downloads are removed from that device. Nothing on the server
changes.
{{< /question >}}

{{< question "I was asked to sign in again. Did I lose anything?" >}}
No. If your session expired the app asks for your password again, but it keeps
your library and downloads unless you decide to sign out.
{{< /question >}}

Can't find an answer here? {{< email "Send me an email" >}}.
{.more}
