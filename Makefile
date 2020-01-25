help:
	@egrep '^\S|^$$' Makefile


install:
	bundle install --path vendor/bundle

upgrade:
	bundle update


console:
	bundle exec irb


build:
	bundle exec jekyll build

data:
	# Write using local content.
	bundle exec ruby bin/write_demo.rb

	# Write using data returned from API.
	bundle exec ruby bin/fetch_and_write.rb

# Netlify main command.
build-all: build data


# Serve the _site directory. Do not do initial build or build on file changes.
serve:
	bundle exec jekyll serve --skip-initial-build --no-watch

# Local main command.
serve-all: build-all serve
