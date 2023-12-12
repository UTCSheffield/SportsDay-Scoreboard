class AuthController < ApplicationController
  require 'jwt'
  require 'httparty'

  API_SERVER = 'https://utc-olp-api-proxy.glitch.me'
  def index
    session[:callbackURL] = nil
    callbackURL = "#{root_url}/auth/callback"
    redirect_to "#{API_SERVER}/connect/microsoft?callback=#{callbackURL}", allow_other_host: true
    if params[:callback].present?
      session[:callbackURL] = params[:callback]
    end
  def callback
    session[:grant] = {
      #      access_token: params[:access_token],
      user: false,
    }
    begin
      seconds_since_epoch = Time.now.to_i
      id_claims = JWT.decode(params[:id_token], nil, false).first

      if seconds_since_epoch >= id_claims['nbf'] && seconds_since_epoch <= id_claims['exp']
        access_claims = JWT.decode(params[:access_token], nil, false).first
        puts "PASSED ACCESS ClAIMS STEP"
        if seconds_since_epoch >= access_claims['nbf'] && seconds_since_epoch <= access_claims['exp']
          response = HTTParty.post("#{API_SERVER}/sportsday/roles/", 
            body: { access_token: params[:access_token] })

          session[:grant][:user] = {
            #name: access_claims['name'],
            #            family_name: access_claims['given_name'],
            #            given_name: access_claims['given_name'],
            email: access_claims['upn'],
            roles: response.parsed_response
          }
          puts "HIT REDIRECT"
          puts session[:grant][:user][:roles]
          if session[:callbackURL].present?
            redirect_to session[:callbackURL]
          else
            redirect_to root_path
          end
        end
        end
      rescue => e
        session[:grant][:user] = false
         render :file => "#{Rails.root}/public/401.html",  :status => 401
      end
  end
  end
  def logout
    session[:grant] = {
      user: false
    }
    redirect_to root_path
  end
end