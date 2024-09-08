install:
	pip3 install --upgrade --force-reinstall -r requirements.txt --break-system-packages

refresh-interface-files:
	cd scripts/gen-docs-helper
	python3 gen.py

dev:
	mkdocs serve

build:
	mkdocs build

.PHONY: install refresh-interface-files dev build