# Atom OS

Atom OS is a cross-platform operating system that uses [Redox](https://www.redox-os.org/) instead of Linux. Redox is a new alternative to Linux that uses a microkernel architecture with a focus on security and performance. 

## Security by design

- Over half of iOS exploits are due to memory corruption bugs. These are easier to prevent with a Rust-based foundation that uses formal verification for the kernel.

- Privilege escalation is much harder to achieve with a microkernel architecture that runs drivers in userspace.

- Each program is sandboxed and completely isolated from the main system.


## Cross-platform performance

- The OS is designed to run on any Intel/AMD, ARM and RISC-V processors for desktop, mobile, servers and embedded devices.

- The minimal image can run on embedded devices with as little as 50MB of RAM, with the desktop variant using less than 512MB of RAM.

## For an intelligent era of computing

Atom OS is designed to be AI-powered with a focus on a new age of computing.

- Full context-aware history across your data using a new file-system based on memories and documents. [SurrealDB](https://surrealdb.com/) is used to automatically index and organize your data for AI agents.

- Use natural language to interact with your digital world and physical devices.

- AI agents can be spawned to perform tasks on your behalf.



![Flow Diagram](docs/assets/FlowDiagram.gif)

