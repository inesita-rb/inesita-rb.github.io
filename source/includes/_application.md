# Application

Let's figure out what actually happening. Main file is `app/application.rb`.
This is where all the magic starts.

```ruby
# require Inesita
require 'inesita'
require 'inesita-router'

# require main parts of application
require 'router'
require 'store'

# require all components
require_tree './components'

# when document is ready render application to <body>

class Application
  include Inesita::Component

  inject Router
  inject Store

  def render
    div.container do
      component NavBar
      component router
    end
  end
end


Inesita::Browser.ready? do
  Application.mount_to(Inesita::Browser.body)
end
```

Here you can require all project files, external gems etc.

- `require 'inesita' - require our framework
- `require 'inesita-router'` - we're need a router to handle URLS
- `require 'router'` - require our configured router
- `require 'store'` - require our store
- `require_tree './components'` - require all other components placed in `components` dir

`Application` is the main component. As we can see we injecting `Router` and `Store`,
so they will be available in all component tree as `router` and `store`

We will need them. In `store` we will store all application state and data,
`router` will render our component tree depending on browser URL.

`render` method defines how what Inesita will render our components.
It's like a layout, within `div` with `container` class `NavBar` and `router` will be rendered.

Last part is mounting our application. When document is ready, our main component will be mount into `<body></body>` tag.

Now take a closer look at component.
