module Capcode
  module Helpers
    def render_binary( f, opts ) #:nodoc:
      @response['Content-Type'] = opts.delete(:content_type)||opts.delete('Content-Type')||"binary/octet-stream"
      opts.each do |k, v|
        k = k.to_s.split(/_/).map{|e| e.capitalize}.join("-")
        @response[k] = v
      end
      
      self.send(f) 
    end
  end
end