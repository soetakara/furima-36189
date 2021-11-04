class ItemsController < ApplicationController
  before_action :sign_in_check, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  private
  def sign_in_check
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end
end
