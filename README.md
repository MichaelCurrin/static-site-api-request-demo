# Static Site API Request Demo
> Demo static site which serves data fetched from an API at build time

[![Netlify Status](https://api.netlify.com/api/v1/badges/399e649a-072b-4747-9dc2-c9e5cf0e071e/deploy-status)](https://app.netlify.com/sites/static-site-api-request-demo/deploys)

The API request is done during a remote build or locally. The data is written to a file in the served directory.

This works on Netlify as it allows custom build commands. This will not work on Github Pages though.

Ruby requests are based on tutorials:
- https://lostisland.github.io/faraday/usage/
- http://zetcode.com/web/rubyfaraday/
