require 'rubygems'
require 'mime/types'

module Capcode
  module Helpers
    def render_static( f, opts = {} ) #:nodoc:
      # Update options
      opts = { :exact_path => true }.merge(opts)
      opts = (Capcode::Configuration.options[:static] || {}).merge(opts)
      
      # Path with ".." not allowed
      if Capcode.static.nil? or f.include? '..'
        return [403, {}, '403 - Invalid path']
      end
      
      # Update Content-Type
      if opts.keys.include?(:content_type)
        @response['Content-Type'] = opts[:content_type]
      else
        @response['Content-Type'] = MIME::Types.type_for(File.join( static[:path], f ))[0].content_type
      end
      
      if !opts.keys.include?(:exact_path) or opts[:exact_path] == true
        redirect File.join( static[:uri], f )
      else
        File.read( File.join( static[:path], f ) ).to_s
      end
    end
  end
end