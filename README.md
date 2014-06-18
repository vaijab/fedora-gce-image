fedora-gce-image
================
**DISCLAIMER: This is NOT an official Fedora cloud image.**


Everything you need to be able to build a Fedora 20 cloud image for Google
Compute Engine using appliance-creator.

I assume that you already know what GCE is and have an account if you don't,
then check it out, because Google Cloud is pretty cool.

I created this repo to work on the image which hopefully will be provided by
Fedora Project itself pretty soon. I use exactly the same method of building
images as Fedora does (see kickstart files). I had to slightly modify the
kickstart files to include my yum repo
(https://copr.fedoraproject.org/coprs/zooz/gce/) which provides cloud-init
support for GCE metadata (until upstream merges my patches).

## Prebuilt Images
I have created an image and wil continue to create new ones regularly. So if
you just want to get started quickly and trust my work, then you're welcome to
use the images I build.

This will create a new image from a tarball which contains just a `disk.raw`
disk image.

* `gcutil addimage fedora-20 gs://cloud-images/fedora-20-latest.tar.gz`

## Build Your Own
* `git clone https://github.com/vaijab/fedora-gce-image.git`
* `cd fedora-gce-image`
* `yum install appliance-tools xz`
* `sudo make`

This will take a few minutes and will produce tarball containing `disk.raw` file.

Then you have to upload it to a google cloud storage bucket which you have access to.
* `gsutil cp fedora-20.tar.gz gs://<your-bucket-name>`

..and finally create a new image out of the uploaded tarball.
* `gcutil addimage fedora-20 gs://<your-bucket-name>/fedora-20.tar.gz`

## Issues
If you have any issues building the image or running it on GCE, create an issue
(https://github.com/vaijab/fedora-gce-image/issues/new) and I will happily help.

## Contributing
Thanks! And you're welcome!

