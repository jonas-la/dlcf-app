class Admins::SessionsController < Devise::SessionsController
    def after_sign_out_path_for(_resource_or_scope)
      new_admin_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end
    
    def new
      @org_info = Orginfo.first
      officers_to_ignore = ["jonasaustinland@tamu.edu", "daniel14676@tamu.edu", "adampinto@tamu.edu", "isabelle.grimesey@tamu.edu", "markbaca42@tamu.edu"]
      @officers = Member.where(is_admin: true).where.not(email: officers_to_ignore).all
    end
  end