repo --name=fedora --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-20&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f20&arch=x86_64
#repo --name=updates-testing --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f$releasever&arch=$basearch

# FIXME this is a temporary repo which provides GCE specific packages which have to be included
repo --name zooz-gce --baseurl=http://copr-be.cloud.fedoraproject.org/results/zooz/gce/fedora-20-x86_64/
