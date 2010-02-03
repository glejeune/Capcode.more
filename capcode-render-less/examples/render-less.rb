require 'rubygems'
require 'capcode'
require 'capcode/render/markaby'
$:.unshift( "../lib" )
require 'capcode/render/less'

module Capcode
  set :less, "less"
  
  class Index < Route '/'
    def get
      @time = Time.now
      render :markaby => :index, :layout => :glop
    end
  end
  
  class Style < Route '/less'
    def get
      render :less => :style
    end
  end
end

module Capcode::Views
  def glop
    html do
      head do
        link :href => URL(Style), :rel => 'stylesheet', :type => 'text/css'
      end
      body do
        yield
      end
    end
  end
  
  def index
    h1 "Hello !"
    p "It's #{@time}"
    a "Try Coffee !", :href => "javascript:alert_me();"
  end
end

Capcode.run( )