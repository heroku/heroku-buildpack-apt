test: heroku-24-build heroku-22-build heroku-20-build

shellcheck:
	@shellcheck -x bin/compile bin/detect bin/release bin/report

heroku-24-build:
	@echo "Running tests in docker (heroku-24-build)..."
	@docker run --user root -v $(shell pwd):/buildpack:ro --rm -it -e "STACK=heroku-24" heroku/heroku:24-build bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; test/run;'
	@echo ""

heroku-22-build:
	@echo "Running tests in docker (heroku-22-build)..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -it -e "STACK=heroku-22" heroku/heroku:22-build bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; test/run;'
	@echo ""

heroku-20-build:
	@echo "Running tests in docker (heroku-20-build)..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -it -e "STACK=heroku-20" heroku/heroku:20-build bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; test/run;'
	@echo ""
