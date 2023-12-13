module UserRoles
  extend ActiveSupport::Concern
  included do
    def authorize_admin
      puts "Authorizing Admin..."
      if user_roles_present?
        if user_admin?
          puts "Authorized!"
        else
          render plain: "Not authorized!", status: 403
          puts "Not authorized!"
        end
      else
        puts "Not authorized!"
        redirect_to_login
      end
    end
    def authorize_scorer
      puts "Authorizing Scorer..."
      if user_roles_present?
        if user_scorer?
          puts "Authorized!"
        else
          render plain: "Not authorized!", status: 403
          puts "Not authorized!"
        end
      else
        puts "Not authorized!"
        redirect_to_login
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

  def redirect_to_login
    redirect_to "/auth?callback=#{request.fullpath}"
  end
end
