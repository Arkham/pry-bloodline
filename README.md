# Pry Bloodline

A glorious descendant of a noble lineage of status lines, to be used with Pry.

It turns this:

![Before](images/before.png)

Into this:

![After](images/after.png)

## Themes

It's really easy to build your own theme!

#### Freedom

```ruby
PryBloodline.configure do |c|
  c.line_color = :white
  c.name_color = :blue
  c.path_color = :red
  c.separator = "★"
  c.separator_color = :white
end
```

![Freedom](images/freedom.png)

#### Blood

```ruby
PryBloodline.configure do |c|
  c.line_color = :light_white
  c.name_color = :light_red
  c.path_color = :red
  c.separator_color = :light_black
end
```

![Blood](images/blood.png)

### Thor

```ruby
PryBloodline.configure do |c|
  c.line_color = :red
  c.name_color = :white
  c.path_color = :blue
  c.separator = "⚡"
end
```

![Thor](images/thor.png)

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
