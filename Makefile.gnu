#
# Copyright (C) 2020 IBM. All Rights Reserved.
#
# See LICENSE.txt file in the root directory
# of this source tree for licensing information.
#

# Makefile for GNU-style make
#
# Author: Daniel Nicolas Gisolfi

repo=clai
version=TBD

intro:
    @echo "$(repo) v$(version)"

init-test:
    @python3 -m pip install -r requirements_test.txt 

clean:
    -rm -f *.pyc *.pyo *.pyd *\$$py.class
    # These two files will be updated by clai, we dont want to commit the testing data
    -git checkout anonymize.json
    -git checkout configPlugins.json

test:
ifeq (, $(shell which docker-compose 2> /dev/null))
    $(warning docker-compose not in $(PATH), running tests locally)
    $(MAKE) init-test
    @python3 -m pytest $(PWD)/test
else
    @echo "running tests in a docker container"
    @docker-compose run clai bash -c "cd /zclai && make init-test && python3 -m pytest ./test"
endif

dev: intro
ifeq (, $(shell which docker-compose 2> /dev/null))
    $(warning docker-compose not in $(PATH), running development script locally)
    @python3 develop.py install --path $(PWD)
else
    @echo "running development script in a docker container"
    @docker-compose run clai bash -c "cd /zclai && python3 develop.py install --path /zclai && bash"
endif
    
install: intro
ifeq ($(shell whoami), root)
    @echo "Installing clai as root"
    ./install.sh
else
    @echo "You are not running as the root user, will preform an install local to your user"
    ./install.sh --user
endif

uninstall: intro
ifeq ($(shell whoami), root)
    @echo "Uninstalling clai as root"
    ./uninstall.sh
else
    @echo "You are not running as the root user, will preform an uninstalling local to your user"
    ./uninstall.sh --user
endif

MAKE:
    intro
    install

.PHONY: intro init-test clean test dev install uninstall