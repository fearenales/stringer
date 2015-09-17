# Stringer

[![Build Status](https://img.shields.io/travis/swanson/stringer.svg?style=flat)](https://travis-ci.org/swanson/stringer)
[![Code Climate](https://img.shields.io/codeclimate/github/swanson/stringer.svg?style=flat)](https://codeclimate.com/github/swanson/stringer)
[![Coverage Status](https://img.shields.io/coveralls/swanson/stringer.svg?style=flat)](https://coveralls.io/r/swanson/stringer)

### A self-hosted, anti-social RSS reader.

Stringer has no external dependencies, no social recommendations/sharing, and no fancy machine learning algorithms.

But it does have keyboard shortcuts and was made with love!

![](screenshots/instructions.png)
![](screenshots/stories.png)
![](screenshots/feed.png)

## Installation

Stringer is a Ruby (2.0.0+) app based on Sinatra, ActiveRecord, PostgreSQL, Backbone.js and DelayedJob.

## Running locally

Click the button bellow to quickly and safely install this project on your local machine.

[![Run project](https://s3-sa-east-1.amazonaws.com/assets.azk.io/run-project.png)](http://run.azk.io/start/?repo=azk-button/stringer&ref=azkfile)

The `Run Project` button employs `azk`, a lightweight open source orchestration tool that will automatically isolate and configure the application's environment for you.

Learn more about `azk` [here](http://azk.io).

## Deploying to DigitalOcean

After you run this project locally using [`Run Project` button](#running-locally), deploying to [DigitalOcean](http://digitalocean.com/) is very simple.

First, be sure you have SSH keys configured in your machine. If you don't have it yet (or if you aren't sure about it), just follow steps 1 and 2 of [this tutorial](https://help.github.com/articles/generating-ssh-keys/).

Next, put your [personal access token](https://cloud.digitalocean.com/settings/applications) into a `.env` file:

```bash
$ cd path/to/the/project
$ echo "DEPLOY_API_TOKEN=<YOUR-PERSONAL-ACCESS-TOKEN>" >> .env
```

Then, just run the following:

```bash
$ azk shell deploy
```

The `Run Project` button employs `azk`, a lightweight open source orchestration tool that will automatically isolate and configure the application's environment for you.

Find instructions for further resources (mostly customizations) to deploy to DigitalOcean using `azk` [here](http://docs.azk.io/en/deploy/README.html).

## Deploying to Heroku

[![Deploy to Heroku](https://cdn.herokuapp.com/deploy/button.svg)](https://heroku.com/deploy)

Stringer will run just fine on the Heroku free plan.

Instructions are provided for deploying to [Heroku manually](/docs/Heroku.md), to any Ruby 
compatible [Linux-based VPS](/docs/VPS.md), and to [OpenShift](/docs/OpenShift.md).

## Niceties

### Keyboard Shortcuts

You can access the keyboard shortcuts when using the app by hitting `?`.

![](screenshots/keyboard_shortcuts.png)

### Using you own domain with Heroku

You can run Stringer at `http://reader.yourdomain.com` using a CNAME.

If you are on Heroku:

```
heroku domains:add reader.yourdomain.com
```

Go to your registrar and add a CNAME:
```
Record: CNAME
Name: reader
Target: your-heroku-instance.herokuapp.com
```

Wait a few minutes for changes to propagate.

### Fever API

Stringer implements a clone of [Fever's API](http://www.feedafever.com/api) so it can be used with any mobile client that supports Fever.

![image](https://f.cloud.github.com/assets/56947/546236/68456536-c288-11e2-834b-9043dc75a087.png)

Use the following settings:

```
Server: {path-to-stringer}/fever (e.g. http://reader.example.com/fever)

Email: stringer (case-sensitive)
Password: {your-stringer-password}
```

If you have previously setup Stringer, you will need to migrate your database and run `rake change_password` for the API key to be setup properly.

### Translations

Stringer has been translated to [several other languages](config/locales). Your language can be set with the `LOCALE` environment variable.

To set your locale on Heroku, run `heroku config:set LOCALE=en`.

If you would like to translate Stringer to your preferred language, please use [LocaleApp](http://www.localeapp.com/projects/4637).

### Clean up old read stories on Heroku

If you are on the Heroku free plan, there is a 10k row limit so you will
eventually run out of space.

You can clean up old stories by running: `rake cleanup_old_stories`

By default, this removes read stories that are more than 30 days old (that
are not starred). You can either run this manually or add it as a scheduled
task.

## Acknowledgements

Most of the heavy-lifting is done by [`feedjira`](https://github.com/feedjira/feedjira) and [`feedbag`](https://github.com/dwillis/feedbag).

General sexiness courtesy of [`Twitter Bootstrap`](http://twitter.github.io/bootstrap/) and [`Flat UI`](http://designmodo.github.io/Flat-UI/).

## Contact

Matt Swanson, [mdswanson.com](http://mdswanson.com), [@_swanson](http://twitter.com/_swanson)

Victor Koronen, [victor.koronen.se](http://victor.koronen.se/), [@victorkoronen](https://twitter.com/victorkoronen)
