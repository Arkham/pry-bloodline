# Pry Bloodline

A glorious descendant of a noble lineage of status lines, to be used with Pry.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'pry-bloodline'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pry-bloodline

## Usage

Just run:

    $ rails console

Or if you want to use it as your default pry shell, create a `.pryrc` file in your home folder:

```ruby
require 'pry-bloodline'

PryBloodline.setup!
```

Then:

    $ pry

## Contributing

1. Fork it ( https://github.com/Arkham/pry-bloodline/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
