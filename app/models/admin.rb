class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  def self.from_google(**from_google_params)
    return nil unless email =~ /@gmail.com || @tamu.edu\z/
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end