INSTALL_DIR=install

all: packages dots

packages:
	@echo "installing packages"
	bash $(INSTALL_DIR)/install_packages.sh

dots:
	@echo "installing dots"
	python3 $(INSTALL_DIR)/install_dots.py

.PHONY: packages dots
