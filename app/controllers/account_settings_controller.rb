class AccountSettingsController < ApplicationController
  def edit
    @account_settings_props = { kindleEmail: current_user.kindle_email }
  end

  def update
    current_user.kindle_email = params.fetch("kindle_email")
    current_user.save
  end
end
