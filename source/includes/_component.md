# Component

As you already know, `component` is at the core of Inesita. We have seen the main `Application` component,
now let's take a look at the `Home` component.

```ruby
class Home
  include Inesita::Component

  def render
    div.jubmotron.text_center do
      img src: '/static/inesita-rb.png'
      h1 do
        text "Hello I'm Inesita"
      end
      component Counter, props: {header: 'This is a sample counter'}
    end
  end
end
```

This is simple `component` that renders `bootstrap` jumbotron with a few headers.
We're using a nice and simple DSL to render HTML. No HTML files here, only Ruby.

So, `Home` is a very simple component that only renders HTML.

As you can see, we can pass `class` to define classes of elements, but also `id`, `onclick`, and other element attributes.
Notice that you can use a shortcut for element classes like `div.jumbotron`.
In this case `div` will include `jumbotron` class and `text-center` class.
You can also do `div.example!` - the exclamation mark means that `example` is an `id` instead of a `class`.

This component also renders a `Counter` child component, and passes to it some `props`.

Now let's take a look at the `Counter` component.

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
    div.input_group do
      span.input_group_btn do
        button.btn.btn_default, onclick: method(:dec) do
          text '-'
        end
      end
      input.form_control type: "text", value: store.counter, disabled: true
      span.input_group_btn do
        button.btn.btn_default, onclick: -> { inc } do
          text '+'
        end
      end
    end
  end
end
```

Wow, there is a lot of new things. Let start with the `render` method.
In `h4` we render the header text from `props` - things that were passed from the parent component.

Next one is a button. In this case the `dec` method describes `onclick` behavior.
This method invokes methods from `store`, and renders out the component tree.

The `render!` method re-renders the entire component tree. No worries, there is `virtual-dom` that will only render differences to the actual DOM. It's fast.

Same thing happens with the `inc` method and the `+` button, but we're using a `function` notation to invoke the `dec` method.

In the middle there is an input field that displays the counter value from `store`.

Of course you can store component state in instance variables, it depends on you.

Now we need to take a look at `injections`.
