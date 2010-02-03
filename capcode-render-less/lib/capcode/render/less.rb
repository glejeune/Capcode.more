begin
  require 'coffee-script'
rescue LoadError => e
  raise MissingLibrary, "coffee-script could not be loaded (is it installed?): #{e.message}"
end

module Capcode
  module Helpers
    # Set the path to Coffee files. If this path is not set, Capcode will search in the static path.
    # This method is deprecated and will be removed in version 1.0
    def self.coffee_path=( p )
      warn "Capcode::Helpers.coffee_path is deprecated and will be removed in version 1.0, please use `set :coffee'"
      Capcode::Configuration.set :coffee, p
    end
    
    def render_less( f, opts ) #:nodoc:
      if @coffee_path.nil?
        @coffee_path = Capcode::Configuration.get( :coffee ) || Capcode.static()
      end

      f = f.to_s
      if f.include? '..'
        return [403, {}, '403 - Invalid path']
      end
      
      if /Windows/.match( ENV['OS'] )
        unless( /.:\\/.match( @coffee_path[0] ) )
          @coffee_path = File.expand_path( File.join(".", @coffee_path) )
        end
      else
        unless( @coffee_path[0].chr == "/" )
          @coffee_path = File.expand_path( File.join(".", @coffee_path) )
        end
      end
      
      # Get coffee File
      f = f + ".less" if File.extname( f ) != ".less"
      file = File.join( @coffee_path, f )
      
      # Set content-type
      @response['Content-Type'] = "text/css"
      
      # Render
      if( File.exist?( file ) )
        Less::Engine.new(open(file)).to_css
      else
        raise Capcode::RenderError, "Error rendering `less', #{file} does not exist !"
      end
    end
  end
end