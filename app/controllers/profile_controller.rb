class ProfileController < ApplicationController
  def edit_profile
    @user = User.find(session[:user])
    if request.post?
      if @user.update(user_params)
        puts @user.errors.full_messages
        redirect_to account_dashboard_url
      else
        
        render :action=>:edit_profile
      end
    end
  end

  def user_params
    params.permit(:first_name,:last_name,:mobile,:date_of_birth,:image)
  end
end
