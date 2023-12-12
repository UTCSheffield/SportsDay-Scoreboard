class AdminController < ApplicationController
    include UserRoles
    before_action :authorize_admin
    def index; end
    def console; end
end