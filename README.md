# R-Type

A networked remake of the classic horizontal shoot'em up **R-Type**, built on our
own game engine. Up to four players fight waves of Bydos together. An
authoritative, multithreaded server runs the game, and each player uses a
graphical client.

Epitech project (B-CPP-500, Advanced C++).

## Repository layout

This repository gathers every part of the project as git submodules:

| Folder | Repository | Content |
|---|---|---|
| `GameClient/` | [Space-Type/Game-Client](https://github.com/Space-Type/Game-Client) | `r-type_client`: rendering, input and audio (raylib) |
| `Server/` | [Space-Type/Server](https://github.com/Space-Type/Server) | `r-type_server`: game logic and networking |
| `Documentation/` | [Space-Type/Documentation](https://github.com/Space-Type/Documentation) | Developer documentation and protocol |

Both programs use [Wrecks](https://github.com/Space-Type/Wrecks), our ECS and
networking engine, as a submodule.

## Requirements

Supported platform: **Linux** (Windows support in progress).

- A C++23 compiler (GCC 14 or newer)
- CMake 3.20 or newer
- git, curl, zip, unzip, tar and pkg-config (used by vcpkg to bootstrap itself)
- OpenGL and X11 development packages (system libraries used by raylib):

```sh
sudo dnf install mesa-libGL-devel libX11-devel libXrandr-devel libXinerama-devel libXcursor-devel libXi-devel   # Fedora
sudo apt install libgl1-mesa-dev libx11-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev              # Ubuntu
```

Every other dependency comes from git submodules (raylib, Wrecks) or from
[vcpkg](https://vcpkg.io), which is itself a submodule bootstrapped
automatically: nothing else has to be installed on the system.

## Build

```sh
git clone --recursive https://github.com/Space-Type/R-Type.git
cd R-Type
cmake -S . -B build
cmake --build build --parallel
```

On Windows (Visual Studio), build with `cmake --build build --config Release --parallel`.

The `r-type_server` and `r-type_client` binaries are written at the root of the
repository. If the repository was cloned without `--recursive`, the first
`cmake` fetches the submodules itself.

## Usage

```sh
./r-type_server    # listens on UDP port 5432
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
