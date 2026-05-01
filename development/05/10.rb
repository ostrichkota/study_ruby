def h1(text, **options)
  p options
  "<h1 class='#{options[:html_class]}'>#{text}<h1>"
end

p h1("Hello world", html_class: "title")


def h1(text, **options)
  p options
  "<h1 id='#{options[:html_id]} class='#{options[:html_class]}'>#{text}<h1>"
end

p h1("Hello world", html_class: "title", html_id: "book")