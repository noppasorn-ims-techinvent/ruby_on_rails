class SessionsController < ApplicationController
    before_action :require_login, only: %i[destroy]

    def new

    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])  
            session[:user_id] = user.id  
            flash[:notice] = "Logged in successfully, #{user.username}!."
            redirect_to user_path(user)  
        else
            flash.now[:alert] = "There was something wrong with your login details."
            render :new, status: :unprocessable_entity
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out!"
        redirect_to root_path
    end

    private
    def require_login
        unless logged_in?
          flash[:alert] = "You must be logged in to access this section"
          redirect_to login_path
        end
      end
end