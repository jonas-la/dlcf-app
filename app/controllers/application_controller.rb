class ApplicationController < ActionController::Base
    
    # This will make user is logged into a google account before giving them access to any page
    before_action :authenticate_admin!, unless: :skip_authentication?

    # This will check whether a logged in user has access to a particular page
    before_action :check_role, if: :is_logged_in?
  

    def is_skipped?
      return skip_authentication?
    end

    private

    # This will allow the user to skip authentication for certain pages
    def skip_authentication?
      # Does not authenticate if running tests
      return true if OmniAuth.config.test_mode

      # return true #TODO remove me when Rspec can do this
      # This is the list of routes to not authenticate for
      skip_auth_paths = [
        event_schedule_path, new_account_members_path, create_account_members_path, attendances_url, 
        new_pending_member_path, pending_members_path
      ]
      skip_auth_paths.each do |route|
        return true if request.path.to_s == route
      end

      puts request.path.to_s
      if request.path.to_s.include?("schedule_show")
        return true
      end

      return false 
      
    end 
    
    # This checks ether the user is logged into a google account
    def is_logged_in?
      if current_admin.nil?
        return false
      else
        return true
      end
    end

    # this checks what the user's role is and redirects them if they don't have access permission 
    def check_role
      user_email = current_admin.email
      @user = Member.find_by(email: user_email)
      path_string = request.path.to_s
    
      if @user.is_admin
        handle_admin_access(path_string)
      else
        handle_member_access(path_string)
      end
    end    
    
    def handle_admin_access(path_string)
      illegal_paths = [
        "member_dashboard", "new_feedback_path", "attendances/new", 
        "/feedbacks/new", "member_index", "member_show"
      ]
      
      sign_out_and_redirect if contains_illegal_path?(path_string, illegal_paths)
    end
    
    def handle_member_access(path_string)
      legal_paths = [
        "member", "new_feedback_path", "attendances/new", "/feedbacks/new", 
        "googleoauth2", "/attendances", "/feedbacks", "/event_schedule", "/schedule_show"
      ]
      illegal_paths = %w[edit delete]
    
      if contains_illegal_path?(path_string, 
                                illegal_paths
                               ) || !contains_legal_path?(path_string, legal_paths)

        sign_out_and_redirect
      end
    end
    
    def contains_illegal_path?(path_string, illegal_paths)
      illegal_paths.any? { |substring| path_string.include?(substring) }
    end
    
    def contains_legal_path?(path_string, legal_paths)
      legal_paths.any? { |substring| path_string.include?(substring) }
    end
    
    def sign_out_and_redirect
      sign_out_all_scopes
      redirect_to(new_admin_session_path)
    end
    
  end
