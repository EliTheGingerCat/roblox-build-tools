# Roblox Build Tools

## Terminology

Lune: https://lune-org.github.io/
Game repository: Any of my repositories that contains the code for one of my Roblox games.
However*2: "however" multiplied by 2. A double "however". Similar to a double negative, the second "however" counteracts the first "however", making the initial argument valid again.

## Only For Me

This repository and any of my repositories that link to this message ("Projects") are not developed with the intention of making it easy to contribute. I am not against pull requests on these Projects, but there are a couple issues:

### Out of sync

- Someone downloads this repository and a game repository (such as [`ethical-eli-hub](https://github.com/EliTheGingerCat/ethical-eli-hub)).
- I make a breaking change in this repository.
- I update the game repository to deal with the breaking change.
- The person pulls in the latest changes on the game repository.
- They try running one of the Lune scripts.
- The script expected this tools repository to also be updated.
- The script may not work as intended, possibly causing harm to the person.

### Hardcoded

The `./lune/.luaurc` file in each game repository expects a certain path to the modules in this repository.

### Downloading

Right now, there is no way to easily download this repository so that one can work with the Lune scripts in a game repository. [Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) or a package manager (such as [pesde](https://pesde.dev/) (which has Lune support!)) could work, and it also solves all the problems above, but that adds extra work for me, especially since I do not really know how to automate package publishing and stuff. And if these Projects are only intended to be used by me, then why would I add more work for myself to let other people easily contribute even though it is unlikely anyone ever will?

### That is circular logic

Making it easy for people to contribute is hard
--> Do not make it easy to contribute
--> Contributing is hard
--> People do not want to contribute
--> Nobody contributes
--> There is no point spending effort to make it easy to contribute
--> Do not make it easy to contribute

Okay, fair enough.

Though, I think there is a separate reason that nobody will ever contribute: the game repositories are not made for popular Roblox games. These games do not have any community around them. Nobody cares about them (except me, a little).

However, I *am* interested in working on one of my games with another developer, so maybe this whole section will get removed in the future. However*2, I think we could just notify each other in private messages whenever this repository is updated.

### So why is all this public?! 😠

Because I love open source! ❤️

## Description

These are modules that I use to build Roblox games with Rojo. They are game-agnostic, meaning they can be used for any game by specifying the name of the build file (the file built with Rojo that ends in `.rbxl`).

This repository also demonstrates how game repositories should be structured. Obviously they will not need the `./modules` folder, but the `./lune` folder will be relevant. In the future this may be removed in favour of dumping all modules in the project root, but I think this is helpful. Game repositories will also need `./build_name.luau`.

Specifying build name in `./build_name.luau` is not very nice, but I can not think of any other solution. It is possible to use a `.txt` file in `./lune` but then all Lune scripts will be forced to require `@lune/fs` and read the file. This is not terrible, but I think it is still worse than just requiring a Luau file for the name. Moving `./build_name.luau` into `./lune` is also a decent option, but I do not like the fact that this causes it to show up when one runs:

```bash

lune list

```