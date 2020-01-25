# Static Site API Request Demo
> Demo static site which serves data fetched from an API at build time

[![Netlify Status](https://api.netlify.com/api/v1/badges/399e649a-072b-4747-9dc2-c9e5cf0e071e/deploy-status)](https://app.netlify.com/sites/static-site-api-request-demo/deploys)

The API request is done during a remote build or locally. The data is written to a file in the served directory.

This works on Netlify as it allows custom build commands. This will not work on Github Pages though.

Ruby requests are based on tutorials:
- https://lostisland.github.io/faraday/usage/
- http://zetcode.com/web/rubyfaraday/

## Deploy to Netlify

1. Login to [app.netlify.com](https://app.netlify.com)
1. Create a new site.
1. Point it at this repo on Github.
1. Optionally rename the site.
1. Wait for the site to build.
1. View the URL.

## Install

Setup this project locally - instructions are for Unix-like (_Linux_ or _macOS_) systems.

### System dependencies

Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems) using a command appropriate for your OS.

Install the [Jekyll](https://jekyllrb.com/) and [Bundler](https://bundler.io/) globally using the command below.

```bash
$ gem install jekyll bundler
```

_Jekyll_ is used to build static sites. _Bundler_ is used to manage Ruby gem dependencies in an isolated directory, to preserve your global gems.

### Project dependencies.

Install gems.

```bash
$ make install
```

in future, run this command to upgrade to the latest gems.

```bash
$ make upgrade
```

When you upgrade, the [Gemfile.lock](/Gemfile.lock) file will be updated, if there are any changes. You can commit this to your own repo. This file is optional for _Github Pages_ but required if you want to deploy to _Netlify_.


## Run

```sh
$ make serve-all
```

That will command will
1. Clear the public `_site` directory (or create it if it does not exist).
2. Build the Jekyll site.
3. Fetch API data and store create new data files in the public directory.
4. Start a web serve in the public directory.


Open in the browser:
- http://localhost:4000/


If you make any changes to the project, you need to stop and start the server.


## Development

See the [Makefile](/Makefile) commands:

```sh
$ make help
```

Note that for commands that start as `bundle exec ruby`, this was recommended to avoid errors on Netlify when running ruby. Also, when running locally, ruby can only local gems in the vendor directory if this command is used.
