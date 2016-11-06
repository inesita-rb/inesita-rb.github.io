# Injections

Injections are simple other class that are included in our component tree.
In our example we have `Store` and `Router` injection.

Take a look at our `Store`

```ruby
class Store
  include Inesita::Injection

  attr_accessor :counter

  def init
    @counter = 0
  end

  def increase
    @counter += 1
  end

  def decrease
    @counter -= 1
  end
end
```

This is an `injection` example. We including `Inesita::Injection` so we will able to inject this class to root component.

In this example, we're storing counter value.

`init` method initializes our store. At the beginning we're setting counter value to 0.

`increase` method increasing current counter value by 1

`decrease` method decreasing current counter value by 1

There is also `attr_accessor :counter` so we can access that value with `store.counter`.

Simple! Right?

You can inject other stores, but also things like dispatchers depending on architecture you want to obtain.
