# Injections

Injections are simply other classes that are included in our component tree.
In our example we have `Store` and `Router` injections.

Take a look at our `Store`.

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

This is an `injection` example. We are including `Inesita::Injection` in order to be able to inject this class into the root component.

In this example, we're storing counter value.

The `init` method initializes our store. At the beginning we're setting the counter value to 0.

The `increase` method increments current counter value by 1

The `decrease` method decrements current counter value by 1

There is also `attr_accessor :counter` so we can access that value with `store.counter`.

Simple! Right?

You can inject other stores, but also things like dispatchers depending on the architecture you want to obtain.
