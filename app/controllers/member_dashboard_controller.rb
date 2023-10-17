class MemberDashboardController < ApplicationController
  def index
    @org_info = Orginfo.first
    officers_to_ignore = [
      "jonasaustinland@tamu.edu", "daniel14676@tamu.edu", "adampinto@tamu.edu", 
      "isabelle.grimesey@tamu.edu", "markbaca42@tamu.edu"
    ]
    @officers = Member.where(is_admin: true).where.not(email: officers_to_ignore).all
  end
end
