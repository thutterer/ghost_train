# how the install command will work

> $ ghost_train new foo

- creates a `foo` folder
- inside is - directly - the "front" engine, so there is a `foo/app` and so on
- also `foo/Gemfile` is ready and requires the current folder (as the "front" engine)
- not sure if that flies, but sounds like a great idea ;)


# Ghost train

> _All aboard!_

Have you ever noticed how short after the excitement of a `rails new` you always have to do the same basic things all over again? User authentication, authorization, administration, database configuration, preparation, migrations and schema. To just name a few.
The moment you create a new Rails app, you pretty much duplicate a few dozens files you had, or wished to have, like this already in all your other Rails apps.

_That's not very DRY, is it?_

Here comes the Ghost train. It's a zero-conf, minimal-maintenance Rails-in-a-box, basically.

_This project including this README is still pre-release, by the way. If something is unclear or not working as described, please open an issue so we can fix that :)_


## Installation

Make sure you have a recent ruby (with bundler) in your PATH:
```
rbenv local 3.0.1
```

Run the install script:
```bash
wget https://github.com/thutterer/.../raw/.../install | bash
```

Congratulations! You just installed a bunch of stuff.


### Features

Ghost train not only installs the latest Rails in your bundle, but comes with these features out of the box:
- [Devise](https://github.com/heartcombo/devise) for user authentication
- [Administrate](https://github.com/thoughtbot/administrate) for user administration
- [Ahoy](https://github.com/ankane/ahoy) and [Blazer](https://github.com/ankane/blazer) for analytics
- PostgreSQL ready to go. Users, analytics, and a single table for all your jsonb `things.

### Concept

Where Rails itself aims for _[Convention over configuration](https://en.wikipedia.org/wiki/Convention_over_configuration)_, Ghost train aims to eliminate all configuration. This means:

- No database migrations. No custom schema. ActiveRecord is ready for devise, ahoy and all your `things`, using jsonb.
- Actually, all files that you would normally find in your application's root folder are packaged away in the ghost_train gem. Out of sight, out of mind. Yes, read-only Rails!
- All you have to do is write an awesome Rails [_engine_](https://guides.rubyonrails.org/engines.html)!
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

### Database

Setup Postgres to work with Rails. Depends on your setup.

### Git

Delete the `.git` folder in your Front engine. Commit those files to your main project (parent folder).
Add and commit all files.

# Run

Remember, `ghost` is your new `rails`!

```bash
$ # source your ENV
$ bundle exec ghost db:create db:migrate
$ bundle exec ghost server
```

## Blazer

For Blazer to work you have to configure a `BLAZER_DATABASE_URL` env var. See https://github.com/ankane/blazer#installation for details.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
