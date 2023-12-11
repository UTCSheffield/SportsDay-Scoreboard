module UserRoles
  extend ActiveSupport::Concern
  included do
    def authorize_admin
      puts "Authorizing Admin..."
      unless user_admin?
        puts "Not authorized!"
        render_unauthorized
      end
    end

    def authorize_scorer
      puts "Authorizing Scorer..."
      unless user_scorer?
        puts "Not authorized!"
        render_unauthorized
      end
    end
  end

  def user_admin?
    user_roles_present? && session[:grant]["user"]["roles"]['admin'] == true
  end

  def user_scorer?
    user_roles_present? && session[:grant]["user"]["roles"]["scorer"] == true
  end

  private

  def user_roles_present?
    session[:grant].present? && session[:grant]["user"] != false && session[:grant]["user"]["roles"].present?
  end

  def render_unauthorized
    redirect_to "/auth?callback=#{request.fullpath}"
  end
end
