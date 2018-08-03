BASEDIR = $(shell pwd)
REBAR = rebar3
RELPATH = _build/default/rel/newborn
PRODRELPATH = _build/prod/rel/newborn
DEV1RELPATH = _build/dev1/rel/newborn
DEV2RELPATH = _build/dev2/rel/newborn
DEV3RELPATH = _build/dev3/rel/newborn
APPNAME = newborn
SHELL = /bin/bash

release:
	$(REBAR) release

console:
	cd $(RELPATH) && ./bin/newborn console

prod-release:
	$(REBAR) as prod release

prod-console:
	cd $(PRODRELPATH) && ./bin/newborn console

compile:
	$(REBAR) compile

clean:
	$(REBAR) clean

test:
	$(REBAR) ct

devrel1:
	$(REBAR) as dev1 release

devrel2:
	$(REBAR) as dev2 release

devrel3:
	$(REBAR) as dev3 release

devrel: devrel1 devrel2 devrel3

dev1-console:
	$(BASEDIR)/_build/dev1/rel/newborn/bin/$(APPNAME) console

dev2-console:
	$(BASEDIR)/_build/dev2/rel/newborn/bin/$(APPNAME) console

dev3-console:
	$(BASEDIR)/_build/dev3/rel/newborn/bin/$(APPNAME) console

devrel-start:
	for d in $(BASEDIR)/_build/dev*; do $$d/rel/newborn/bin/$(APPNAME) start; done

devrel-ping:
	for d in $(BASEDIR)/_build/dev*; do $$d/rel/newborn/bin/$(APPNAME) ping; done

devrel-stop:
	for d in $(BASEDIR)/_build/dev*; do $$d/rel/newborn/bin/$(APPNAME) stop; done

start:
	$(BASEDIR)/$(RELPATH)/bin/$(APPNAME) start

stop:
	$(BASEDIR)/$(RELPATH)/bin/$(APPNAME) stop

attach:
	$(BASEDIR)/$(RELPATH)/bin/$(APPNAME) attach

