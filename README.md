# heroku-buildpack-apt [![Build Status](https://travis-ci.org/heroku/heroku-buildpack-apt.svg?branch=master)](https://travis-ci.org/heroku/heroku-buildpack-apt)

Add support for apt-based dependencies during both compile and runtime.

Added ability to also specify custom repositories through **:repo:** in `Aptfile` (see example below).

## Usage

This buildpack is not meant to be used on its own, and instead should be in used in combination with Heroku's [multiple buildpack support](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app).

Include a list of apt package names to be installed in a file named `Aptfile`

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
    libpq-dev
    # or include links to specific .deb files
    http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.1/wkhtmltox-0.12.1_linux-precise-amd64.deb
    # or add custom apt repos
    :repo:deb http://cz.archive.ubuntu.com/ubuntu artful main universe

#### Gemfile

    source "https://rubygems.org"
    gem "pg"

### Check out the PG library version

    $ heroku run bash -a apt-pg-test
    ~ $ irb
	irb(main):001:0> require "pg"
	=> true
	irb(main):002:0> PG::version_string
	=> "PG 0.15.1"

## License

MIT
