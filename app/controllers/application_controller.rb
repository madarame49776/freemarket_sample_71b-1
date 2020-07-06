class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_ancestry


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
    keys: [:nickname,  :birthday, :first_name,
           :last_name, :first_name_kana, :last_name_kana,])
  end


  #Basic認証の導入
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def set_ancestry
    @parents = Category.where(ancestry: nil)
  end

end
