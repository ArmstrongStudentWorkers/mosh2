class Admin::UsersController < ApplicationController

  require "#{Rails.root}/lib/mosh_modules/admin_module"
  include MoshModules::AdminModule
  before_filter :admin_filter

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.student = false
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "New User #{@user.name} has been created."
      redirect_to admin_user_path(@user)
    else
      flash[:error] = "The new user could not be created."
      redirect_to admin_users_path
    end
  end

  def update
    @user = User.find(params[:id])
    successfully_updated = if needs_password?(@user, params)
                             @user.update_with_password(params[:user])
                           else
                             params[:user].delete(:current_password)
                             @user.update_without_password(params[:user])
                           end

    if successfully_updated
      flash[:success] = "User updated."
      redirect_to admin_user_path(@user)
    else
      flash[:error] = "User could not be updated."
      redirect_to edit_admin_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head  :no_content }
    end
  end

  private

  def needs_password?(user, params)
    params[:password].present?
  end
end
