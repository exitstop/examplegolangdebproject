SHELL=/bin/bash

NAME_PROJECT ?= examplegolangdebproject
OS ?= linux
ARCH ?= amd64

TAG ?= $(shell git describe --tags)
COMMIT ?= $(shell git rev-parse --short HEAD)
BUILD_TIME ?= $(shell date -u '+%Y-%m-%d_%H:%M:%S')

prefix = /usr/local

.PHONY: build/examplegolangdebproject
build/examplegolangdebproject:
	./scripts/build.sh \
		-a $(OS) \
		-b $(ARCH) \
		-c $(TAG) \
		-d $(COMMIT) \
		-e $(NAME_PROJECT) \
		-f $(BUILD_TIME) \
		-g $(NAME_PROJECT)

.PHONY: run/examplegolangdebproject
run/examplegolangdebproject: build/examplegolangdebproject
	./build/$(NAME_PROJECT)

.PHONY: run/version
run/version: build/examplegolangdebproject
	./build/$(NAME_PROJECT) -v

NICK_NAME_PROJECT ?= exitstop

.PHONY: change_name_project
change_name_project:
	./scripts/change_name_project.sh examplegolangdebproject $(NAME_PROJECT)
	./scripts/change_name_project.sh exitstop $(NICK_NAME_PROJECT)
	scripts/rename_file.sh examplegolangdebproject $(NAME_PROJECT)

# DEBIAN GENERATE

.PHONY: install
install: build/examplegolangdebproject
	install -D build/$(NAME_PROJECT) $(DESTDIR)$(prefix)/exitstop/$(NAME_PROJECT)/bin/$(NAME_PROJECT)
	install -d $(DESTDIR)$(prefix)/../etc/exitstop/

.PHONY: generate-changelog
generate-changelog:
	gbp dch --new-version=$(shell git describe --tags | cut -b 2-) --ignore-branch --git-author

.PHONY: build-debian
build-debian:
	dpkg-buildpackage \
		-us -uc --build=binary \
		--host-arch $(ARCH)

.PHONY: build-debian-all-platform
build-debian-all-platform:
	install -d package/linux
	install -d package/darwin
	rm package/linux/*||echo 0
	rm package/darwin/*||echo 0
	make build-debian ARCH=arm64 OS=linux TAG=$(TAG) COMMIT=$(COMMIT) NAME_PROJECT=$(NAME_PROJECT) BUILD_TIME=$(BUILD_TIME) PRODUCT=$(NAME_PROJECT)
	cp ../$(NAME_PROJECT)*.deb package/linux
	make build-debian ARCH=amd64 OS=linux TAG=$(TAG) COMMIT=$(COMMIT) NAME_PROJECT=$(NAME_PROJECT) BUILD_TIME=$(BUILD_TIME) PRODUCT=$(NAME_PROJECT)
	cp ../$(NAME_PROJECT)*.deb package/linux
	make build-debian ARCH=amd64 OS=darwin TAG=$(TAG) COMMIT=$(COMMIT) NAME_PROJECT=$(NAME_PROJECT) BUILD_TIME=$(BUILD_TIME) PRODUCT=$(NAME_PROJECT)
	cp ../$(NAME_PROJECT)*.deb package/darwin
	make build-debian ARCH=arm64 OS=darwin TAG=$(TAG) COMMIT=$(COMMIT) NAME_PROJECT=$(NAME_PROJECT) BUILD_TIME=$(BUILD_TIME) PRODUCT=$(NAME_PROJECT)
	cp ../$(NAME_PROJECT)*.deb package/darwin

.PHONY: clean
clean:
	-rm -rf \
		debian/$(NAME_PROJECT)/ \
		debian/.debhelper/ \
		build/*
	-rm -f \
		debian/debhelper-build-stamp \
		debian/files \
		debian/$(NAME_PROJECT).debhelper.log \
		debian/$(NAME_PROJECT).postrm.debhelper \
		debian/$(NAME_PROJECT).substvars \
		../$(NAME_PROJECT)*_*.deb \
		../$(NAME_PROJECT)*_*.buildinfo \
		../$(NAME_PROJECT)*_*.changes
