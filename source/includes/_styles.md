# Styles

The default stylesheet is `app/stylesheet.css.sass`. It uses [Sass](http://sass-lang.com). You can create you own stylesheets and `@import` them in this file.
For example, if we want to include [Bootstrap](http://getbootstrap.com):

```sass
@import "bootstrap"
```

External styles can be included in your Gemfile using the `rails-assets.org` service.

```
source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end
```
