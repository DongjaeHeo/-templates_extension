class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    # cookies.permanent[:auth_token] = current_user.authentication_token
  end

  # GET /resource/sign_out
  def destroy
    super
    # cookies.permanent[:auth_token] = nil
  end
end
