# APT Buildpack Changelog

## 2021-01-15

- Fail the build if `apt-get` or `curl` errors ([#79](https://github.com/heroku/heroku-buildpack-apt/pull/79)).
- Only try to add custom repositories when some are defined in `Aptfile` ([#79](https://github.com/heroku/heroku-buildpack-apt/pull/79)).

## 2019-10-17

- Flush the cache on stack change ([#58](https://github.com/heroku/heroku-buildpack-apt/pull/58)).

## 2019-09-06

- Stop using `force-yes` with newer version of apt-get ([#51](https://github.com/heroku/heroku-buildpack-apt/pull/51)).

## 2019-06-11

- Prevent APT using source lists from `/etc/apt/sources.list.d/` ([#46](https://github.com/heroku/heroku-buildpack-apt/pull/46)).

## 2019-06-10

- Add support for comments in `Aptfile` ([#24](https://github.com/heroku/heroku-buildpack-apt/pull/24)).

## 2017-09-13

- Add support for custom repositories ([#18](https://github.com/heroku/heroku-buildpack-apt/pull/18)).

## 2016 and earlier

See the [Git log](https://github.com/heroku/heroku-buildpack-apt/commits/40883f0cb8e8ddb2876ca8be5d25ade4ff9617b1).
