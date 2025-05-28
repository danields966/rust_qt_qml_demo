# rust_qt_qml_demo

A demonstration of a minimal desktop application using Qt with Rust and QML, cross-compiled for Windows (x86_64-pc-windows-gnu) on a Linux host.

## Prerequisites

* **Docker** (to run the multi-stage build for cross-compiling Qt and the Rust binary)
* **GNU Make** (for convenience targets)
* **Rust toolchain** (if you plan to compile natively or modify the Rust code)
    ```
    rustup toolchain install stable
    rustup target add x86_64-pc-windows-gnu
    ```

## Project Structure

    .
    ├── Cargo.toml           # Rust package manifest
    ├── build.rs             # Build script for cxx-qt integration
    ├── Dockerfile           # Multi-stage build for Qt and Rust cross-compilation
    ├── Makefile             # Convenience targets (e.g. win64)
    ├── README.md            # This file
    ├── qml/                 # QML interface files
    │   ├── main.qml
    │   └── qml.qrc
    └── src/                 # Rust source code
    ├── cxxqt_object.rs
    └── main.rs

## Usage

### 1. Build for Windows (x86_64)

This will:

* **Build a static Qt** (5.15.17) for Windows using MinGW-w64 in Docker.
* **Cross-compile** the Rust application and bundle the .exe.
* **Export** the final executable under bin/.

```
make win64
```

After running this, you will find the Windows executable in the bin/ directory:

```
bin/rust_qt_qml_demo.exe
```

### 2. Build for Linux (x86_64)

```
make linux64
```

After running this, you will find the Linux executable in the bin/ directory:

```
bin/rust_qt_qml_demo
```

### 3. Native Linux build (optional)

To run or iterate on the Rust/QML code on Linux, you can build and run natively:

```
cargo build
cargo run
```

_Note: Native builds assume you have Qt installed on your system with QML support._

## Makefile Targets

* `make win64`: Perform the full Docker-based cross-compilation for Windows.
* `make clean`: Remove Docker images and clean up build artifacts.

## License

Typical open-source license or whatever applies.
