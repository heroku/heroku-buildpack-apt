# heroku-buildpack-apt

Add support for apt-based dependencies during both compile and runtime.

## Usage

This buildpack works best with [heroku-buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi) so that it can be used with your app's existing buildpacks.

Include a list of apt package names to be installed in a file named `Aptfile`

## Example

#### .buildpacks

    https://github.com/ddollar/heroku-buildpack-apt
    https://github.com/heroku/heroku-buildpack-ruby

#### Aptfile


    libpq-dev
    

#### Gemfile

    source "https://rubygems.org"
    gem "pg"
    
### Compile with [Anvil](https://github.com/ddollar/anvil-cli)

    $ heroku plugins:install https://github.com/ddollar/heroku-build
    
    $ heroku create apt-pg-test
    
    $ heroku build . -b ddollar/multi -r 
	Checking for app files to sync... done, 2 files needed
	Uploading: 100.0%
	Launching build process... done
	Preparing app for compilation... done
	Fetching buildpack... done
	Detecting buildpack... done, Multipack
	Fetching cache... done
	Compiling app...
	=====> Downloading Buildpack: https://github.com/ddollar/heroku-buildpack-apt
	=====> Detected Framework: Apt
	  Updating apt caches
	  ...
	  Installing libpq-dev_8.4.17-0ubuntu10.04_amd64.deb
	  Installing libpq5_8.4.17-0ubuntu10.04_amd64.deb
	  Writing profile script
	=====> Downloading Buildpack: https://github.com/heroku/heroku-buildpack-ruby
	=====> Detected Framework: Ruby
	  Installing dependencies using Bundler version 1.3.2
	  ...
	Putting cache... done
	Creating slug... done
	Uploading slug... done
	Success, slug is https://api.anvilworks.org/slugs/00000000-0000-0000-0000-0000000000.tgz
	
### Check out the PG library version

    $ heroku run bash -a apt-pg-test
    ~ $ irb
	irb(main):001:0> require "pg"
	=> true
	irb(main):002:0> PG::version_string
	=> "PG 0.15.1"
	
## License

MIT