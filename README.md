---
layout: page
title: get page url
excerpt: "How to get the url of an intern page without markdown native link mechanism"
---

# jekyll-pageurl

This Jekyll pluging provides a tag `page_url` that takes a reference to an internal page and resolves the final url in the static website. This feature is useful when you can not directly use the markdown link mechanism.

## Examples

### Automatic href inference

```raw
{% page_url _collection/dummy.md %}
```

## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-pageurl"
end
```

And then execute:

```ruby
    bundle install
```

Alternatively install the gem yourself as:

```ruby
    gem install jekyll-pageurl
```

and put this in your ``_config.yml``

```yaml
plugins:
    - jekyll-pageurl
```

## Release notes

### Version 1.0.0

- Initial version, facilitate the resolution of intern site's links