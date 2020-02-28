# SaferYAML

SaferYAML is a simple way to read and load YAML from a file.
It makes some opinionated assumptions, each of which you can override.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'safer_yaml'
```

And then execute from the command line:

```sh
bundle
```

Or install it yourself as:

```sh
gem install safer_yaml
```

## Usage

The simplest way to use SaferYAML is:

```ruby
SaferYAML.for('path/to/file.yml')
```

SaferYAML makes a few opinionated assumptions.
You can override any of these with your own configuration.

`SaferYAML.for` always returns a `Hash`.

### Required argument

**`path`**
`SaferYAML.for` requires a `path` argument as a `String`.

Example:

```ruby
SaferYAML.for('config/database.yml')
```

### Optional arguments

**`allow_aliases`** (defaults to `true`)

By default, SaferYAML assumes that when you're loading a YAML file, you control and trust that YAML file and want to allow following and expanding any YAML aliases in the file.

If you don't want to allow aliases in the YAML, you can disable them by passing `allow_aliases: false`.

Example:

```ruby
SaferYAML.for('config/database.yml', allow_aliases: false)
```

**`allow_erb`** (defaults to `true`)

By default, SaferYAML assumes that when you're loading a YAML file, you control and trust that YAML file and want to allow embedding ERB in the YAML and evaluating it.

If you don't want to evaluate ERB in the YAML, you can disable it by passing `allow_erb: false`.

Example:

```ruby
SaferYAML.for('config/database.yml', allow_erb: false)
```

**`relative_to_rails_root`** (defaults to `true`)

By default, SaferYAML assumes that when you're loading a YAML file that you're doing this from within a Rails app. SaferYAML then prefixes the `path` that you pass into `SaferYAML.for` with `Rails.root`. So, your `path` argument only needs to be a string of the path starting at the root of your Rails app.

If you are running SaferYAML outside of a Rails app or if you don't want to load the YAML relative to the Rails app root, you can disable the path prefix by passing `relative_to_rails_root: false`.

Example:

```ruby
SaferYAML.for('../../../config/database.yml', relative_to_rails_root: false)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hoverinc/safer_yaml. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SaferYAML project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hoverinc/safer_yaml/blob/master/CODE_OF_CONDUCT.md).
