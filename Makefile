SHELL=/bin/bash

PROJECTNAME_LOG=logservice

TAG=$(shell git describe --tags)
COMMIT=$(shell git rev-parse --short HEAD)
BUILD_TIME=$(shell date -u '+%Y-%m-%d_%H:%M:%S')

prefix = /usr/local

.PHONY: build/logservice
build/logservice:
	go build \
		-ldflags="-X 'main.version=$(TAG)' -X 'main.commit=$(COMMIT)' -X 'main.buildTime=$(BUILD_TIME)'" \
		-o build/${PROJECTNAME_LOG} cmd/log/main.go cmd/log/version.go


NAME_PROJECT ?= nameproject
NICK_NAME_PROJECT ?= nickname

.PHONY: change_name_project
change_name_project:
	./scripts/change_name_project.sh logservice $(NAME_PROJECT)
	./scripts/change_name_project.sh exitstop $(NICK_NAME_PROJECT)
	scripts/rename_file.sh logservice $(NAME_PROJECT)

# DEBIAN GENERATE

.PHONY: install
install: build/logservice
	install -D build/logservice $(DESTDIR)$(prefix)/yournickname/logservice/bin/logservice
	install -d $(DESTDIR)$(prefix)/../etc/yournickname/

.PHONY: generate-changelog
generate-changelog:
	gbp dch --new-version=$(shell git describe --tags | cut -b 2-) --ignore-branch --git-author

.PHONY: build-debian
build-debian:
	dpkg-buildpackage \
		-us -uc --build=binary \
		--host-arch $(ARCH)

.PHONY: clean
clean:
	-rm -rf \
		debian/logservice/ \
		debian/.debhelper/ \
		build/*
	-rm -f \
		debian/debhelper-build-stamp \
		debian/files \
		debian/logservice.debhelper.log \
		debian/logservice.postrm.debhelper \
		debian/logservice.substvars \
		../logservice_*_*.deb \
		../logservice_*_*.buildinfo \
		../logservice_*_*.changes
