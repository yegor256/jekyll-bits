# encoding: utf-8
#
# (The MIT License)
#
# Copyright (c) 2016 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'liquid'

# Jekyll module
module Jekyll
  # All our custom filters
  module JbFilters
    def jb_picture_head(page)
      yaml = page['jb_picture']
      return unless yaml
      if yaml.is_a?(Hash)
        raise "src is absent for jb_picture in #{page.url}" unless yaml['src']
        src = yaml['src']
      else
        src = yaml
      end
      "<meta property='og:image' content='#{src}'/>"
    end

    def jb_picture_body(page)
      yaml = page['jb_picture']
      return unless yaml
      html = "<img itemprop='image' alt='"
      if yaml.is_a?(Hash) && yaml['alt']
        html += CGI.escapeHTML(yaml['alt'])
      else
        html += 'front image'
      end
      html += "' src='"
      if yaml.is_a?(Hash)
        raise "src is absent for jb_picture in #{page.url}" unless yaml['src']
        html += CGI.escapeElement(yaml['src'])
      else
        html += yaml
      end
      html += "'"
      html += " width='#{yaml['width']}'" \
        if yaml.is_a?(Hash) && yaml['width']
      html += " height='#{yaml['height']}'" \
        if yaml.is_a?(Hash) && yaml['height']
      html += '/>'
      html = "<a href='#{CGI.escapeHTML(yaml['href'])}'>#{html}</a>" \
        if yaml.is_a?(Hash) && yaml['href']
      html = "<figure class='jb_picture'>" + html
      html += "<figcaption>#{CGI.escapeHTML(yaml['caption'])}</figcaption>" \
        if yaml.is_a?(Hash) && yaml['caption']
      html + '</figure>'
    end
  end

  # Box for testing and calling static methods.
  class JbBox
    include JbFilters
  end

  # Jekyll block
  class JbPictureBlock < Liquid::Tag
    def render(context)
      JbBox.new.jb_picture_body(context.registers[:page])
    end
  end
end

Liquid::Template.register_filter(Jekyll::JbFilters)
Liquid::Template.register_tag('jb_picture_body', Jekyll::JbPictureBlock)
