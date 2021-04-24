  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      # resource に Admin か Customerが来る
      if resource.is_a?(Admin)
        admin_root_path
      elsif resource.is_a?(Customer)
        customers_my_page_path # ログイン後に遷移するpathを設定
      end
    end

    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone_number, :postal_code, :address])
      end
  end
