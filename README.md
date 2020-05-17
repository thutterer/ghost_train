# Ghost train

> _All aboard!_

Have you ever noticed how short after the exitement of a `rails new` you always have to do the same basic things all over again? User authentication, authorization, administration, database configuration, preparation, migrations and schema. To just name a few.
The moment you create a new Rails app, you pretty much duplicate a few dozens files you had, or wished to have, like this already in all your other Rails apps.

_That's not very DRY, is it?_

Here comes the Ghost train. It's a zero-conf, minimal-maintenance Rails in a box, basically.

_This project including this README is still pre-release, by the way. If something is unclear or not working as described, please open an issue so we can fix that :)_


## Installation

In an otherwise empty folder, create this `Gemfile`:

```ruby
source 'https://rubygems.org'

gem 'ghost_train'
```

And then execute:
```bash
$ bundle
```

Congratulations! You just installed a bunch of stuff.


### Features

Ghost train not only installs the latest Rails in your bundle, but comes with these features out of the box:
- [Devise](https://github.com/heartcombo/devise) for user authentication
- [Administrate](https://github.com/thoughtbot/administrate) for user administration
- _Soon:_ Ahoy for analytic data
- ActiveRecord configured to use PostgreSQL, ready with migrations and schema.
- MongoDB for all your application data.

### Concept

Where Rails itself aims for _[Convention over configuration](https://en.wikipedia.org/wiki/Convention_over_configuration)_, Ghost train aims to eliminate all configuration. This means:

- No database migrations. No custom schema. ActiveRecord is only used to manage some core functionality of your application.
- Actually, all files that you would normally find in your application's root folder are packaged away in the ghost_train gem. Out of sight, out of mind. Yes, read-only Rails!
- All you have to do is write an awesome Rails _engine_!
- As it always was, you can add additional gems into your `Gemfile` and have a custom `routes.rb`.
- Ready to deploy!

#### How is it different from any Rails starter template?

There are some nice templates available to take a new Rails application off the ground faster. But those are all just one-shot ruby scripts that set up a bunch of stuff, and you still end up with a few dozens files, even some more now, and again have to version and maintain them.

Ghost train on the other hand doesn't create any files for you. It keeps them away from you. All of Rails' config is out of your sight, and hands.


## First steps

#### TODO: These sections are still missing, sorry:

- local setup for dev/test
- production deployment (heroku-ready)
- how to mount custom engine and others

```bash
$ rail s
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
