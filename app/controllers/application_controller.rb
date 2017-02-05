class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #devise機能で最初からあるもの（id,emailなど）以外で、後からカラムに追加したものは以下の記述でカラム更新できるようにする。:acount_updateの部分はapp/controllers/devise/registrations_controller.rbを見る（ただし、Deviseをインストールしてもそのコントローラは生成されません。Deviseが内部的に持っているコントローラが使用されます。そのため、Deviseのコントローラの挙動を変えたい場合は、そのDeviseのコントローラクラスを継承した独自のコントローラを作成する必要があります。）
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end 
end
