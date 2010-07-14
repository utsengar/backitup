require "wx"
include Wx 


class Gui < App
   def on_init
        Frame.new(nil, -1, "The Bare Minimum").show()
   end
end


Gui.new.main_loop
