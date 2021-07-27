SHELL=/bin/bash

PROJECTNAME_LOG=examplegolangdebproject

TAG=$(shell git describe --tags)
COMMIT=$(shell git rev-parse --short HEAD)
BUILD_TIME=$(shell date -u '+%Y-%m-%d_%H:%M:%S')

prefix = /usr/local

.PHONY: build/examplegolangdebproject
build/examplegolangdebproject:
	go build \
		-ldflags="-X 'main.version=$(TAG)' -X 'main.commit=$(COMMIT)' -X 'main.buildTime=$(BUILD_TIME)'" \
		-o build/${PROJECTNAME_LOG} cmd/log/main.go cmd/log/version.go


NAME_PROJECT ?= examplegolangdebproject
NICK_NAME_PROJECT ?= exitstop

.PHONY: change_name_project
change_name_project:
	./scripts/change_name_project.sh examplegolangdebproject $(NAME_PROJECT)
	./scripts/change_name_project.sh exitstop $(NICK_NAME_PROJECT)
	scripts/rename_file.sh examplegolangdebproject $(NAME_PROJECT)

# DEBIAN GENERATE

.PHONY: install
install: build/examplegolangdebproject
	install -D build/examplegolangdebproject $(DESTDIR)$(prefix)/exitstop/examplegolangdebproject/bin/examplegolangdebproject
	install -d $(DESTDIR)$(prefix)/../etc/exitstop/

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
		debian/examplegolangdebproject/ \
		debian/.debhelper/ \
		build/*
	-rm -f \
		debian/debhelper-build-stamp \
		debian/files \
		debian/examplegolangdebproject.debhelper.log \
		debian/examplegolangdebproject.postrm.debhelper \
		debian/examplegolangdebproject.substvars \
		../examplegolangdebproject_*_*.deb \
		../examplegolangdebproject_*_*.buildinfo \
		../examplegolangdebproject_*_*.changes
