# Sprockets configuration

You can use any template engine. If you need use for example `slim` you need to do two things.

Add `gem 'slim'` into Gemfile

And tell sprockets to use it.
To make it work just add/edit `.sprockets.rb` file.
For `slim` template engine it should look like this:

```ruby
# setup sprockets

sprockets.register_engine(
  '.slim',
  Slim::Template,
  silence_deprecation: true
)
```
