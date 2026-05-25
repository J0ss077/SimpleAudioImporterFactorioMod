# Simple Audio Importer

A simple mod for importing audios/music/soundFXs into Factorio, mainly made for non-modders and being used in servers (to play music and prank your friends xd)

## How it works?

The mod works with 2 parts: the importer (this mod) which scans the list of mods in search of the template (or any other mod that meets the same conditions as the template), and then initiates the import attempt.

## How do I use it?

1. First, you will need to have the importer installed (this mod). Then you can add as many custom mods as you want (following the same template specifications).

2. To create a custom build of the audios you want to import, visit the importer's [Web-Tool](https://j0ss077.github.io/SimpleAudioImporterFactorioMod) (insert the audios, a few more necessary data, and it will give you a custom `.zip`).

3. Move all the custom `.zip` files to the game's mods folder, and then you can start Factorio.

All imported sounds will be available through the **Programmable Speaker**, inside the "_instrument category_" called **Simple Audio Importer**.

# Manual Tutorial (using the template)

Here we're gonna create a custom build manually (intended for more experienced users, probably modders themselves).

### Requirements

- **Simple Audio Importer** must be installed in Factorio before using this template.
- Your audio files must be in `.wav` or `.ogg` format. **Factorio does not support `.mp3` files.**

## Step 1 — Download the template

Download the [Simple-Audio-Template](https://github.com/J0ss077/SimpleAudioTemplateFactorioMod) repository as a `.zip` and extract it. The extracted folder is your starting point.

## Step 2 — Add your audio files

Copy your `.wav` or `.ogg` files into the `audios/` folder. For this example, we are adding two songs:

```
audios/
├── california-gurls.wav
└── sweet-child-o-mine.wav
```

## Step 3 — Register your audio files

Open `F077-sai-index.lua` with any text editor. List your files by name, one per line, surrounded by quotes and followed by a comma:

```lua
return {
    "california-gurls.wav",
    "sweet-child-o-mine.wav",
}
```

The names must match the files in the `audios/` folder exactly, including uppercase and lowercase letters. `California-Gurls.wav` and `california-gurls.wav` are treated as different names.

Save the file when you are done.

## Step 4 — Set the display names for your audio files

Open `locale/en/audio-names.cfg` with any text editor. Add one line per file, following this format:

```
filename.wav=Display Name
```

Using the example songs:

```ini
[programmable-speaker-note]
california-gurls.wav=California Gurls
sweet-child-o-mine.wav=Sweet Child O' Mine
```

The left side must match the filename exactly as registered in `F077-sai-index.lua`. The right side is what the player will see inside the game.

Without this step, the game will display the raw internal ID instead of a readable name. Save the file when you are done.

## Step 5 — Set your mod name and version

Open `info.json` with any text editor and fill in your own values:

```json
{
    "name": "my-custom-musics",
    "version": "1.0.0",
    "title": "My Custom Musics",
    "description": "Adds custom music to Factorio.",
    "author": "YourName",
    "factorio_version": "2.0",
    "dependencies": ["base", "simple-audio-importer"]
}
```

- `name` > internal ID. Lowercase letters, numbers, and hyphens only. No spaces.
- `title` > the name shown in Factorio's mod menu.
- `description` > a short description of your mod.
- `author` > your name or username.

**Do not change or remove the `dependencies` line.** Removing it could cause the mod to fail.

Save the file when you are done.

## Step 6 — Package the mod as a `.zip`

Factorio can load mods both in plain directory and `.zip` files (we're using the second one). The format is:

```
mod-name_version.zip
```

Using the example from Step 4, the zip must be named:

```
my-custom-musics_1.0.0.zip
```

The folder inside the zip must be named `my-custom-musics`. The structure must look like this:

```
my-custom-musics_1.0.0.zip
└── my-custom-musics/
    ├── audios/
    │   ├── california-gurls.wav
    │   └── sweet-child-o-mine.wav
    ├── F077-sai-index.lua
    ├── info.json
    └── ...
```

## Step 7 — Place the mod in the correct folder

Copy the `.zip` file into your Factorio `mods` folder:

**Windows**

```
C:\Users\YourUsername\AppData\Roaming\Factorio\mods
```

You can also open File Explorer, click on the address bar, type `%APPDATA%\Factorio\mods`, and press Enter.

**Linux**

```
~/.factorio/mods
```

**macOS**

```
~/Library/Application Support/factorio/mods
```

Finally, from here you can do 2 things: share the `.zip` file with your friends (if you have a private server), or publish it to the **Mod Portal** (so your players can automatically download and keep it updated when joining a server).
