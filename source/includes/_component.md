# Component

As you already know `component` is a main part. We have a main `Application` component,
but also other components. For example `Home` component,

```ruby
class Home
  include Inesita::Component

  def render
    div.jubmotron class: 'text-center' do
      img src: '/static/inesita-rb.png'
      h1 do
        text "Hello I'm Inesita"
      end
      component Counter, props: {header: 'This is a sample counter'}
    end
  end
end
```

This is simple `component` that render `bootstrap` jumbotron with few headers.
We're using a nice and fancy DSL to render html. No html files needed. Only ruby.

`Home` is a very simple component that render only html.

As you can see we can pass `class` to define classes of element, but also `id`, `onclick` and other element attributes.
Notice that, you can use shortcut for element classes like `div.jumbotron`.
In this case `div` will include `jumbotron` class and `text-center`.
You can also do `div.example!` bang means that this is `id` instead of `class`.

This component also render `Counter` component in out tree.
We can pass `props` to child components like this.

Now take a look at `Counter` component.

```ruby
class Counter
  include Inesita::Component

  def inc
    store.increase
    render!
  end

  def dec
    store.decrease
    render!
  end

  def render
    h4 do
      text props[:header]
    end
    div class: 'input-group' do
      span class: 'input-group-btn' do
        button class: 'btn btn-default', onclick: method(:dec) do
          text '-'
        end
      end
      input type: "text", class: "form-control", value: store.counter, disabled: true
      span class: 'input-group-btn' do
        button class: 'btn btn-default', onclick: -> { inc } do
          text '+'
        end
      end
    end
  end
end
```

Wow, there is a lot new things. Let start with `render` method.
In `h4` we render a props - things that was passed from parent component.

Next one is a button. In this case `dec` method descrives `onclick` behavior.
This method invokes methods from store, and render out component tree.

`render!` method rerender all component tree. No worries, there is `virtual-dom` that will only render a differece to DOM. It's fast.

Same thing happend with `inc` method and `+` button, but we're using a `function` notation, that invokes `dec` method.

In the middle there are input that display counter value from store.

Of course you can store a component state in instance variables, it depend on you.

Now we need to look at `injections`.
