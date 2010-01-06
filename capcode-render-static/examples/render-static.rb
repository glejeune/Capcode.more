require 'rubygems'
require 'capcode'
$:.unshift( "../lib" )
require 'capcode/render/static'

module Capcode
  set :static, "static"
  set :verbose, true
  
  class Index < Route '/'
    def get
      render :static => "index.html"
    end
  end  
  class Path < Route '/path'
    def get
      render :static => "index.html", :exact_path => false
    end
  end  
end

Capcode.run( )