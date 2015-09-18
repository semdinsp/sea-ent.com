


module Nesta
  module Navigation
    module Renderers
      def current_menu_item_class
              'active'
            end
    end
  end
  class App
    not_found do
      cache haml("404".to_sym)
    end
  end
end