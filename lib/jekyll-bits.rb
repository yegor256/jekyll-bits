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

module Jekyll
  module JbFilters
    def jb_picture_head(page)
      yaml = page['jb_picture']
      return unless yaml
      if yaml.kind_of?(Array)
        src = yaml['src']
      else
        src = yaml
      end
      "<meta property='og:image:url' content='#{src}'/>"
    end

    def jb_picture_body(page)
      yaml = page['jb_picture']
      return unless yaml
      if yaml.kind_of?(Array)
        "<figure class='jb_picture'><a" +
          " href='#{CGI.escapeElement(yaml['href'])}'>" +
          "<img alt='#{CGI.escapeElement(yaml['alt'])}'" +
          " src='#{CGI.escapeElement(yaml['src'])}'/></a></figure>"
      else
        "<figure class='jb_picture'><img" +
          " alt='front picture'" +
          " src='#{CGI.escapeElement(yaml)}'/></figure>"
      end
    end
  end

  class JbPictureBlock < Liquid::Tag
    def render(context)
      JbFilters::jb_picture_body(context.registers[:page])
    end
  end
end

Liquid::Template.register_filter(Jekyll::JbFilters)
Liquid::Template.register_tag('jb_picture_body', Jekyll::JbPictureBlock)
