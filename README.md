[![DevOps By Rultor.com](http://www.rultor.com/b/yegor256/jekyll-bits)](http://www.rultor.com/p/yegor256/jekyll-bits)
[![We recommend RubyMine](http://img.teamed.io/rubymine-recommend.svg)](https://www.jetbrains.com/ruby/)

[![Build Status](https://travis-ci.org/yegor256/jekyll-bits.svg)](https://travis-ci.org/yegor256/jekyll-bits)
[![Gem Version](https://badge.fury.io/rb/jekyll-bits.svg)](http://badge.fury.io/rb/jekyll-bits)
[![Dependency Status](https://gemnasium.com/yegor256/jekyll-bits.svg)](https://gemnasium.com/yegor256/jekyll-bits)
[![Code Climate](http://img.shields.io/codeclimate/github/yegor256/jekyll-bits.svg)](https://codeclimate.com/github/yegor256/jekyll-bits)

It's a collection of very simply and useful [Jekyll](https://jekyllrb.com/) plugins,
which I'm using on [my blog](https://github.com/yegor256/blog).

To start, add it to your `_config.yml`:

```yaml
gems:
  - jekyll-bits
```

# `jb_picture`

Add this to the [front matter](https://jekyllrb.com/docs/frontmatter/) of
your Jekyll page:

```yaml
---
jb_picture: http://...
---
```

Or with more details:

```yaml
---
jb_picture:
  src: ... SRC attribute of <IMG>
  alt: ... ALT attribute of <IMG>
  href: ... HREF attribute of <A>
---
```

Then, in the HTML `<head>`:

```liquid
{{ page | jb_picture_head }}
```

And in the HTML `<body>`:

```liquid
{{ page | jb_picture_body }}
```

Or this way:

```liquid
{% jb_picture_body %}
```

# License

(The MIT License)

Copyright (c) 2016 Yegor Bugayenko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
