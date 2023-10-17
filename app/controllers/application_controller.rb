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

      #Does not authenticate if running tests
      if OmniAuth.config.test_mode
        return true
      end
      # return true #TODO remove me when Rspec can do this
      # This is the list of routes to not authenticate for
      skip_auth_paths = [event_schedule_path,new_account_members_path, create_account_members_path, attendances_url, new_pending_member_path, pending_members_path]
      skip_auth_paths.each do |route|
        if request.path.to_s == route
          return true
          break
        end
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

      puts "Checking role"
      user_email = current_admin.email
      @user = Member.find_by(email: user_email)
      path_string = request.path.to_s

      puts "current path = "
      puts path_string

      # handles the access for different user types
      if @user.is_admin
        # triggers if logged in user is an officer

        puts "User is Officer"

        # list of strings for paths officers CANNOT access
        officer_illegal_paths = ["member_dashboard", "new_feedback_path", "attendances/new", "/feedbacks/new", "member_index", "member_show"]
        officer_illegal_paths.each do |substring|
          if path_string.include?(substring)
            sign_out_all_scopes
            redirect_to new_admin_session_path
          end
        end
      else

        # triggers if logged in user is NOT an officer
        # it first will reroute the member if this is not a legal path
        # then it reroutes the member if the path contains an illegal key word
        puts "User is Member"


        # list of string for paths members CAN access
        member_legal_partial_paths = ["member", "new_feedback_path", "attendances/new", "/feedbacks/new", "googleoauth2", "/attendances", "/feedbacks", "/event_schedule", "/schedule_show"]
        @legal_substring_found = false
        member_legal_partial_paths.each do |substring|
          if (path_string.include?(substring))
            @legal_substring_found = true
          end
        end

        # list of string for paths members CANNOT access
        member_illegal_partial_paths = ["edit", "delete"]
        @illegal_substring_found = false
        member_illegal_partial_paths.each do |substring|
          if (path_string.include?(substring))
            @illegal_substring_found = true
          end
        end

        # only lets the member proceed if both checks go through
        if (@legal_substring_found && (@illegal_substring_found == false))
          puts "valid substring proceed to render"
        else
          sign_out_all_scopes
          redirect_to new_admin_session_path
        end
      end
    end
    
  end