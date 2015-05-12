[github]: https://github.com/neopoly/redmine-per_user_status
[doc]: http://rubydoc.info/github/neopoly/redmine-per_user_status/master/file/README.md
[gem]: https://rubygems.org/gems/redmine-per_user_status
[gem-badge]: https://img.shields.io/gem/v/redmine-per_user_status.svg
[inchpages]: https://inch-ci.org/github/neopoly/redmine-per_user_status
[inchpages-badge]: https://inch-ci.org/github/neopoly/redmine-per_user_status.svg?branch=master&style=flat

# redmine-per_user_status

[![Gem Version][gem-badge]][gem]
[![Inline docs][inchpages-badge]][inchpages]

[Gem][gem] |
[Source][github] |
[Documentation][doc]


Allows users to set a custom status which will be displayed next to their names when choosing as assignee.

## Installation

Ensure you have a `Gemfile.local` file in your Redmine installation. Add to your `Gemfile.local`:

```ruby
gem "redmine-per_user_status"
```

And then execute:

```
$ bundle
```

This plugin ships with a migration. To update the database run:

```
$ rake redmine:plugins:migrate
```

Restart the Redmine application

## Usage

1. Install the gem and require the gem
2. Switch to "My account" and set a custom status (Screenshot 1)
3. Or change a user's status using the administration panel
4. The custom user status will be displayed next to the full names

**Screenshot: Status next to assignee**

![Screenshot Issue](https://neopoly.github.io/redmine-per_user_status/images/screenshot1.png)

**Screenshot: My account**

![Screenshot MyAccount](https://neopoly.github.io/redmine-per_user_status/images/screenshot2.png)

**Screenshot: Administration**

![Screenshot Administration](https://neopoly.github.io/redmine-per_user_status/images/screenshot3.png)

## Testing

No automatic tests, sir! But this Redmine plugin is used in production.

## TODO

* Find a way to test this Redmine plugin

## Contributing

1. Fork it ( https://github.com/neopoly/redmine-per_user_status/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
