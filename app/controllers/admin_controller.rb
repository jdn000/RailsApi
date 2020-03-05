class AdminController < ApplicationController
  before_action :authorize_request
  before_action :check_admin

  # GET /users
  def list_users
   @users = User.all
    render json: @users, status: :ok
  end
  # DELETE /users/{username}
  def destroy
    @user=User.find_by_username(params[:username])
    @user.activated=false
    @user.save
    render json:{message: 'Action completed'}, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
  private
  def check_admin
    # @user=User.find_by_username(params[:username])
    unless @current_user.role =='admin'
      render json: { errors: 'Not allowed' }, status: :forbidden
    end
    end
end
