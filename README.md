# heroku-buildpack-apt [![Build Status](https://travis-ci.org/heroku/heroku-buildpack-apt.svg?branch=master)](https://travis-ci.org/heroku/heroku-buildpack-apt)

Add support for apt-based dependencies during both compile and runtime.

Added ability to also specify custom repositories through **:repo:** in `Aptfile` (see example below).

## Usage

This buildpack is not meant to be used on its own, and instead should be in used in combination with Heroku's [multiple buildpack support](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app).

Include a list of apt package names to be installed in a file named `Aptfile`.

To find out what packages are available, see:
<https://packages.ubuntu.com>

See the [Heroku Stacks](https://devcenter.heroku.com/articles/stack) documention for which
Ubuntu LTS version is used by each Heroku stack.

## Example

#### Command-line

To use the latest stable version:

```
heroku buildpacks:add --index 1 heroku-community/apt
```

To use the edge version (i.e. the code in this repo):

```
heroku buildpacks:add --index 1 https://github.com/heroku/heroku-buildpack-apt
```

#### Aptfile

    # you can list packages
    libexample-dev
    
    # or include links to specific .deb files
    https://downloads.example.com/example.deb
    
    # or add custom apt repos (only required if using packages outside of the standard Ubuntu APT repositories)
    :repo:deb https://apt.example.com/ example-distro main

## License

MIT
