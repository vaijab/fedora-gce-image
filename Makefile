VERSION = 20
FILENAME = "fedora-$(VERSION)-$(shell date +%Y%m%d).tar.gz"
DEPS = xz appliance-creator tar

all: check_root check_deps build
clean: check_root clean-custom

build:
	appliance-creator -c fedora-x86_64-cloud.ks -n fedora-$(VERSION) --cache /var/cache/appliance-creator &> build.log
	xz -dc fedora-$(VERSION)/fedora-$(VERSION)-sda.raw.xz > fedora-$(VERSION)/disk.raw
	tar -C fedora-$(VERSION)/ -zcf $(FILENAME) disk.raw

clean-custom:
	rm -rf fedora-$(VERSION)/ fedora-*.tar.gz build.log

check_root:
	@if [ "$(USER)" != "root" ]; then \
		echo "Error: please run make as root or using sudo"; exit 2; \
	else true; fi

check_deps:
	$(foreach dep,$(DEPS),type $(dep) || (echo "$(dep) not found" && exit 2);)
