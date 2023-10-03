class ApplicationController < ActionController::Base
     
    before_action :authenticate_admin!, unless: :skip_authentication?
    before_action :check_role, if: :check_login?
    
    # before_action :authenticate_admin!
  
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
    

    def check_login?
      if current_admin.nil?
        return false
      else
        return true
      end
    end

    def check_role
      puts "!!! See check role ran"
      user_email = current_admin.email
      @user = Member.find_by(email: user_email)
      path_string = request.path.to_s
      if @user.is_admin
        puts "User is Officer"
        officer_illegal_paths = ["member", "new_feedback_path", "attendances/new", "/feedbacks/new"]
        officer_illegal_paths.each do |substring|
          if path_string.include?(substring)
            sign_out_all_scopes
            redirect_to new_admin_session_path
          end
        end
      else
        puts "User is Member"
        member_illegal_paths = ["officer"]
        member_illegal_paths.each do |substring|
          if path_string.include?(substring)
            sign_out_all_scopes
            redirect_to new_admin_session_path
          end
        end
      end
    end
  
    
