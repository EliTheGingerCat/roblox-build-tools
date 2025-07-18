# Roblox Build Tools

These are modules that I use to build Roblox games with Rojo. They are game-agnostic, meaning they can be used for any game by specifying the name of the build file (the file built with Rojo that ends in `.rbxl`).

This repository also demonstrates how game repositories should be structured. Obviously they will not need the `./modules` folder, but the `./lune` folder will be relevant. In the future this may be removed in favour of dumping all modules in the project root, but I think this is helpful. Game repositories will also need `./build_name.luau`.

Specifying build name in `./build_name.luau` is not very nice, but I can not think of any other solution. It is possible to use a `.txt` file in `./lune` but then all Lune scripts will be forced to require `@lune/fs` and read the file. This is not terrible, but I think it is still worse than just requiring a Luau file for the name. Moving `./build_name.luau` into `./lune` is also a decent option, but I do not like the fact that this causes it to show up when one runs:

```bash

lune list

```