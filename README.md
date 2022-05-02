# colcon-abbr.fish

colcon abbreviations for fish-shell

## Installation

### Using fisher (recommended)

```sh
fisher install kenji-miyake/colcon-abbr.fish
```

### Using local-install script (for development)

```sh
git clone git@github.com:kenji-miyake/colcon-abbr.fish.git
cd colcon-abbr.fish
./install
```

## Usage

This plugin registers fish abbreviations related to colcon.

The naming rule is:

- starting with `cb`(colcon buiild)
- succeeding `CMAKE_BUILD_TYPE`
  - empty, `d`(Debug), `r`(Release), and `rd`(RelWithDebInfo)
- succeeding package-option
  - empty, `p`(packages-up-to) or `ps`(packages-select)

For example,

```sh
# Input
$ cbrp<Space>

# Expanded Result
$ colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --packages-up-to
```

## Tips

### Using symlink

If you'd like to use symlink-install, please define `$COLCON_ABBR_USE_SYMLINK` is `true`.  
By default, this plugin set this variable as `true`.

```sh
set -U COLCON_ABBR_USE_SYMLINK true
```

To disable,

```sh
set -e COLCON_ABBR_USE_SYMLINK false
```

### Adding options

If you'd like to add options, please define `$COLCON_ABBR_ADDITIONAL_OPTIONS`.

```sh
set -U COLCON_ABBR_ADDITIONAL_OPTIONS "--catkin-skip-building-tests"
```

### Adding other cmake-args

If you'd like to add other cmake-args, please define `$COLCON_ABBR_CMAKE_ARGS`.

```sh
set -U COLCON_ABBR_CMAKE_ARGS '-DCMAKE_CXX_FLAGS="-Wall"'
```

Then, the extended result will be the following.

```sh
# Input
$ cbrp<Space>

# Expanded Result
$ colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall" --packages-up-to
```

To revert to default,

```sh
set -e COLCON_ABBR_CMAKE_ARGS
```

### Unregister abbreviations

If you'd like to unregister all abbreviations, please use `colcon_abbr_unregister`.  
As it just deletes all abbreviations starting from `cb`, you can manually remove registered abbreviations if you mind that deleting unrelated ones.

```sh
$ colcon_abbr_unregister
[colcon-abbr] unregister cb
[colcon-abbr] unregister cbd
[colcon-abbr] unregister cbdp
[colcon-abbr] unregister cbdps
[colcon-abbr] unregister cbp
[colcon-abbr] unregister cbps
[colcon-abbr] unregister cbr
[colcon-abbr] unregister cbrd
[colcon-abbr] unregister cbrdp
[colcon-abbr] unregister cbrdps
[colcon-abbr] unregister cbrp
[colcon-abbr] unregister cbrps
$ fisher add kenji-miyake/colcon-abbr.fish
```

### Using completions for colcon

Since `colcon` supports `argcomplete`, this plugin enables it when it's installed.
If you get the message "argcomplete was not found", please install `argcomplete` following [the official manual](https://github.com/kislyuk/argcomplete).

If you get errors when using completions, you can probably avoid it by `set -U _ARC_DEBUG false`.
