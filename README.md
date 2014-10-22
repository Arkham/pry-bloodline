# Pry Bloodline

A glorious descendant of a noble lineage of status lines, to be used with Pry.

It turns this:

![Before](images/before.png)

Into this:

![After](images/after.png)

## Themes

It's really easy to build your own theme!

### Freedom

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

### Blood

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

## Configuration

Here are all the fields you can configure:

```ruby
PryBloodline.configure do |c|
  c.name = "pry"
  c.line_color = :light_black
  c.name_color = :green
  c.path_color = :light_blue
  c.separator = "\u00BB"
  c.separator_color = :light_green
  c.name_proc = proc { c.name.colorize(c.name_color) }
  c.line_proc = proc { |obj, level, pry| "[#{pry.input_array.size}]".colorize(c.line_color) }
  c.path_proc = proc { |obj, level, pry| "(#{Pry.view_clip(obj)})".colorize(c.path_color) }
  c.separator_proc = proc { c.separator.colorize(c.separator_color }
end
```

This configuration yields this theme:

![Custom](images/custom.png)

Check the source code for more details on this ;)

## Contributing

1. Fork it ( https://github.com/Arkham/pry-bloodline/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
