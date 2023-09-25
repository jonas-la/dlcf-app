class ApplicationController < ActionController::Base
    before_action :authenticate_admin!, unless: :skip_authentication?
  
    private
  
    def skip_authentication?
      # return true
      if (request.path == new_account_members_path) || (request.path == create_account_members_path)
        return true  
      else
        return false 
      end
    end
  end
