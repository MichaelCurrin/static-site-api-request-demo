# Static Site API Request Demo
> Demo static site which serves data fetched from an API at build time

[![Netlify Status](https://api.netlify.com/api/v1/badges/399e649a-072b-4747-9dc2-c9e5cf0e071e/deploy-status)](https://app.netlify.com/sites/static-site-api-request-demo/deploys)

The API request is done during a remote build or locally. The data is written to a file in the served directory.

This works on Netlify as it allows custom build commands. This will not work on Github Pages though.

Ruby requests are based on tutorials:
- https://lostisland.github.io/faraday/usage/
- http://zetcode.com/web/rubyfaraday/

## Deploy to Netlify

Login to [app.netlify.com](https://app.netlify.com)

Create a new site.

Point it at this repo on Github.

Optionally rename the site.

Wait for the site to build.

View the URL.

## Install

Clone the repo.

```sh
$ make install
```

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
