# Atom OS Wrapper Makefile
# This Makefile wraps the Redox build system to provide a convenient interface
# from the root of the repository.

# Configuration
ARCH ?= aarch64
CONFIG_NAME ?= atom
REDOX_DIR = redox
CONFIG_SRC = atom_configuration/atom.toml
CONFIG_DEST = $(REDOX_DIR)/config/$(ARCH)/$(CONFIG_NAME).toml

.PHONY: all qemu sync help

# Default target
all: sync
	@echo "Building Atom OS for $(ARCH)..."
	$(MAKE) -C $(REDOX_DIR) all ARCH=$(ARCH) CONFIG_NAME=$(CONFIG_NAME) PODMAN_BUILD=1 FSTOOLS_IN_PODMAN=1 COOKBOOK_VERBOSE=$(LOGGING)

# Run in QEMU
qemu: sync
	@echo "Ensuring Atom OS is built (in container)..."
	$(MAKE) -C $(REDOX_DIR) all ARCH=$(ARCH) CONFIG_NAME=$(CONFIG_NAME) PODMAN_BUILD=1 FSTOOLS_IN_PODMAN=1 COOKBOOK_VERBOSE=$(LOGGING)
	@echo "Running Atom OS in QEMU (on host)..."
	$(MAKE) -C $(REDOX_DIR) qemu ARCH=$(ARCH) CONFIG_NAME=$(CONFIG_NAME) PODMAN_BUILD=0 SKIP_CHECK_TOOLS=1 live=no disk=nvme \
		-o build/$(ARCH)/$(CONFIG_NAME)/harddrive.img \
		-o build/$(ARCH)/$(CONFIG_NAME)/repo.tag \
		-o prefix

# Sync configuration
sync:
	@echo "Syncing configuration..."
	@mkdir -p $(dir $(CONFIG_DEST))
	@rm -f $(abspath $(CONFIG_DEST))
	@cp $(abspath $(CONFIG_SRC)) $(abspath $(CONFIG_DEST))
	@echo "Configuration copied: $(CONFIG_SRC) -> $(CONFIG_DEST)"

# Clean the redox build
clean:
	$(MAKE) -C $(REDOX_DIR) clean ARCH=$(ARCH)

# Help
help:
	@echo "Atom OS Build System"
	@echo ""
	@echo "Available targets:"
	@echo "  all    - Build the Atom OS image (wraps 'make all' in redox/)"
	@echo "  qemu   - Run Atom OS in QEMU (wraps 'make qemu' in redox/)"
	@echo "  sync   - Symlink atom_configuration to redox/config/"
	@echo "  clean  - Clean the build artifacts"
