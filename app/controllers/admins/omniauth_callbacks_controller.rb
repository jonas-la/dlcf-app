class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      # admin = Admin.from_google(from_google_params)
      admin = Admin.from_google(**from_google_params)
  
      if admin.present?
        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect admin, event: :authentication
      else
        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
        redirect_to new_admin_session_path
      end
    end
  
    protected
  
    def after_omniauth_failure_path_for(_scope)
      new_admin_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      # TODO add check for all the admins from member table
      if ["jonasaustinland@tamu.edu", "adampinto@tamu.edu", "daniel14676@tamu.edu", "isabelle.grimesey@tamu.edu", "markbaca42@tamu.edu"].include?(auth.info.email)
        officer_dashboard_index_path
      else
        member_dashboard_index_path
      end
      # stored_location_for(resource_or_scope) || root_path
    end
  
    private
  
    def from_google_params
      @from_google_params ||= {
        uid: auth.uid,
        email: auth.info.email,
        full_name: auth.info.name,
        avatar_url: auth.info.image
      }
    end
  
    def auth
      @auth ||= request.env['omniauth.auth']
    end
  end