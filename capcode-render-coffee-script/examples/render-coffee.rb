require 'rubygems'
require 'capcode'
require 'capcode/render/markaby'
$:.unshift( "../lib" )
require 'capcode/render/coffee'


module Capcode
  set :coffee, "coffee", {:no_wrap => true}
  
  class Index < Route '/'
    def get
      @time = Time.now
      render :markaby => :index, :layout => :glop
    end
  end
  
  class Script < Route '/coffee'
    def get
      render :coffee => :alert
    end
  end
end

module Capcode::Views
  def glop
    html do
      head do
        script :type => "text/javascript", :src => "/coffee"
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