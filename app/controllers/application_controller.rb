class ApplicationController < ActionController::Base
    
    before_action :set_room 
   
    private
    
    def set_room 
        @user = current_user
    end
end
