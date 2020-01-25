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
	# Using bundle for ruby was recommended for use on Netlify to avoid an error.
	# Also, ruby will run here in the context of the installed applications, unlike running ruby
	# directly.
	bundle exec ruby bin/write_demo.rb

build-all: build data

# Serve the _site directory. Do not do initial build or build on file changes.
serve:
	bundle exec jekyll serve --skip-initial-build --no-watch

serve-all: build-all serve
