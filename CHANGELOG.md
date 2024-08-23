# APT Buildpack Changelog

## Unreleased

## 2024-06-24

- The cache is now correctly invalidated if the stack version of an existing cache cannot be determined. ([#133](https://github.com/heroku/heroku-buildpack-apt/pull/133))
- When the cache is invalidated, all APT-related files are now removed, rather than only some of them. In particular, this means old APT package index files are cleaned up. ([#133](https://github.com/heroku/heroku-buildpack-apt/pull/133))
- Exclude test/development files from the buildpack archive published to the buildpack registry. ([#135](https://github.com/heroku/heroku-buildpack-apt/pull/135))

## 2024-03-28

- Warn when Aptfile contains no packages ([#126](https://github.com/heroku/heroku-buildpack-apt/pull/126))
- Support sources parts directory for Heroku-24 compatibility ([#119](https://github.com/heroku/heroku-buildpack-apt/pull/119))

## 2024-03-14

- Shell hardening ([#115](https://github.com/heroku/heroku-buildpack-apt/pull/115))
- Handle multi-package lines when capturing buildpack metadata ([#112](https://github.com/heroku/heroku-buildpack-apt/pull/112))

## 2024-03-01

- Add `bin/report` script to capture buildpack metadata ([#110](https://github.com/heroku/heroku-buildpack-apt/pull/110))

## 2021-03-10

- Output a helpful error message when no `Aptfile` is found ([#87](https://github.com/heroku/heroku-buildpack-apt/pull/87)).

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
