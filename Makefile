VERSION = 20
USER = $(shell whoami)
FILENAME = "fedora-$(VERSION)-$(shell date +%Y%m%d).tar.gz"

all:
	sudo appliance-creator -c fedora-x86_64-cloud.ks -n fedora-$(VERSION) --cache /var/cache/appliance-creator &> build.log
	xz -dc fedora-$(VERSION)/fedora-$(VERSION)-sda.raw.xz > disk.raw
	tar -zcf $(FILENAME) disk.raw

clean:
	sudo rm -rf fedora-$(VERSION)/ fedora-*.tar.gz build.log disk.raw
