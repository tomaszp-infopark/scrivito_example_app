class SessionsController < ApplicationController

  def create
    if "#{params[:password]}" == "#{Rails.application.editor_password}"
      User.new("name").add_to_session(session)
      message = nil
    else
      User.clear_session(session)
      message = "Wrong editor password"
    end
    begin
      redirect_to(request.referer, alert: message)
    rescue
      redirect_to('/', alert: message)
    end
  end

  def destroy
    User.clear_session(session)
    redirect_to(request.referer) rescue redirect_to('/')
  end

end
