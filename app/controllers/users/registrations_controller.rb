# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new 
    super { |resource|
      if session["devise.provider_data"].present?
        resource.attributes = {
          nickname: session["devise.provider_data"]["info"]["name"],
          email: session["devise.provider_data"]["info"]["email"],
          first_name: session["devise.provider_data"]["info"]["first_name"],
          last_name: session["devise.provider_data"]["info"]["last_name"],
        }
        session["devise.provider_data"]["password"] = Devise.friendly_token[0, 20]
      else
      end
    }
  end

  # POST /resource
  def create
    super { |resource|
      if resource.persisted?
        SnsCredential.create(
          uid: session["devise.provider_data"]["uid"],
          provider: session["devise.provider_data"]["provider"],
          user_id: resource.id
        )
      else
      end
      session["received_form"] = nil
      session["devise.provider_data"] = nil
    }
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def update
    current_user.assign_attributes(account_update_params)
    if current_user.save(context: :account_update)
      redirect_to edit_profile_path(current_user), notice: 'プロフィールを更新しました'
    else
      render 'profiles/edit' 
    end
  end
  
  protected
  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_text, :nickname])
  end
end
