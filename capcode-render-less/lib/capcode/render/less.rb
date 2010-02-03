begin
  require 'less'
rescue LoadError => e
  raise MissingLibrary, "less could not be loaded (is it installed?): #{e.message}"
end

module Capcode
  module Helpers
    def render_less( f, opts ) #:nodoc:
      if @less_path.nil?
        @less_path = Capcode::Configuration.get( :less ) || Capcode.static()
      end

      f = f.to_s
      if f.include? '..'
        return [403, {}, '403 - Invalid path']
      end
      
      if /Windows/.match( ENV['OS'] )
        unless( /.:\\/.match( @less_path[0] ) )
          @less_path = File.expand_path( File.join(".", @less_path) )
        end
      else
        unless( @less_path[0].chr == "/" )
          @less_path = File.expand_path( File.join(".", @less_path) )
        end
      end
      
      # Get less File
      f = f + ".less" if File.extname( f ) != ".less"
      file = File.join( @less_path, f )
      
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