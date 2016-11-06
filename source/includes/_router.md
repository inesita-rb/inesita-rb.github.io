# Router

`Router` is an component but also an injection. It's a separate gem named `inesita-router`.

With router you are able to render components tree depending on current URL.

```ruby
class Router
  include Inesita::Router

  def auth
    unless store.logged_in?
      go_to('/login')
    end
  end

  def routes
    route '/', to: Home
    route '/description', to: Description

    route '/secret', to: List, on_enter: method(:auth)
    route '/login', to: Login
  end
end
```

This class describes how our router will work.

First of all it includes `Inesita::Router`

In `routes` we provide information what components are rendered on what URL.

On root path with is `/` we render `Home` component
On `/descption` url router will render `Description` compoentn
On `/secret` url router will check if user is logged in. If not will redirect to `/login`
On `/login` url router will render `Login` component

You can pass `props` to child compontents like always.

Router as an `injection` provides few usefull methods:

- `url_for(:name)` method return a URL for a given route.
- `current_url?(:name)` method return `true` if a given route is currently set.

When we're using an `inesita-router`, `onclick` events are handled by the router.
