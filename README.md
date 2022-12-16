# APT buildpack

Add support for apt-based dependencies during both compile and runtime.

Added ability to also specify custom repositories through **:repo:** in `Aptfile` (see example below).

## Usage

This buildpack is not meant to be used on its own, and instead should be in used in combination with Scalingo's [multiple buildpack support](https://doc.scalingo.com/buildpacks/multi).

Include a list of apt package names to be installed in a file named `Aptfile`.

To find out what packages are available, see:
<https://packages.ubuntu.com>

See the [Scalingo stacks](https://doc.scalingo.com/platform/internals/stacks/stacks) documentation for which Ubuntu LTS version is used by each stack.

#### Setup

Configure your app with multi buildpacks:

```
scalingo env-set BUILDPACK_URL=https://github.com/Scalingo/multi-buildpack
```

Example of `.buildpacks` file:

```
https://github.com/Scalingo/apt-buildpack
https://github.com/Scalingo/ruby-buildpack
```

Note that the order of the buildpacks in the `.buildpacks` file matters.

## Example

#### Aptfile

    # you can list packages
    libpq-dev

    # or include links to specific .deb files
    http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.1/wkhtmltox-0.12.1_linux-precise-amd64.deb

    # or add custom apt repos (only required if using packages outside of the standard Ubuntu APT repositories)
    :repo:deb http://cz.archive.ubuntu.com/ubuntu artful main universe

#### Gemfile

    source "https://rubygems.org"
    gem "pg"

### Check out the PG library version

    $ scalingo run bash -a apt-pg-test
    ~ $ irb
	irb(main):001:0> require "pg"
	=> true
	irb(main):002:0> PG::version_string
	=> "PG 0.15.1"

## License

MIT
