class HomesController < ApplicationController
    def hogehoge1
        render :layout => "user"
    end
    
    def hogehoge2
        render :layout => "shop"
    end
end
