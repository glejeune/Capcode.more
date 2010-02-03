module Capcode
  module Helpers
    def render_none( f = "", _ ) #:nodoc:
      warn( "none renderer is deprecated, please use `render( 204 => ... )'" )
      return [204, {}, f]
    end
  end
end