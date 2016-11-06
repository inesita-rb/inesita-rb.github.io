# Component

Component is a crucial part.
Lets create a simple component named `Clock`.
Remember to add `opal-browser` gem to your `Gemfile`, and require it in your component.

```ruby
class Clock
  include Inesita::Component

  def initialize
    @time = Time.now
  end

  def render
    div.clock do
      text @time.strftime('%r')
    end
  end
end
```

Now we should mount it to DOM element `<div id="clock"></div>`:

```ruby
$document.ready do
  Clock.mount_to($document['clock'])
end
```

It works, but what's a clock that won't refresh? Let's fix it:

```ruby
class Clock
  include Inesita::Component

  def initialize
    @time = Time.now
    every 1 do
      @time = Time.now
      render!
    end
  end

  def render
    div.clock do
      text @time.strftime('%r')
    end
  end
end
```

Beautiful, clock works like a charm.
We have added a simple block that executes once a second. In this case we reset the `@time` variable and update the component with `render!`
Simple, isn't it?

Components can be nested. For example, to add another component that wraps `Clock` in a `code` tag:

```ruby
class CodeClock
  include Inesita::Component

  def render
    code do
      component Clock
    end
  end
end
```

Mount it.

```ruby
$document.ready do
  CodeClock.mount_to($document['clock'])
end
```

When components are nested, we can pass props to child components like this:

```ruby
class CodeClock
  include Inesita::Component

  def render
    code do
      component Clock, props: { label: 'This is clock' }
    end
  end
end
```

And use it like this:

```ruby
class Clock
  include Inesita::Component

  def initialize
    @time = Time.now
    every 1 do
      @time = Time.now
      render!
    end
  end

  def render
    div.clock do
      span do
        text props[:label]
      end
      text @time.strftime('%r')
    end
  end
end
```


Nice. Now we are ready to move forward and describe other parts.
