# R-Type

A networked remake of the classic horizontal shoot'em up **R-Type**, built on our
own game engine. Up to four players fight waves of Bydos together. An
authoritative, multithreaded server runs the game, and each player uses a
graphical client.

Epitech project (B-CPP-500, Advanced C++).

## Repository layout

This repository gathers every part of the project as git submodules:

| Folder         | Repository                                                          | Content                                                    |
|----------------|---------------------------------------------------------------------|------------------------------------------------------------|
| `lib/wrecks/`  | [Space-Type/Wrecks](https://github.com/Space-Type/Wrecks)           | `libwrecks.a`: ECS library                                 |
| `lib/protecs/` | [Space-Type/Protecs](https://github.com/Space-Type/Protecs)         | `libprotecs.a`: UDP protocol and shared components library |
| `src/client/`  | [Space-Type/Game-Client](https://github.com/Space-Type/Game-Client) | `r-type_client`: rendering, input and audio (raylib)       |
| `src/server/`  | [Space-Type/Server](https://github.com/Space-Type/Server)           | `r-type_server`: game logic and networking                 |


Both programs use [Wrecks](https://github.com/Space-Type/Wrecks), our ECS and
networking engine, as a submodule.

## Requirements

Supported platforms: **Linux** (tested on Ubuntu and Arch), **Windows 10**, **Windows 11**

- A C++23 compiler (GCC 14 or newer, MSVC 19 / Visual Studio 2026)
- CMake 3.20 or newer
- Raylib (may be installed via `vcpkg.json`)

Every other dependency comes from git submodules (raylib, Wrecks) or from
[vcpkg](https://vcpkg.io), which is itself a submodule bootstrapped
automatically: nothing else has to be installed on the system.

## Installation

To build and install the project, you first need to
clone the repository:

``` sh
git clone --recursive https://github.com/Space-Type/R-Type.git rtype
cd rtype
```

> [!NOTE]
> If you forgot to add the `--recursive` flag,
> you must initialize the submodules with the
> following command:
> ```sh
> git submodule update --init --recursive
> ```

Once cloned, if you do not already have the external
dependencies installed, you may install them using `vcpkg`:

``` sh
vcpkg install --vcpkg-root "$VCPKG_ROOT"
```

After making sure you have all external dependencies installed,
you can build the project using CMake:
```sh
cmake -DCMAKE_BUILD_TYPE=Release -S . -B build
cmake --build build --parallel
```

> [!IMPORTANT]
> Windows ignores the `CMAKE_BUILD_TYPE` variable,
> meaning you may not get the release version
> of the game if you use the commands above.
> Instead, you should build with:
> ```sh
> cmake --build build --config Release --parallel
> ```

The `r-type_server` and `r-type_client` binaries are written at the root of the
repository.

## Usage

To run the server, all you need to
do is run the executable:
```sh
./r-type_server  # listens on UDP port 5432

```

To run the client, all you need to
do is run the executable:
```sh
./r-type_client
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for the workflow (branches, commits,
pull requests and reviews). Each component has its own developer documentation,
for example [GameClient/src/render/README.md](GameClient/src/render/README.md)
for the client's rendering layer.

## Authors

- Bard-Gaming
- Sejnoune
- AdryzR

## License

[GNU GPL v3](LICENSE)
