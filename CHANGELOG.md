# Changelog

## To Be Released

* Add support for comments in `Aptfile` ([#24](https://github.com/heroku/heroku-buildpack-apt/pull/24)).
* Prevent APT using source lists from `/etc/apt/sources.list.d/` ([#46](https://github.com/heroku/heroku-buildpack-apt/pull/46)).
* Stop using `force-yes` with newer version of apt-get ([#51](https://github.com/heroku/heroku-buildpack-apt/pull/51)).
* Flush the cache on stack change ([#58](https://github.com/heroku/heroku-buildpack-apt/pull/58)).
* Fail the build if `apt-get` or `curl` errors ([#79](https://github.com/heroku/heroku-buildpack-apt/pull/79)).
* Only try to add custom repositories when some are defined in `Aptfile` ([#79](https://github.com/heroku/heroku-buildpack-apt/pull/79)).

## Version 1.1

* Add `$HOME/.apt/usr/sbin` into application PATH (`profile.d` script)
* Add `APT_FILE_MANIFEST` environment variable to use another file than `Aptfile` from build directory root

## Version 1.0

Initial Version
