class ProfilesController < ApplicationController
  before_action :authenticate_user! ,only: [:edit]
  def edit
  end
end
