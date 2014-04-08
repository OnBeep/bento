# Makefile for bento.
#
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: All rights reserved. Do not redistribute.
# Source:: https://github.com/OnBeep/bento
#


# Global/env vars:

.DEFAULT_GOAL := install

BUNDLE_CMD ?= ~/.rbenv/shims/bundle

BUNDLE_EXEC ?= bundle exec


# Target groups:

test: install

install: $(BUNDLE_CMD) bundle_install

clean:
    rm -rf chef-solo/cookbooks/*

build: clean install packer_build

# Bundler itself:
$(BUNDLE_CMD):
    gem install bundler

bundle_install:
    bundle install

berks_vendor: bundle_install
    bundle exec berks vendor chef-solo/cookbooks

packer_build: berks_vendor
    packer build -var 'chef_version=latest' ubuntu-12.04-amd64.json
