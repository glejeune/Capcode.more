require 'rubygems'
require 'capcode'

begin
  require 'rack/bug'
  RACK_BUG=true
rescue LoadError
  puts "install rack/bug to test it ;)"
  RACK_BUG=false
end

$:.unshift( "../lib" )
require 'capcode/render/erb'

module Capcode
  set :erb, "erb"
  use Rack::Bug if RACK_BUG
  
  class Index < Route '/'
    def get
      @time = Time.now
      render :erb => :cf, :layout => :cf_layout
    end
  end  
end

Capcode.run( )