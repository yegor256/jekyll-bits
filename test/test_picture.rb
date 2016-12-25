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

require 'test/unit'
require_relative '../lib/jekyll-bits/picture'

# Picture test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2016 Yegor Bugayenko
# License:: MIT
module Jekyll
  class TestPicture < Test::Unit::TestCase
    def test_generates_html_head
      html = JbBox.new.jb_picture_head('jb_picture' => '/img.png')
      assert_match(/meta/, html)
      assert_match(/img\.png/, html)
    end

    def test_generates_html_simple_body
      html = JbBox.new.jb_picture_body('jb_picture' => '/img1.png')
      assert_match(/img/, html)
      assert_match(/figure/, html)
    end

    def test_generates_html_complex_body
      html = JbBox.new.jb_picture_body(
        'jb_picture' => {
          'src' => '/img1.png',
          'href' => 'http://www.yegor256.com',
          'caption' => 'it is <simple>',
          'alt' => "nothing 'to' say",
          'width' => 500
        }
      )
      assert_match(/figcaption/, html)
      assert_match(/figure/, html)
      assert_match(/<figcaption>it is &lt;simple&gt;/, html)
      assert_match(/alt='nothing &#39;to&#39; say'/, html)
      assert_match(/width='500'/, html)
    end
  end
end