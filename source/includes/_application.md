# Application

Now we know how components work, so lets build an application!

`app/application.rb` This is where all magic starts.
Here you can include all project files, external gems etc.
The most important part is your root component.

```ruby
class Application
  include Inesita::Component

  inject Router
  inject Store

  def render
  end
end

Application.mount_to($document.body)
```

This is where we configure all parts of our application, and where we mount it.
This application will use `Router` object as a router, `Store` object as a store.
In this case application will mount in `<body></body>`.
