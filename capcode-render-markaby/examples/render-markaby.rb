require 'rubygems'
require 'capcode'
$:.unshift( "../lib" )
require 'capcode/render/markaby'

module Capcode
  set :markaby, { :indent => 2 }
  
  class Index < Route '/'
    def get
      @time = Time.now()
      render :markaby => :index, :layout => :glop
    end
  end  
end

module Capcode::Views
  def glop
    html do
      body do
        yield
      end
    end
  end
  
  def index
    h1 "Hello !"
    p "il est #{@time}"
  end
end

Capcode.run( )