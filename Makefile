prefix = /usr
PYTHON ?= python

servicedir = ${prefix}/lib/obs/service

all:

install:
	install -d $(DESTDIR)$(servicedir)
	install -m 0755 download_assets obs_scm_bridge $(DESTDIR)$(servicedir)
	install -m 0644 helpers.py $(DESTDIR)$(servicedir)

test:
	flake8 set_version tests/
	${PYTHON} -m unittest discover tests/

clean:
	find -name "*.pyc" -exec rm {} \;
	find -name '*.pyo' -exec rm {} \;
	rm -rf set_versionc

.PHONY: all install test
