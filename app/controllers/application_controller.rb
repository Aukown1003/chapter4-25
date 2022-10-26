class ApplicationController < ActionController::Base
  # before_action = controller起動前に実行
  # :authenticate_user! = ログインしていなければログイン画面にリダイレクト
  # except: [:top]　= 指定したアクションを除外。指定しないと上記の使用でずっとリダイレクトする？
  before_action :authenticate_user!, except: [:top]
  # もしそれがdeviseのコントローラーだったら（返り値がtrue）configure_permitted_parametersを呼ぶ。
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
