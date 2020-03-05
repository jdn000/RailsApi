class UsersController < ApplicationController
  before_action :require_activated,:authorize_request , except: [:create]

  # GET /users
  def index
    render json: {message1: 'hello',
                  message2:'world',
                  status: :ok,
    }
  end
  def show
    render json: @current_user, status: :ok
  end
  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @current_user.update(user_params)
      render json: { errors: @current_user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(
         :name,:last_name, :username, :email, :password, :description,:role,:activated
    )
  end
  def require_activated
    if @user != nil
      unless @user.activated
        render json: { errors: 'Contact to administrator' }, status: :not_found
      end
    end
  end
end