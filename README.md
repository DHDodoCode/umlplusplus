# UML++ ![workflow](https://github.com/DHDodoCode/umlplusplus/actions/workflows/publishImage.yml/badge.svg) [![codecov](https://codecov.io/gh/DHDodoCode/umlplusplus/graph/badge.svg?token=O1OVBC8L21)](https://codecov.io/gh/DHDodoCode/umlplusplus)

UML++ is a C++ & Javascript editor and generator of UML class diagrams.

## Features

- Add, delete, and rename classes within a UML class diagram.
- Store methods (with parameters) and fields within classes.
- Add and delete four types of relationships between classes (aggregation, composition, generalization, realization).
- View classes and diagram through a command line or graphical interface.
- Save and load JSON files that store UML class diagram information.
- Save images of generated UML class diagrams within the GUI.

## Dependencies

### Docker Image
- Docker (4.34.2+)
### Manual Build
- A C++ compiler
- cmake (3.18.1+)
- git (2.28.0+)

## Docker Image Instructions

1. With Docker installed, install the latest version of the Docker image.
```
docker pull ghcr.io/dhdodocode/umlplusplus:develop
```
2. For CLI, use "--cli" argument. The interface will open in your command line. 
For help, type 'help' in the command line or see USER_GUIDE.md.
```
docker run -i -t ghcr.io/dhdodocode/umlplusplus:develop ./project --cli
```
3. For GUI, provide no argument. Open port 60555 and enter interface in your browser through localhost:60555. When running, press "help" to enter a webpage that provides a user guide for using the GUI interface. Further information about the GUI can be found in USER_GUIDE.md.
```
docker run -i -t ghcr.io/dhdodocode/umlplusplus:develop ./project
```

**WARNING:** To both retrieve saved diagrams and load previously made diagrams in the CLI, you will need to run `docker container cp`.

To save a file from your PC, you must have the container ID of the container previously used to run and save your UML diagram.
```
docker cp container_id:/diagram.json diagram.json
```
To load a file into the container, you must have the container ID of a container using the previously mentioned Docker image.
```
docker cp diagram.json container_id:/diagram.json
```

## Manual Build Instructions

1. Clone this repository locally.
```
git clone --recurse-submodules -j8 https://github.com/DHDodoCode/umlplusplus.git
```
2. Go to repository root directory.
```
cd umlplusplus
```
3. Create and then build the project using the following commands.
```
cmake -B build 
cmake --build build --parallel
```
4. Navigate to the build folder that you have created. You must be in the build folder to run the program.
```
cd build
```
5. For CLI, use "--cli" argument. The interface will open in your command line. 
For help, type 'help' in the command line or see USER_GUIDE.md.
```
./project --cli
```
6. For GUI, provide no argument. Open port 60555 and enter interface in your browser through localhost:60555. When running, press "help" to enter a webpage that provides a user guide for using the GUI interface. Further information about the GUI can be found in USER_GUIDE.md.
```
./project
```
## Dependencies

[JSON for Modern C++ - Niels Lohmann](https://github.com/nlohmann/json) ([MIT License](https://raw.githubusercontent.com/nlohmann/json/develop/LICENSE.MIT))

[GoogleTest - Google](https://github.com/google/googletest) ([BSD-3-Clause](https://raw.githubusercontent.com/google/googletest/master/LICENSE))

[cpp-httplib - Yuji Hirose](https://github.com/yhirose/cpp-httplib) ([MIT License](https://raw.githubusercontent.com/yhirose/cpp-httplib/master/LICENSE))

[inja - pantor](https://github.com/pantor/inja) ([MIT License](https://raw.githubusercontent.com/pantor/inja/master/LICENSE))

[svg.js - svgdotjs](https://github.com/svgdotjs/svg.js) ([MIT License](https://raw.githubusercontent.com/svgdotjs/svg.js/master/LICENSE.txt))

[svg.draggable.js - svtdotjs](https://github.com/svgdotjs/svg.draggable.js) ([MIT License](https://raw.githubusercontent.com/svgdotjs/svg.draggable.js/master/LICENSE))

[svg-pan-zoom - bumbu](https://github.com/bumbu/svg-pan-zoom) ([BSD 2-Clause "Simplified" License](https://raw.githubusercontent.com/bumbu/svg-pan-zoom/master/LICENSE))

[cli - daniele77](https://github.com/daniele77/cli) ([Boost Software License 1.0](https://raw.githubusercontent.com/daniele77/cli/master/LICENSE))

## Authors
[DHDodo](https://github.com/DHDodo) - Briar Sauble

[jtsha](https://github.com/jtsha) - Jordan Shaffer

[ttpyork](https://github.com/ttpyork) - Tyler York

[NicatFire](https://github.com/NicatFire) -  Nick Wells

[lgnzg](https://github.com/lgnzg) - Logan Zug

[DragonArchon](https://github.com/DragonArchon) - Matt Giacoponello
