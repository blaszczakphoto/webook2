class AccountSettingsController < ApplicationController
  def edit
    @account_settings_props = { kindleEmail: current_user.kindle_email }
  end

  def update
  end
end
