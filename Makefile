SHELL = /bin/bash

VIRTUALENV_PATH = ansible/venv
ACTIVATE_SCRIPT = ${VIRTUALENV_PATH}/bin/activate

ACTIONS =
ACTIONS += up
ACTIONS += provision

.PHONY: all
all: ${ACTIVATE_SCRIPT}

.PHONY: ${ACTIONS}
${ACTIONS}: ${ACTIVATE_SCRIPT}
	source $< && vagrant $@

${ACTIVATE_SCRIPT}:
	virtualenv --python python2 ${VIRTUALENV_PATH}
	source $@ && pip install ansible'<'2.4

.PHONY: clean
clean:
	rm -rf ${VIRTUALENV_PATH}
