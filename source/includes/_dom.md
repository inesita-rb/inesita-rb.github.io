# DOM DSL

There are few things about writing components with DSL worth to mention:

### Data attributes

Sometimes you want to write some data into DOM.
You can use `data` attribute for that.

To archive that check an example.

```ruby
class Home
  include Inesita::Component

  def render
    div.jubmotron do
      ul do
        li data: { id: "1", title: "Title #1" } do
          "Title #1"
        end

        li data: { id: "2", title: "Title #1" } do
          "Title #2"
        end

        li data: { id: "3", title: "Title #1" } do
           "Title #3"
        end
      end
    end
  end
end
```

### Hooks

If you want to manipulate a DOM element after or before its mounted you can use hooks.

There are two of them.
'hook' is executes just after node is attached to DOM, and
`unhook` is executes just before node is removed from DOM.

Here is an example.

```ruby
class Home
  include Inesita::Component

  def after_mount(node)
    # do something with node after mount to dom
    puts "I'm mounted #{node}"
  end

  def before_remove(node)
    # do something with node before remove
    puts "I'm removed #{node}"
  end

  def render
    div.jubmotron hook: hook(:after_mount), unhook: unhook(:before_remove) do
      "Hello"
    end
  end
end
```
