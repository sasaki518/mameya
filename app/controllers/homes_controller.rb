class HomesController < ApplicationController
    
    def lp
      render :layout => "user"
    end
    
    def lp2
        render :layout => "shop"
    end
end
