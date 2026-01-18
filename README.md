# Atom OS

Atom OS is a new cross-platform operating system that is built on top of the [Redox kernel](https://www.redox-os.org/). Redox is an alternative to Linux that uses a microkernel architecture with a focus on security and performance.

The OS is a rethink of how computing should work in the modern age. It is designed to be AI-powered with a focus on a new age of computing. It is also built to be secure, fast and compact.

### Security advantages

- Over half of iOS exploits are due to memory corruption bugs. These are easier to prevent with a Rust-based foundation that uses formal verification on the kernel.

- Privilege escalation is much harder to achieve with a microkernel architecture that runs drivers in userspace.

- Each program is also sandboxed and completely isolated from the main system itself.


### Cross-platform

- The OS is designed to run on ARM processors for desktop, mobile, servers and embedded devices.

### Intelligence

Atom OS is designed to be intelligent at the core of the user experience.

- Full context-aware history across your data using a new file-system based on memories and documents. [SurrealDB](https://surrealdb.com/) is used to automatically index and organize your data for AI agents.

- Use natural language to interact with your digital world and physical devices. See the full list of supported connections for MCP servers [here](https://github.com/modelcontextprotocol/servers?tab=readme-ov-file#-third-party-servers) and smart home devices [here](https://matter-smarthome.de/en/overview-products-compatible-with-matter/).

- AI automations can be spawned to perform tasks on your behalf across your digital world and physical devices.

- Generative UI enables agents to control the user interface. This means that you can collaboratively interact with your computer and AI hands free.


![Flow Diagram](docs/assets/FlowDiagram.gif)

### Use cases

- **Personal computing**

    Atom OS is intended for use in the [Atom 1](https://atomcomputers.org/) as a private offline AI-powered operating system.

- **Robotics**

    Keeping the robot's long-term memory on the robot itself instead of in the cloud to ensure privacy and security.

- **IoT & embedded devices**

    Making intelligent devices such as offline security camera monitoring systems, smart home devices, and more.

- **Servers**

    Businesses that want to connect their data and devices to an intelligent system they control for automation and analysis.

## Supported Architectures

- aarch64

## Building Atom OS

Atom OS is built using the Redox OS build system, which is included as a submodule.

### Prerequisites

- **Rust Nightly**: The build system requires a nightly version of Rust.
  ```sh
  rustup toolchain install nightly
  rustup default nightly
  ```
- **Build Tools**: You will need standard build tools (make, nasm, etc.). On macOS, it is highly recommended to use **Podman** to build in a container to avoid compatibility issues.
  ```sh
  brew install podman
  podman machine init
  podman machine start
  ```

### Build Instructions

1.  **Initialize the repository:**
    ```sh
    git submodule update --init --recursive
    ```

3.  **Build the image:**
    Run `make` from the project root. This will automatically sync the configuration and build the image.
    ```sh
    make all
    ```
    *Note: The first build will take a significant amount of time as it compiles the toolchain and all packages.*

4.  **Run in QEMU:**
    ```sh
    make qemu
    ```

### Customization

- **Configuration**: Edit `atom_configuration/atom.toml` to add packages or change settings.
- **Files**: Place custom files (wallpapers, configs) in `atom_configuration/files/` and reference them in `atom.toml`.
- **Recipes**: Add custom recipes to `atom_configuration/recipes/` to patch or create new packages.
