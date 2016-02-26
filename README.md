# Publishing a Ceylon distribution

This Docker images is meant for publishing the modules that make up an official Ceylon distribution to a Herd server.

The following images/tags are available:

 - `latest` ([ceylon-publish/Dockerfile](https://github.com/ceylon-docker/ceylon-publish/blob/master/Dockerfile))

To run the build perform the following steps:

 1. First make sure you have built the [Ceylon ZIP file](https://hub.docker.com/r/ceylon/ceylon-build/). The name of the ZIP file will be `ceylon-VERSION.zip` where `VERSION` is a number that will be used as an argument in step 3.
 2. `docker pull ceylon/ceylon-publish:latest`
 3. `docker run -ti --rm -v /tmp/ceylon:/output ceylon/ceylon-publish:latest 1.2.1 "http://localhost:9000/uploads/2/repo/" admin admin

This assumes that your Herd server is running locally on port `9000` and that the user `admin` (with password `admin`) has previously prepared a new upload and was given the above mentioned URL.

