.PHONY: install

PREFIX ?= ~/.local
install:
	cp template $(PREFIX)/bin/
