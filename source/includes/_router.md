# Router

`Router` is a `component`, but also an `injection`. It's a separate gem named `inesita-router`.

With router you are able to render the component tree depending on current URL.

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

First of all, it includes `Inesita::Router`.

In the `routes` method, we provide information about which components are rendered on what URL.

On the root path, which is `/`, we render the `Home` component.
On `/description` URL, the router will render the `Description` component.
On `/secret` URL, the router will check if the user is logged in. If not, it will redirect to `/login`.
On `/login` URL, the router will render the `Login` component.

You can pass `props` to child compontents like always.

Router as an `injection` provides a few useful methods:

- `url_for(:name)` method returns a URL for a given route.
- `current_url?(:name)` method returns `true` if a given route is currently set.

When we're using `inesita-router`, `onclick` events are handled by the router automatically.
