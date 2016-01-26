class UsersController < ApplicationController
  before_action :authorize_user, only: [:destroy, :index]
  def show
    @user = current_user
    @events = @user.events
  end

  def index
  end

  def edit
    @user = current_user
  end

  def create
  end

  def destroy
  end
end
