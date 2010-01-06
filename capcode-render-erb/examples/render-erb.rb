require 'rubygems'
require 'capcode'
require 'rack/bug'
$:.unshift( "../lib" )
require 'capcode/render/erb'

module Capcode
  set :erb, "erb"
  use Rack::Bug
  
  class Index < Route '/'
    def get
      @time = Time.now
      render :erb => :cf, :layout => :cf_layout
    end
  end  
end

Capcode.run( )