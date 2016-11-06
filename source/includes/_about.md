# About

Inesita is a simple, light, Ruby front-end framework. Yes, Ruby, it's all about Ruby, and its ecosystem.

The main part is `component`. Component describes the appearance and behavior of the page.
This is a core of Inesita. Components can be used alone and mount in any DOM element. You don't need to use the entire stack.
Moreover `component` supports `injections`.
You can inject any of other classes into the main component. They will be available to all nested components. For example, you can inject a `Store` class to store your application data. Of course, implementation of `store` entirely depends on you.
Another example of the injection is `router`. Router take care of all navigation stuff like rendering component tree depending on browser URL, changing URL etc.
