class ApplicationController < ActionController::Base
    
    protected

    def authorize_request(kind = nil)
        unless kind.include?(current_ei_user.role)
            redirect_to root_path, notice: "No estás autorizado"
        end
    end
end
