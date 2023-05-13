# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true

#set :sass_assets_paths, ['sources/stylesheets']

# Activate the syntax highlighter
activate :syntax

activate :sprockets

# Github pages require relative links
activate :relative_assets
set :relative_links, true
