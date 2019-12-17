# MIT License
#
# Copyright (c) 2019 Sébastien Andreo
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

module Jekyll
    class PageUrl  < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            values = text.split(',')

            @link = nil
            @url = nil

            if(values.length != 1)
                raise ArgumentError.new <<-eos
                wrong format "#{@text}" in tag 'page_url'.
                eos
            end

            @url = values[0].strip
   
            urlvalues = @url.split('#')
                 
            if urlvalues.length == 1
                @link = urlvalues[0].strip
            else
                @link = urlvalues[0].strip
                @anchor = urlvalues[1].strip
            end
        end

        def render(context)
            site = context.registers[:site]
        
            site.each_site_file do |p|


                if @link == p.relative_path 
                    if @anchor != nil
                        full_url=  site.config["baseurl"] +  p.url + "/#" + @anchor
                    else
                        full_url=  site.config["baseurl"] +  p.url
                    end
    
                    return "#{ full_url }"
                end
            end
            raise ArgumentError.new <<-eos
                Could not find page "#{@link}" in tag 'page_url'.
                Make sure the post exists and the name and date is correct.
                eos
        end   
    end
end

Liquid::Template.register_tag('page_url', Jekyll::PageUrl)