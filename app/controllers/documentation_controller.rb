class DocumentationController < ApplicationController
    def user_documentation
        @org_info = Orginfo.first
    end

    def admin_documentation
        @org_info = Orginfo.first
    end
end