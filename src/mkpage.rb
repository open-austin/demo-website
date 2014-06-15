#!/usr/bin/env ruby
require 'erb'

USAGE = "usage: #{$0} page.rhtml"
LAYOUT = File.dirname($0) + "/layout.rhtml"
DEFS = File.dirname($0) + "/defs.erb"

class Page
  attr_accessor :title
  attr_accessor :path
  attr_accessor :content
  attr_accessor :links

  def initialize(fname)
    @layout_src = open(LAYOUT) {|fp| fp.read}
    @content_src = open(fname) {|fp| fp.read}
    @links = {}

    defs_src = open(DEFS) {|fp| fp.read}
    ERB.new(defs_src).result(binding)
  end

  def menu_item(target, description)
    cl = (target == @path ? "active" : "")
    "<li class=\"#{cl}\"><a href=\"#{target}\">#{description}</a></li>"
  end

  def get_binding
    binding
  end

  def generate
    @content = ERB.new(@content_src).result(binding)
    ERB.new(@layout_src).result(binding)
  end

end

raise USAGE unless ARGV.length == 1
fname = ARGV[0]
page = Page.new(fname)
puts page.generate

