# Injections

`Store` is simply a wrapper for your data. You decide how to store the data, and how to fetch it.

```ruby
class Store
  include Inesita::Store

  def initialize
    @store = {}
  end

  def set_value(value)
    @store[:value] = value
  end

  def get_value
    @store[:value]
  end
end
```

This is the simplest store, that stores data within a `Hash`. You can use it with your components like this:

```ruby
class Input
  include Inesita::Component

  def change(e)
    store.set_value(e.target.value)
    render!
  end

  def render
    input type: "text", class: "form-control", value: store.get_value, onchange: method(:change)
  end
end
```
